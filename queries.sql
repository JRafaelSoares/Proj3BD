--1.

select numProcessoSocorro

from acciona

group by numProcessoSocorro

having count( distinct (numMeio, nomeEntidade) ) >= all(

	select count( distinct (numMeio, nomeEntidade) )
	from acciona
	group by numProcessoSocorro

);

--2.

Select nomeentidade

from EventoEmergencia NATURAL JOIN Acciona

WHERE instanteChamada BETWEEN '2018-06-21 00:00' AND '2018-09-23 23:59'

Group by nomeentidade

Having count(*) >= all(
	
	select count(*)
	
	from EventoEmergencia NATURAL JOIN Acciona

	WHERE instanteChamada BETWEEN '2018-06-21 00:00' AND '2018-09-23 23:59'

	Group by nomeentidade

);



--3.

SELECT distinct e.numProcessoSocorro
FROM EventoEmergencia as e, acciona as a
WHERE instanteChamada BETWEEN '2018-01-01 00:00' AND '2018-12-31 23:59'
		AND moradaLocal LIKE 'Oliveira do Hospital'
		AND (a.numProcessoSocorro, a.numMeio, a.nomeEntidade) NOT IN (
			SELECT numProcessoSocorro, numMeio, nomeEntidade
			FROM Audita
		)
		AND a.numProcessoSocorro = e.numProcessoSocorro;

--4.

SELECT count(*) as numSegmentos
FROM SegmentoVideo NATURAL JOIN video NATURAL JOIN vigia
WHERE duracao > '00:01:00' 
	AND moradaLocal LIKE 'Monchique'
	AND dataHoraInicio BETWEEN '2018-08-01 00:00:00' AND '2018-08-31 23:59:00'
	AND dataHoraFim BETWEEN '2018-08-01 00:00:00' AND '2018-08-31 23:59:00';

--5.

SELECT *
FROM MeioCombate
WHERE (numMeio, nomeEntidade) NOT IN (
	SELECT numMeio, nomeEntidade
	FROM alocado
	);

--6.

Select nomeentidade

From (
	Select distinct numProcessoSocorro, nomeentidade
	From acciona NATURAL JOIN MeioCombate) as y
	
Group by nomeentidade

Having count(nomeentidade) >= (
	Select count(distinct numProcessoSocorro) from Acciona);


--Resultado 1: 3
--Resultado 2: A
--Resultado 3: 1
--Resultado 4: 2
--Resultado 5: Meios 1-100
--Resultado 6: Entidade 1