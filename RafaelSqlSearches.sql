--Q1:

with y as(Select numprocessosocorro, count(numprocessosocorro) as num
	From acciona
	Group By numprocessosocorro)

Select numprocessosocorro
From y
Where num = (Select max(num) from y);

--Q1 Pedro
select numProcessoSocorro
from acciona
group by numProcessoSocorro
having count(*) >= all(

	select count(*)
	from acciona
	group by numProcessoSocorro);

--Q2:

select nomeEntidade
from audita
Where datahoraInicio >= '2018-06-21 00:00:00-07' AND datahoraFim <= '2018-08-23 23:59:59-07';
group by nomeEntidade
having count(*) >= all(

	select count(*)
	from audita
	where datahoraInicio >= '2018-06-21 00:00:00-07' AND datahoraFim <= '2018-08-23 23:59:59-07'
	group by numProcessoSocorro);


