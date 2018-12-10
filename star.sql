drop table d_evento cascade;
drop table d_meio cascade;
drop table d_tempo cascade;
drop table facts cascade;

create table d_evento
	(idEvento serial,
	 numTelefone numeric(9) not null check(numTelefone > 0),
	 instanteChamada timestamp not null,
	 constraint pk_d_evento primary key(idEvento));

#There can be Meios without type
create table d_meio
	(idMeio serial,
	 numMeio numeric not null check(numMeio > 0),
	 nomeMeio varchar(80) not null,
	 nomeEntidade varchar(80) not null,
	 tipo varchar(80),
	 constraint pk_d_meio primary key(idMeio));

#Is tempo instante chamada or seperate?
#Option 1
create table d_tempo
	(dia numeric(2) not null check(dia > 0 and dia <32),
	 mes numeric(2) not null check(mes > 0 and mes < 13),
	 ano numeric(4) not null check(ano > 0),
	 constraint pk_d_tempo primary key(dia, mes, ano));
#Option 2
#WILL IT BLEND?!?!?!
create table d_tempo
	(dia numeric(2) not null,
	 mes numeric(2) not null,
	 ano numeric(4) not null,
	 constraint pk_d_tempo primary key(dia, mes, ano),
	 constraint fk_d_tempo_d_evento_day foreign key(dia) references d_evento(EXTRACT DAY FROM instanteChamada),
	 constraint fk_d_tempo_d_evento_month foreign key(month) references d_evento(EXTRACT MONTH FROM instanteChamada),
	 constraint fk_d_tempo_d_evento_year foreign key(year) references d_evento(EXTRACT YEAR FROM instanteChamada));

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

#If only 1 type
create or replace function get_type() returns trigger as $$
	begin
		if exists(
			SELECT * 
			FROM MeioCombate
			WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade
			) then
				UPDATE d_meio
				SET tipo = 'MeioCombate' 
				WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade;
		ELSEIF exists(
			SELECT * 
			FROM MeioApoio
			WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade
			) then
				UPDATE d_meio
				SET tipo = 'MeioApoio' 
				WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade;

		ELSEIF exists(
			SELECT * 
			FROM MeioSocorro
			WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade
			) then
				UPDATE d_meio
				SET tipo = 'MeioSocorro' 
				WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade;
		end if;
		return new;
	end
$$ language plpgsql;

#else
create or replace function get_type() returns trigger as $$
	DECLARE 
		type := '';
	begin

		if exists(
			SELECT * 
			FROM MeioCombate
			WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade
			) then
				type := concat(type, 'MeioCombate');
		IF exists(
			SELECT * 
			FROM MeioApoio
			WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade
			) then
				if (type != '') then 
					type := concat(type, ', MeioApoio');
				else
					type := concat(type, 'MeioApoio');
				end if;

		IF exists(
			SELECT * 
			FROM MeioSocorro
			WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade
			) then
				if (type != '') then 
					type := concat(type, ', MeioSocorro');
				else
					type := concat(type, 'MeioSocorro');
				end if;
		end if;
		
		UPDATE d_meio
		SET tipo = type 
		WHERE numMeio = new.numMeio and nomeEntidade = new.nomeEntidade;
		
		return new;
	end
$$ language plpgsql;

create trigger add_type after insert on d_meio
	for each row execute procedure get_type();
