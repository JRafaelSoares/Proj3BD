import os

if(os.path.isfile("testInserts.sql")):
	os.remove("testInserts.sql")

f = open('Proj4.sql', 'w')

numVezes = 100000
isrt = "INSERT INTO "
value = " VALUES ("
end = ");\n"
between = "), ("
f.write(isrt + "ProcessoSocorro(numProcessoSocorro)" + value)
for i in range(1, numVezes):	
	f.write(str(i) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Local(moradaLocal)" + value)
for i in range(1, numVezes):
	f.write("'Local" + str(i) + "'" + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro)" + value)
for i in range(1, numVezes):
	f.write(str(900000000+i) + ", '2015-03-28 20:20:20', " + "'Pessoa" + str(i) + "', 'Local" + str(i) + "', " + str(i) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "EntidadeMeio(nomeEntidade)" + value)
for i in range(1, numVezes*3):
	f.write("'Entidade" + str(i) + "'" + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Meio(numMeio, nomeMeio, nomeEntidade)" + value)
for i in range(1, numVezes*3):
	f.write(str(i) + ", 'veiculo" + str(i) + "', '" + "Entidade" + str(i) + "'" + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Acciona(numMeio, nomeEntidade, numProcessoSocorro)" + value)
for i in range(1, numVezes):
	f.write(str(i) + ", 'Entidade" + str(i) + "', " + str(i) + end if (i == numVezes - 1) else between)
f.write("\n");

f.write(isrt + "Coordenador(idCoordenador)" + value)
for i in range(1, numVezes):
	f.write(str(i) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Audita(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro, datahoraInicio, datahoraFim, dataAuditoria, texto)" + value)
for i in range(1, numVezes):
	f.write(str(i) +", " + str(i) + ", 'Entidade" + str(i) + "', " + str(i) + ", '2015-03-28 20:20:20', '2015-04-28 20:20:20', '2019-04-28 20:20:20', 'Correu Tudo bem'" + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Camara(numCamara)" + value)
for i in range(1, numVezes):
	f.write(str(i) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Video(dataHoraInicio, dataHoraFim, numCamara)" + value)
for i in range(1, numVezes):
	f.write("'2015-03-28 20:20:20', '2015-04-28 20:20:20', " + str(i) + end if (i == numVezes - 1) else between)
	
f.write("\n");

f.write(isrt + "SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara)" + value)
for i in range(1, numVezes):
	f.write(str(i) + ", '00:00:59', '2015-03-28 20:20:20', " + str(i) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Vigia(moradaLocal, numCamara)" + value)
for i in range(1, numVezes):
	f.write("'Local" + str(i) + "', " + str(i) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "MeioCombate(numMeio, nomeEntidade)" + value)
for i in range(1, numVezes*3):
	if(i < numVezes):
		f.write(str(i) + ", 'Entidade" + str(i) + "'" + end if (i == numVezes - 1) else between)
	elif(i > numVezes*2):
		f.write(str(i) + ", 'Entidade" + str(i) + "'" + end if (i == numVezes - 1) else between)
	else:
		f.write(str(i) + ", 'Entidade" + str(i) + "'" + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Alocado(numMeio, nomeEntidade, numHoras, numProcessoSocorro)" + value)
for i in range(1, numVezes*3):
	if(i > numVezes*2):
		f.write(str(i) + ", 'Entidade" + str(i) + "', " + str(i) + ", " + str(i//3) + end if (i == numVezes - 1) else between)
	elif(i >= numVezes and i <= numVezes*2):
		f.write(str(i) + ", 'Entidade" + str(i) + "', " + str(i) + ", " + str(i//3) + end if (i == numVezes - 1) else between)

f.write("\n");

f.write(isrt + "Solicita(idCoordenador, dataHoraInicioVideo, numCamara, datahoraInicio, datahoraFim)" + value)
for i in range(1, numVezes):
	f.write(str(i) + ", '2015-03-28 20:20:20', " + str(i) + ", '2015-03-28 20:20:20', '2015-04-28 20:20:20'" + end if (i == numVezes - 1) else between)

f.write(isrt + "Acciona(numMeio, nomeEntidade, numProcessoSocorro)" + value)
#Ultima questao do sql
for i in range(1, numVezes):
	f.write("1, 'Entidade1', " + str(i) + end if (i == numVezes - 1) else between)

