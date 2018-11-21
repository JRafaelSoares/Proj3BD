drop table ProcessoSocorro cascade;
drop table EntidadeMeio cascade;
drop table Meio cascade;
drop table MeioCombate cascade;
drop table MeioApoio cascade;
drop table MeioSocorro cascade;


create table ProcessoSocorro
   (numProcessoSocorro numeric	not null unique,
    constraint pk_ProcessoSocorro primary key(numProcessoSocorro));

create table EntidadeMeio
   (nomeEntidade 	varchar(80)	not null unique,
    constraint pk_EntidadeMeio primary key(nomeEntidade));

create table Meio
   (numMeio numeric	not null unique,
    nomeMeio	varchar(80)	not null,
    nomeEntidade varchar(80)	not null,
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

