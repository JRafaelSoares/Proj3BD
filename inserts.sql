--EVENTO EMERGENCIA
--numProcessoSocorro
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES (1);
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES (2);
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES (3);

--moradaLocal
INSERT INTO Local(moradaLocal) VALUES('Cascais');
INSERT INTO Local(moradaLocal) VALUES('Lisboa');
INSERT INTO Local(moradaLocal) VALUES('Parede');
INSERT INTO Local(moradaLocal) VALUES('Oliveira do Hospital');
INSERT INTO Local(moradaLocal) VALUES('Monchique');

--numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES (123123123, '2018-06-30 19:19:19', 'Manuel', 'Cascais', 1);
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES (123123124, '2018-06-30 19:19:19', 'Peshoa', 'Lisboa', 2);
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES (123123125, '2017-06-30 19:19:18', 'Miguel', 'Cascais', 1);
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES (123123127, '2017-06-30 19:19:18', 'Ze', 'Oliveira do Hospital', 1);
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES (123123129, '2018-06-30 19:19:18', 'Igu', 'Oliveira do Hospital', 1);


--ACCIONA

INSERT INTO EntidadeMeio(nomeEntidade) VALUES ('A');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES ('B');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES ('C');

--numMeio nomeMeio nomeEntidade
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES (0, 'carro', 'A');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES (1, 'mota', 'A');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES (2, 'carro', 'B');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES (3, 'helicoptero', 'C');

--numMeio nomeEntidade numProcessoSocorro
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (0, 'A', 1);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (1, 'A', 1);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (2, 'B', 2);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (0, 'A', 2);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (0, 'A', 3);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (3, 'C', 3);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES (1, 'A', 3);

--AUDITA

--idCoordenador
INSERT INTO Coordenador(idCoordenador) VALUES(0);
INSERT INTO Coordenador(idCoordenador) VALUES(1);

INSERT INTO Audita(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro, datahoraInicio, datahoraFim, dataAuditoria, texto) VALUES(0, 2, 'B', 2, '2018-06-30 19:19:18', '2018-06-30 19:19:20', '2019-06-30 19:19:20', 'Txt');

-- SEGMENTO VIDEO

-- numCamara
INSERT INTO Camara(numCamara) VALUES (1);
INSERT INTO Camara(numCamara) VALUES (2);
INSERT INTO Camara(numCamara) VALUES (3);

-- DataHoraInicio DataHoraFim numCamara
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES ('2018-8-2 00:00:00', '2018-8-3 00:00:00', 1); 
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES ('2018-7-2 00:00:00', '2018-8-3 00:00:00', 1); 
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES ('2018-9-2 00:00:00', '2018-9-3 00:00:00', 1);
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES ('2018-8-2 00:00:00', '2018-8-3 00:00:00', 2); 
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES ('2018-8-2 00:00:00', '2018-8-3 00:00:00', 3); 


--numSegmento duracao DataHoraInicio numCamara
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES (1, '00:02:00', '2018-8-2 00:00:00', 1);
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES (2, '00:00:59', '2018-8-2 00:00:00', 2);
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES (3, '00:02:00', '2018-8-2 00:00:00', 3);
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES (4, '00:02:00', '2018-8-2 00:00:00', 1);

--moradaLocal numCamara
INSERT INTO Vigia(moradaLocal, numCamara) VALUES ('Monchique', 1);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES ('Monchique', 2);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES ('Parede', 3);

--numMeio nomeEntidade
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(0, 'A');
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(2, 'B');

--numMeio nomeEntidade
INSERT INTO MeioApoio(numMeio, nomeEntidade) VALUES(0, 'A');

--numMeio nomeEntidade numHoras numProcessoSocorro
INSERT INTO Alocado(numMeio, nomeEntidade, numHoras, numProcessoSocorro) VALUES(0, 'A', 10, 1);



--Resultado 1: NumProcessoSocorro 3
--Resultado 2: A
--Resultado 3: 1
--Resultado 4: 2
--Resultado 5: 2 B
--Resultado 6: A

