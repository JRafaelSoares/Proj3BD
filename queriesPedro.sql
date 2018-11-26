1.

select numProcessoSocorro

from acciona

group by numProcessoSocorro

having count(*) >= all(

	select count(*)
	from acciona
	group by numProcessoSocorro

);

2.

select 

from acciona

group by numProcessoSocorro

having count(*) >= all(

	select count(*)
	from acciona
	group by numProcessoSocorro

);

