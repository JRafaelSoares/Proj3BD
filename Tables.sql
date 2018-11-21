----------------------------------------
-- Drop cascade
----------------------------------------

drop table camara cascade;
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

drop table transporta cascade;
drop table alocado cascade;
drop table acciona cascade;
drop table coordenador cascade;
drop table audita cascade;
drop table solicita cascade;

----------------------------------------
-- Table Creation
----------------------------------------

-- Named constraints are global to the database.
-- Therefore the following use the following naming rules:
--   1. pk_table for names of primary key constraints
--   2. fk_table_another for names of foreign key constraints

create table Camara
    (numCamara numeric not null unique,
     constraint pk_numCamara primary key(numCamara));

create table Video
    (dataHoraInicio timestamp not null unique,
     dataHoraFim timestamp not null check(dataHoraFim > dataHoraInicio),
     numCamara numeric not null,
     constraint pk_dataHoraInicio primary key(dataHoraInicio),
     constraint fk_numCamara foreign key(numCamara) references Camara(numCamara));

--QUESTAO: DataHoraInicio e unico, mas podem existir varios segmentos a comecar do mesmo sitio?
-- datahorainicio e numcamara unique?

create table SegmentoVideo
    (numSegmento numeric not null unique,
     duracao time not null,
     dataHoraInicio timestamp not null,
     numCamara numeric not null,
     constraint pk_numSegmento primary key(numSegmento),
     constraint fk_dataHoraInicio foreign key(dataHoraInicio) references Video(dataHoraInicio),
     constraint fk_numCamara foreign key(numCamara) references Camara(numCamara));

create table Local
    (moradaLocal varchar(80) not null unique,
     constraint pk_moradaLocal primary key(moradaLocal));

-- moradaLocal e numCamara unique?
create table Vigia
    (moradaLocal varchar(80) not null,
     numCamara numeric not null,
     constraint fk_moradaLocal foreign key(moradaLocal) references Local(moradaLocal),
     constraint fk_numCamara foreign key(numCamara) references Camara(numCamara));

-- numtelefone e instante chamada primary key conjunta
create table EventoEmergencia
    (numTelefone numeric(9) not null,
     instanteChamada timestamp not null,
     nomePessoa varchar(80) not null,
     moradaLocal varchar(80) not null,
     numProcessoSocorro numeric,
     constraint pk_numTelefone_instanteChamada primary key(numTelefone,instanteChamada),
     constraint fk_moradaLocal foreign key(moradaLocal) references Local(moradaLocal));

create table ProcessoSocorro
   (numProcessoSocorro numeric  not null unique,
    constraint pk_ProcessoSocorro primary key(numProcessoSocorro));

create table EntidadeMeio
   (nomeEntidade    varchar(80) not null unique,
    constraint pk_EntidadeMeio primary key(nomeEntidade));

create table Meio
   (numMeio numeric not null unique,
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

create table transporta
   (nomeEntidade varchar(80) not null,
    numMeio integer not null,
    numProcessoSocorro varchar(255) not null,
    numVitimas integer not null,
    constraint pk_transporta primary key(nomeEntidade, numMeio, numProcessoSocorro));
    constraint fk_MeioSocorro foreign key (numMeio, nomeEntidade) references MeioSocorro;
    constraint fk_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro;

create table alocado
   (nomeEntidade varchar(80) not null,
    numMeio integer not null,
    numProcessoSocorro varchar(255) not null,
    numHoras integer not null,
    constraint pk_alocado primary key(nomeEntidade, numMeio, numProcessoSocorro));
    constraint fk_MeioApoio foreign key (numMeio, nomeEntidade) references MeioApoio;
    constraint fk_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro;

create table acciona
   (nomeEntidade varchar(80) not null,
    numMeio integer not null,
    numProcessoSocorro varchar(255) not null,
    constraint pk_acciona primary key(nomeEntidade, numMeio, numProcessoSocorro));
    constraint fk_Meio foreign key (numMeio, nomeEntidade) references Meio;
    constraint fk_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro;

create table coordenador
   (idCoordenador integer not null,
    constraint pk_coordenador primary key(idCoordenador));

create table audita
   (nomeEntidade varchar(80) not null,
    numMeio integer not null,
    numProcessoSocorro varchar(255) not null,
    idCoordenador integer not null,
    datahoraInicio timestamp not null,
    datahoraFim timestamp not null check(datahoraFim > datahoraInicio),
    dataAuditoria timestamp not null check(dataAuditoria > CURRENT_TIMESTAMP()),
    texto varchar(255) not null,
    constraint pk_audita primary key(nomeEntidade, numMeio, numProcessoSocorro, idCoordenador));
    constraint fk_Coordenador foreign key (idCoordenador) references coordenador;
    constraint fk_Acciona foreign key (nomeEntidade, numMeio, numProcessoSocorro) references acciona;

create table solicita
   (idCoordenador integer not null,
    dataHoraInicioVideo timestamp not null,
    numCamara integer not null,
    dataHoraInicio timestamp not null,
    dataHoraFim timestamp not null check(datahoraFim > datahoraInicio),
    constraint pk_solicita primary key(idCoordenador, dataHoraInicioVideo, numCamara));
    constraint fk_Coordenador foreign key (idCoordenador) references coordenador;
    constraint fk_Video foreign key (dataHoraInicioVideo, numCamara) references video;
