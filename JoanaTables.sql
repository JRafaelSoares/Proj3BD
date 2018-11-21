----------------------------------------
-- Table Creation
----------------------------------------

-- Named constraints are global to the database.
-- Therefore the following use the following naming rules:
--   1. pk_table for names of primary key constraints
--   2. fk_table_another for names of foreign key constraints

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


drop table transporta cascade;
drop table alocado cascade;
drop table acciona cascade;
drop table coordenador cascade;
drop table audita cascade;
drop table solicita cascade;

----------------------------------------
-- Populate Relations 
----------------------------------------


insert into student values ('Joana Coutinho', 87666,  'LEIC');
insert into student values ('João Rafael Soares', 87666,  'LEIC');
insert into student values ('Pedro Rodrigues',  87666,  'LEIC');
insert into student values ('Random Person',  87000,  'LETI');

insert into course values (1, 'LEIC', 'description', 120);
insert into course values (2, 'LETI', 'description', 120);
insert into course values (3, 'LEE', 'description', 120);
insert into course values (4, 'MEIC', 'description', 120);

insert into course_offerings values (3, 2, 1,'1.25', '12:00:00');
insert into course_offerings values (3, 2, 2,'A1', '13:00:00');
insert into course_offerings values (3, 2, 3,'A3', '14:00:00');
insert into course_offerings values (3, 2, 4,'A4', '15:00:00');
insert into course_offerings values (3, 1, 1,'A1', '16:00:00');

insert into is_offered values (1, 3, 1);
insert into is_offered values (1, 3, 2);
insert into is_offered values (2, 3, 2);
insert into is_offered values (3, 3, 2);
insert into is_offered values (4, 3, 2);

insert into enrolls values (87666, 1, 3, 2);
insert into enrolls values (87696, 1, 3, 2);
insert into enrolls values (87675, 1, 3, 2);
insert into enrolls values (87600, 2, 3, 2);

insert into instructor values (1, 'Instructor 1', 'Department X', 'My title');

insert into teaches values (1, 1, 3, 2);

insert into requires values ('Main Course 1', 'Prerequisite 2');
insert into requires values ('Main Course 2', 'Prerequisite 2');
insert into requires values ('Main Course 1', 'Prerequisite 1');