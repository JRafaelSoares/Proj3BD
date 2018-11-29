import os

if(os.path.isfile("testInserts.sql")):
	os.remove("testInserts.sql")

f = open('testInserts.sql', 'w')

isrt = "INSERT INTO "
value = " VALUES ("
end = ");\n"
for i in range(1, 101):
	f.write(isrt + "ProcessoSocorro(numProcessoSocorro)" + value + str(i) + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Local(moradaLocal)" + value + "'Local" + str(i) + "'" + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro)" + value + str(900000000+i) + ", '2015-03-28 20:20:20', " + "'Pessoa" + str(i) + "', 'Local" + str(i) + "', " + str(i) +end)

f.write("\n");

for i in range(1, 301):
	f.write(isrt + "EntidadeMeio(nomeEntidade)" + value + "'Entidade" + str(i) + "'" + end)

f.write("\n");

for i in range(1, 301):
	f.write(isrt + "Meio(numMeio, nomeMeio, nomeEntidade)" + value + str(i) + ", 'veiculo" + str(i) + "', '" + "Entidade" + str(i) + "'" + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Acciona(numMeio, nomeEntidade, numProcessoSocorro)" + value + str(i) + ", 'Entidade" + str(i) + "', " + str(i) + end)
f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Coordenador(idCoordenador)" + value + str(i) + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Audita(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro, datahoraInicio, datahoraFim, dataAuditoria, texto)" + value + str(i) +", " + str(i) + ", 'Entidade" + str(i) + "', " + str(i) + ", '2015-03-28 20:20:20', '2015-04-28 20:20:20', '2019-04-28 20:20:20', 'Correu Tudo bem'" + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Camara(numCamara)" + value + str(i) + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Video(dataHoraInicio, dataHoraFim, numCamara)" + value + "'2015-03-28 20:20:20', '2015-04-28 20:20:20', " + str(i) + end)
	
f.write("\n");

for i in range(1, 101):
	f.write(isrt + "SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara)" + value + str(i) + ", '00:00:59', '2015-03-28 20:20:20', " + str(i) + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Vigia(moradaLocal, numCamara)" + value + "'Local" + str(i) + "', " + str(i) + end)

f.write("\n");

for i in range(1, 301):
	if(i < 100):
		f.write(isrt + "MeioCombate(numMeio, nomeEntidade)" + value + str(i) + ", 'Entidade" + str(i) + "'" + end)
	elif(i > 200):
		f.write(isrt + "MeioApoio(numMeio, nomeEntidade)" + value + str(i) + ", 'Entidade" + str(i) + "'" + end)
	else:
		f.write(isrt + "MeioSocorro(numMeio, nomeEntidade)" + value + str(i) + ", 'Entidade" + str(i) + "'" + end)

f.write("\n");

for i in range(1, 301):
	if(i > 200):
		f.write(isrt + "Alocado(numMeio, nomeEntidade, numHoras, numProcessoSocorro)" + value + str(i) + ", 'Entidade" + str(i) + "', " + str(i) + ", " + str(i//3) + end)
	elif(i >= 100 and i <= 200):
		f.write(isrt + "Transporta(numMeio, nomeEntidade, numVitimas, numProcessoSocorro)" + value + str(i) + ", 'Entidade" + str(i) + "', " + str(i) + ", " + str(i//3) + end)

f.write("\n");

for i in range(1, 101):
	f.write(isrt + "Solicita(idCoordenador, dataHoraInicioVideo, numCamara, datahoraInicio, datahoraFim)" + value + str(i) + ", '2015-03-28 20:20:20', " + str(i) + ", '2015-03-28 20:20:20', '2015-04-28 20:20:20'" + end)

#Ultima questao do sql
for i in range(1, 101):
	f.write(isrt + "Acciona(numMeio, nomeEntidade, numProcessoSocorro)" + value + "1, 'Entidade1', " + str(i) + end)

