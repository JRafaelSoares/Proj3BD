#EventoEmergencia
INSERT INTO d_evento(numTelefone, instanteChamada) 
SELECT numTelefone, instanteChamada
FROM EventoEmergencia;


#What if the same Meio is of various kinds?
INSERT INTO d_meio(numMeio, nomeMeio, nomeEntidade)
SELECT * 
FROM Meio;

INSERT INTO d_tempo
SELECT 
	EXTRACT(DAY FROM instanteChamada),
	EXTRACT(MONTH FROM instanteChamada),
	EXTRACT(YEAR FROM instanteChamada)
FROM d_evento;

#Rly dont think facts is what it is >.>