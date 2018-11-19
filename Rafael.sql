drop table Camara cascade;

create table Camara
	(numCamara numeric not null unique,
	 constraint pk_numCamara primary key(Camara));

insert into Camara values(0);
insert into Camara values(1);
insert into Camara values(2);
insert into Camara values(3);
