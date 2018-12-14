INSERT INTO d_evento(numTelefone, instanteChamada) 
SELECT numTelefone, instanteChamada
FROM EventoEmergencia;

INSERT INTO d_meio(numMeio, nomeEntidade, nomeMeio, tipo)
SELECT *, 'MeioCombate' 
FROM Meio NATURAL JOIN MeioCombate;

INSERT INTO d_meio(numMeio, nomeEntidade, nomeMeio, tipo)
SELECT *, 'MeioApoio' 
FROM Meio NATURAL JOIN MeioApoio;

INSERT INTO d_meio(numMeio, nomeEntidade, nomeMeio, tipo)
SELECT *, 'MeioSocorro' 
FROM Meio NATURAL JOIN MeioSocorro;

INSERT INTO d_meio(numMeio, nomeMeio, nomeEntidade, tipo)
Select *, 'Nenhum'
FROM Meio
Where (numMeio, nomeEntidade) not in 
	(Select * from MeioCombate UNION Select * from MeioApoio UNION Select * from MeioSocorro);

SELECT get_dates();
/*
INSERT INTO facts
SELECT
	idEvento, idMeio, idTempo
FROM EventoEmergencia NATURAL JOIN Acciona NATURAL JOIN d_evento NATURAL JOIN d_meio NATURAL JOIN d_tempo
Where EXTRACT(DAY FROM instanteChamada) = dia and
	EXTRACT(MONTH FROM instanteChamada) = mes and
	EXTRACT(YEAR FROM instanteChamada) = ano;
	*/

INSERT INTO facts
SELECT
	idEvento, idMeio, idTempo
FROM EventoEmergencia NATURAL JOIN Transporta NATURAL JOIN d_evento NATURAL JOIN d_meio NATURAL JOIN d_tempo
Where EXTRACT(DAY FROM instanteChamada) = dia and
	EXTRACT(MONTH FROM instanteChamada) = mes and
	EXTRACT(YEAR FROM instanteChamada) = ano and
	tipo like 'MeioSocorro';

INSERT INTO facts
SELECT
	idEvento, idMeio, idTempo
FROM EventoEmergencia NATURAL JOIN Alocado NATURAL JOIN d_evento NATURAL JOIN d_meio NATURAL JOIN d_tempo
Where EXTRACT(DAY FROM instanteChamada) = dia and
	EXTRACT(MONTH FROM instanteChamada) = mes and
	EXTRACT(YEAR FROM instanteChamada) = ano and
	tipo like 'MeioApoio';

INSERT INTO facts
SELECT
	idEvento, idMeio, idTempo
FROM EventoEmergencia NATURAL JOIN Acciona NATURAL JOIN d_evento NATURAL JOIN d_meio NATURAL JOIN d_tempo
Where EXTRACT(DAY FROM instanteChamada) = dia and
	EXTRACT(MONTH FROM instanteChamada) = mes and
	EXTRACT(YEAR FROM instanteChamada) = ano and
	(tipo like 'MeioCombate' or tipo like 'Nenhum');
