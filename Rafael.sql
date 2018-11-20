-- DROP TABLES

drop table camara cascade;
drop table Video cascade;
drop table SegmentoVideo cascade;
drop table Local cascade;
drop table vigia cascade;
drop table EventoEmergencia cascade;

-- TABLES
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

-- DATA
insert into Camara values(0);
insert into Camara values(1);
insert into Camara values(2);
insert into Camara values(3);

insert into Video values('2004-10-19 10:23:54', '2004-10-19 11:23:54', 0);
insert into Video values('2005-10-19 10:23:54', '2005-10-19 11:23:54', 1);

insert into SegmentoVideo values(0, '00:30:00', '2004-10-19 10:23:54', 0);
insert into SegmentoVideo values(1, '00:30:00', '2005-10-19 10:23:54', 1);

insert into Local values('Murtal');
insert into local values('Parede');
insert into local values('Sintra');

insert into Vigia values('Murtal', 0);
insert into Vigia values('Parede', 1);
insert into Vigia values('Sintra', 2);

insert into EventoEmergencia values(999999999, '2004-10-19 00:00:00', 'Joao Manel', 'Murtal', 0);
insert into EventoEmergencia values(999999999, '2005-11-19 00:30:00', 'Joao Manel', 'Murtal', 0);
