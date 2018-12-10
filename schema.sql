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
    (numCamara numeric not null check(numCamara >= 0),
     constraint pk_Camara primary key(numCamara));

create table Video
    (dataHoraInicio timestamp not null,
     dataHoraFim timestamp not null check(dataHoraFim > dataHoraInicio),
     numCamara numeric not null,
     constraint pk_Video primary key(dataHoraInicio, numCamara),
     constraint fk_Video_Camara foreign key(numCamara) references Camara(numCamara));

create table SegmentoVideo
    (numSegmento numeric not null check(numSegmento >= 0),
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
     constraint fk_Vigia_Local foreign key(moradaLocal) references Local(moradaLocal) ON DELETE cascade,
     constraint fk_Vigia_Camara foreign key(numCamara) references Camara(numCamara));

create table ProcessoSocorro
   (numProcessoSocorro numeric  not null check(numProcessoSocorro >= 0),
    constraint pk_ProcessoSocorro primary key(numProcessoSocorro));

create table EventoEmergencia
    (numTelefone numeric(9) not null check(numTelefone >= 0),
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
   (numMeio numeric not null check(numMeio >= 0),
    nomeMeio    varchar(80) not null,
    nomeEntidade varchar(80)    not null,
    constraint pk_Meio primary key(numMeio, nomeEntidade),
    constraint fk_Meio_EntidadeMeio foreign key(nomeEntidade) references EntidadeMeio(nomeEntidade) on delete cascade);

create table MeioCombate
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    constraint pk_MeioCombate primary key(numMeio, nomeEntidade),
    constraint fk_MeioCombate_Meio foreign key(numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade) on delete cascade);

create table MeioApoio
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    constraint pk_MeioApoio primary key(numMeio, nomeEntidade),
    constraint fk_MeioApoio_Meio foreign key(numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade) on delete cascade);

create table MeioSocorro
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    constraint pk_MeioSocorro primary key(numMeio, nomeEntidade),
    constraint fk_MeioSocorro_Meio foreign key(numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade) on delete cascade);

create table Transporta
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    numVitimas numeric not null check(numVitimas >= 0),
    numProcessoSocorro numeric not null,
    constraint pk_Transporta primary key(nomeEntidade, numMeio, numProcessoSocorro),
    constraint fk_Transporta_MeioSocorro foreign key (numMeio, nomeEntidade) references MeioSocorro(numMeio, nomeEntidade) on delete cascade,
    constraint fk_Transporta_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro) on delete cascade);

create table Alocado
    (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    numHoras numeric not null check(numHoras >= 0),
    numProcessoSocorro numeric not null,
    constraint pk_Alocado primary key(nomeEntidade, numMeio, numProcessoSocorro),
    constraint fk_Alocado_MeioApoio foreign key (numMeio, nomeEntidade) references MeioApoio(numMeio, nomeEntidade) on delete cascade,
    constraint fk_Alocado_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro) on delete cascade);

create table Acciona
   (numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    numProcessoSocorro numeric not null,
    constraint pk_Acciona primary key(nomeEntidade, numMeio, numProcessoSocorro),
    constraint fk_Acciona_Meio foreign key (numMeio, nomeEntidade) references Meio(numMeio, nomeEntidade) on delete cascade,
    constraint fk_Acciona_ProcessoSocorro foreign key (numProcessoSocorro) references ProcessoSocorro(numProcessoSocorro) on delete cascade);

create table Coordenador
   (idCoordenador numeric not null check(idCoordenador >= 0),
    constraint pk_Coordenador primary key(idCoordenador));

create table Audita
   (idCoordenador numeric not null,
    numMeio numeric not null,
    nomeEntidade varchar(80) not null,
    numProcessoSocorro numeric not null,
    datahoraInicio timestamp not null,
    datahoraFim timestamp not null check(datahoraFim > datahoraInicio),
    dataAuditoria timestamp not null check(dataAuditoria >= CURRENT_TIMESTAMP),
    texto varchar(255) not null,
    constraint pk_Audita primary key(nomeEntidade, numMeio, numProcessoSocorro, idCoordenador),
    constraint fk_Audita_Coordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
    constraint fk_Audita_Acciona foreign key (nomeEntidade, numMeio, numProcessoSocorro) references Acciona(nomeEntidade, numMeio, numProcessoSocorro) on delete cascade);

create table Solicita
   (idCoordenador numeric not null,
    dataHoraInicioVideo timestamp not null,
    numCamara numeric not null,
    dataHoraInicio timestamp not null,
    dataHoraFim timestamp not null check(datahoraFim > datahoraInicio),
    constraint pk_Solicita primary key(idCoordenador, dataHoraInicioVideo, numCamara),
    constraint fk_Solicita_Coordenador foreign key (idCoordenador) references Coordenador(idCoordenador),
    constraint fk_Solicita_Video foreign key (dataHoraInicioVideo, numCamara) references Video(dataHoraInicio, numCamara));

create or replace function check_solicita() returns trigger as $$
    begin
        if not exists(
                select *
                from Audita natural join EventoEmergencia natural join Vigia
                where idCoordenador = new.idCoordenador and numCamara = new.numCamara
        ) then 
            raise exception 'Um coordenador apenas pode solicitar videos de camaras colocadas num local cujo accionamento de meios esteja a ser (ou tenha side) auditado por ele proprio.';
        end if;
        return new;
    end
$$ language plpgsql;

create trigger check_solicita_constraint before insert or update on Solicita
    for each row execute procedure check_solicita();

create or replace function check_acciona() returns trigger as $$
    begin
        if not exists(
                select *
                from Acciona
                where numMeio = new.numMeio and nomeEntidade = new.nomeEntidade and numProcessoSocorro = new.numProcessoSocorro
        ) then 
            raise exception 'Um Meio de Apoio só pode ser alocado a Processos de Socorro para os quais tenha sido accionado.';
        end if;
        return new;
    end
$$ language plpgsql;

create trigger check_alocado_acciona_constraint before insert or update on Alocado
    for each row execute procedure check_acciona();

create index video_idx on video using hash(numCamara);
create index vigia_idx on vigia using hash(moradaLocal);