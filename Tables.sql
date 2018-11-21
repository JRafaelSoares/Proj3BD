----------------------------------------
-- Drop cascade
----------------------------------------

drop table Camara cascade;
drop table Video cascade;
drop table SegmentoVideo cascade;
drop table Local cascade;
drop table vigia cascade;
drop table EventoEmergencia cascade;

drop table ProcessoSocorro cascade;
drop table EntidadeMeio cascade;
drop table Meio cascade;
drop table MeioCombate cascade;
drop table MeioApoio cascade;
drop table MeioSocorro cascade;

drop table Transporta cascade;
drop table Alocado cascade;
drop table Acciona cascade;
drop table Coordenador cascade;
drop table Audita cascade;
drop table Solicita cascade;

----------------------------------------
-- Table Creation
----------------------------------------

-- Named constraints are global to the database.
-- Therefore the following use the following naming rules:
--   1. pk_table for names of primary key constraints
--   2. fk_table_another for names of foreign key constraints

create table Camara
    (numCamara numeric not null,
     constraint pk_Camara primary key(numCamara));

create table Video
    (dataHoraInicio timestamp not null,
     dataHoraFim timestamp not null check(dataHoraFim > dataHoraInicio),
     numCamara numeric not null,
     constraint pk_Video primary key(dataHoraInicio, numCamara),
     constraint fk_Video_Camara foreign key(numCamara) references Camara(numCamara));

create table SegmentoVideo
    (numSegmento numeric not null,
     duracao time not null,
     dataHoraInicio timestamp not null,
     numCamara numeric not null,
     constraint pk_SegmentoVideo primary key(numSegmento, dataHoraInicio, numCamara),
     constraint fk_SegmentoVideo_Video foreign key(dataHoraInicio, numCamara) references Video(dataHoraInicio, numCamara));

create table Local
    (moradaLocal varchar(80) not null,
     constraint pk_Local primary key(moradaLocal));

create table Vigia
    (moradaLocal varchar(80) not null,
     numCamara numeric not null,
     constraint pk_Vigia primary key(moradaLocal, numCamara),
     constraint fk_Vigia_Local foreign key(moradaLocal) references Local(moradaLocal),
     constraint fk_Vigia_Camara foreign key(numCamara) references Camara(numCamara));

create table ProcessoSocorro
   (numProcessoSocorro numeric  not null,
    constraint pk_ProcessoSocorro primary key(numProcessoSocorro));

create table EventoEmergencia
    (numTelefone numeric(9) not null,
     instanteChamada timestamp not null,
     nomePessoa varchar(80) not null, 
     moradaLocal varchar(80) not null,
     numProcessoSocorro numeric,
     unique(numTelefone, nomePessoa),
     constraint pk_EventoEmergencia primary key(numTelefone,instanteChamada),
     constraint fk_EventoEmergencia_Local foreign key(moradaLocal) references Local(moradaLocal),
     constraint fk_EventoEmergencia_ProcessoSocorro foreign key(numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro));

create table EntidadeMeio
   (nomeEntidade    varchar(80) not null,
    constraint pk_EntidadeMeio primary key(nomeEntidade));

create table Meio
   (numMeio numeric not null,
    nomeMeio    varchar(80) not null,
    nomeEntidade varchar(80)    not null,
    constraint pk_Meio primary key(numMeio, nomeEntidade),
    constraint fk_Meio_EntidadeMeio foreign key(nomeEntidade) references EntidadeMeio(nomeEntidade));

create table MeioCombate
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    constraint pk_MeioCombate primary key(numMeio, nomeEntidade),
    constraint fk_MeioCombate_Meio foreign key(numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade));

create table MeioApoio
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    constraint pk_MeioApoio primary key(numMeio, nomeEntidade),
    constraint fk_MeioApoio_Meio foreign key(numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade));

create table MeioSocorro
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    constraint pk_MeioSocorro primary key(numMeio, nomeEntidade),
    constraint fk_MeioSocorro_Meio foreign key(numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade));

create table Transporta
   (nomeEntidade varchar(80) not null,
    numMeio numeric not null,
    numProcessoSocorro numeric not null,
    numVitimas numeric not null,
    constraint pk_Transporta primary key(nomeEntidade, numMeio, numProcessoSocorro),
    constraint fk_Transporta_MeioSocorro foreign key (numMeio, nomeEntidade) references MeioSocorro(numMeio, nomeEntidade),
    constraint fk_Transporta_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro));

create table Alocado
   (nomeEntidade varchar(80) not null,
    numMeio numeric not null,
    numProcessoSocorro numeric not null,
    numHoras numeric not null,
    constraint pk_Alocado primary key(nomeEntidade, numMeio, numProcessoSocorro),
    constraint fk_Alocado_MeioApoio foreign key (numMeio, nomeEntidade) references MeioApoio(numMeio, nomeEntidade),
    constraint fk_Alocado_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro));

create table Acciona
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    numProcessoSocorro numeric not null,
    constraint pk_Acciona primary key(nomeEntidade, numMeio, numProcessoSocorro),
    constraint fk_Acciona_Meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade),
    constraint fk_Acciona_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro));

create table Coordenador
   (idCoordenador numeric not null,
    constraint pk_Coordenador primary key(idCoordenador));

create table Audita
   (nomeEntidade varchar(80) not null,
    numMeio numeric not null,
    numProcessoSocorro numeric not null,
    idCoordenador numeric not null,
    datahoraInicio timestamp not null,
    datahoraFim timestamp not null check(datahoraFim > datahoraInicio),
    dataAuditoria timestamp not null check(dataAuditoria >= CURRENT_TIMESTAMP),
    texto varchar(255) not null,
    constraint pk_Audita primary key(nomeEntidade, numMeio, numProcessoSocorro, idCoordenador),
    constraint fk_Audita_Coordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
    constraint fk_Audita_Acciona foreign key (nomeEntidade, numMeio, numProcessoSocorro) references Acciona(nomeEntidade, numMeio, numProcessoSocorro));

create table Solicita
   (idCoordenador numeric not null,
    dataHoraInicioVideo timestamp not null,
    numCamara numeric not null,
    dataHoraInicio timestamp not null,
    dataHoraFim timestamp not null check(datahoraFim > datahoraInicio),
    constraint pk_Solicita primary key(idCoordenador, dataHoraInicioVideo, numCamara),
    constraint fk_Solicita_Coordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
    constraint fk_Solicita_Video foreign key (dataHoraInicioVideo, numCamara) references Video(dataHoraInicio, numCamara));
