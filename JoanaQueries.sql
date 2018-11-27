1.

with tableCounterMeios as(
	SELECT numProcessoSocorro, count(numMeio) as countMeios
	FROM acciona
	GROUP BY numProcessoSocorro
)

SELECT numProcessoSocorro
FROM tableCounterMeios NATURAL JOIN (
	SELECT max(countMeios) as countMeios
	FROM tableCounterMeios
	) as foo

2.

with tableCounter as(
	SELECT nomeEntidade, count(a.numProcessoSocorro) as countProcessos
	FROM EventoEmergencia NATURAL JOIN Acciona as a
	WHERE instanteChamada BETWEEN '2018-06-21 00:00' AND '2018-09-23 23:59'
	GROUP BY nomeEntidade
)

SELECT nomeEntidade
FROM tableCounter NATURAL JOIN (
	SELECT max(countProcessos) as countProcessos
	FROM tableCounter
	) as t2

3.

SELECT distinct e.numProcessoSocorro
FROM EventoEmergencia as e, acciona as a
WHERE instanteChamada BETWEEN '2018-01-01 00:00' AND '2018-12-31 23:59'
		AND moradaLocal LIKE 'Oliveira do Hospital'
		AND (a.numProcessoSocorro, a.numMeio, a.nomeEntidade) NOT IN (
			SELECT numProcessoSocorro, numMeio, nomeEntidade
			FROM Audita
		)
		AND a.numProcessoSocorro = e.numProcessoSocorro

4.

SELECT count(*) as numSegmentos
FROM SegmentoVideo NATURAL JOIN video NATURAL JOIN vigia
WHERE duracao > '00:01:00' 
	AND moradaLocal LIKE 'Monchique'
	AND dataHoraInicio BETWEEN '2018-08-01 00:00:00' AND '2018-08-31 23:59:00'
	AND dataHoraFim BETWEEN '2018-08-01 00:00:00' AND '2018-08-31 23:59:00'

5.

SELECT *
FROM MeioCombate
WHERE (numMeio, nomeEntidade) NOT IN (
	SELECT numMeio, nomeEntidade
	FROM alocado
	)

6.

