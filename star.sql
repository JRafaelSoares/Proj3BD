drop table d_evento cascade;
drop table d_meio cascade;
drop table d_tempo cascade;
drop table facts cascade;

create table d_evento
	(idEvento serial not null,
	 numTelefone numeric(9) not null check(numTelefone > 0),
	 instanteChamada timestamp not null,
	 unique(numTelefone, instanteChamada),
	 constraint pk_d_evento primary key(idEvento));

create table d_meio
	(idMeio serial not null,
	 numMeio numeric not null check(numMeio >= 0),
	 nomeMeio varchar(80) not null,
	 nomeEntidade varchar(80) not null,
	 tipo varchar(80),
	 constraint pk_d_meio primary key(idMeio));

create table d_tempo
	(idTempo serial not null,
	 dia numeric(2) not null,
	 mes numeric(2) not null,
	 ano numeric(4) not null,
	 constraint pk_d_tempo primary key(idTempo));


create table facts
	(idEvento serial,
	 idMeio serial,
	 idTempo serial,
	 constraint pk_facts primary key(idEvento, idMeio, idTempo),
	 constraint fk_facts_d_evento foreign key(idEvento) references d_evento(idEvento),
	 constraint fk_facts_d_meio foreign key(idMeio) references d_meio(idMeio),
	 constraint fk_facts_d_tempo foreign key(idTempo) references d_tempo(idTempo));


create or replace function get_dates() returns void as $$
	DECLARE
		min_date date;
		max_date date;
	BEGIN
		Select min(instanteChamada)::timestamp::date into min_date
		From EventoEmergencia;

		Select max(instanteChamada)::timestamp::date into max_date
		From EventoEmergencia;

		WHILE min_date <= max_date LOOP
		INSERT INTO d_tempo(dia, mes, ano) VALUES (EXTRACT(DAY FROM min_date), EXTRACT(MONTH FROM min_date), EXTRACT(YEAR FROM min_date));
		min_date := min_date + interval '1 day';
		END LOOP;
	END;
$$ LANGUAGE plpgsql;