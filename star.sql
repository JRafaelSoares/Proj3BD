drop table d_evento cascade;
drop table d_meio cascade;
drop table d_tempo cascade;
drop table facts cascade;

create table d_evento
	(idEvento numeric not null check(idEvento > 0),
	 numTelefone numeric(9) not null check(numTelefone > 0),
	 instanteChamada timestamp not null,
	 constraint pk_d_evento primary key(idEvento));

create table d_meio
	(idMeio numeric not null check(idMeio > 0),
	 numMeio numeric not null check(numMeio > 0),
	 nomeMeio varchar(80) not null,
	 nomeEntidade varchar(80) not null,
	 tipo varchar(80) not null,
	 constraint pk_d_meio primary key(idMeio));

create table d_tempo
	(dia numeric(2) not null check(dia > 0 and dia <32),
	 mes numeric(2) not null check(mes > 0 and mes < 13),
	 ano numeric(4) not null check(ano > 0),
	 constraint pk_d_tempo primary key(dia, mes, ano));

#Is this rly the facts?!
create table facts
	(idEvento numeric not null,
	 idMeio numeric not null,
	 dia numeric(2) not null,
	 mes numeric(2) not null,
	 ano numeric(4) not null,
	 constraint pk_facts primary key(idEvento, idMeio, dia, mes, ano),
	 constraint fk_facts_d_evento foreign key(idEvento) references d_evento(idEvento),
	 constraint fk_facts_d_meio foreign key(idMeio) references d_meio(idMeio),
	 constraint fk_facts_d_tempo foreign key(dia, mes, ano) references d_tempo(dia, mes, ano));