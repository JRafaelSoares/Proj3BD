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

INSERT INTO d_tempo
SELECT DISTINCT
	EXTRACT(DAY FROM instanteChamada),
	EXTRACT(MONTH FROM instanteChamada),
	EXTRACT(YEAR FROM instanteChamada)
FROM d_evento;

INSERT INTO facts
SELECT
	idEvento, idMeio, EXTRACT(DAY FROM instanteChamada), EXTRACT(MONTH FROM instanteChamada), EXTRACT(YEAR FROM instanteChamada)
FROM EventoEmergencia NATURAL JOIN Acciona NATURAL JOIN d_evento NATURAL JOIN d_meio;



