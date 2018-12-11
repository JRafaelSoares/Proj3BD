
Select count(tipo), ano, mes
From facts NATURAL JOIN d_meio
Group by tipo, ano, mes
UNION
Select count(tipo), ano, null
From facts NATURAL JOIN d_meio
Group by tipo, ano, mes
UNION 
#Select count(tipo), null, mes
#From facts NATURAL JOIN d_meio
#Group by tipo, ano, mes
#UNION
Select count(tipo), null, null
From facts NATURAL JOIN d_meio
Group by tipo, ano, mes;