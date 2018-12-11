
Select ano, mes, tipo, count(tipo)
From facts NATURAL JOIN d_meio
Where idEvento = 15
Group by tipo, ano, mes
UNION
Select ano, null, tipo, count(tipo)
From facts NATURAL JOIN d_meio
Where idEvento = 15
Group by tipo, ano, mes
UNION 
Select null, null, tipo, count(tipo)
From facts NATURAL JOIN d_meio
Where idEvento = 15
Group by tipo, ano, mes;
