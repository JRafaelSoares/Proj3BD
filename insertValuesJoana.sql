--- numCamara
INSERT INTO Camara(numCamara) VALUES(1);
INSERT INTO Camara(numCamara) VALUES(2);
INSERT INTO Camara(numCamara) VALUES(3);
INSERT INTO Camara(numCamara) VALUES(4);
INSERT INTO Camara(numCamara) VALUES(5);
INSERT INTO Camara(numCamara) VALUES(6);

--- dataHoraInicio --- dataHoraFim --- numCamara
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES('2016-06-22 19:00:25', '2018-12-22 20:00:25', 1);
INSERT INTO Video(dataHoraInicio, dataHoraFim, numCamara) VALUES('2018-08-22 19:00:25', '2018-08-22 19:01:35', 6);

--- numSegmento --- duracao --- dataHoraInicio --- numCamara
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES(1, '00:00:20', '2016-06-22 19:00:25', 1);
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES(2, '00:00:20', '2016-06-22 19:00:25', 1);
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES(3, '00:00:20', '2016-06-22 19:00:25', 1);
INSERT INTO SegmentoVideo(numSegmento, duracao, dataHoraInicio, numCamara) VALUES(4, '00:01:10', '2018-08-22 19:00:25', 6);

--- moradaLocal
INSERT INTO Local(moradaLocal) VALUES('Oliveira do Hospital');
INSERT INTO Local(moradaLocal) VALUES('Natalia Luisa');
INSERT INTO Local(moradaLocal) VALUES('Monchique');

--- moradaLocal --- numCamara
INSERT INTO Vigia(moradaLocal, numCamara) VALUES('Oliveira do Hospital', 1);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES('Oliveira do Hospital', 2);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES('Oliveira do Hospital', 3);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES('Natalia Luisa', 4);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES('Natalia Luisa', 5);
INSERT INTO Vigia(moradaLocal, numCamara) VALUES('Monchique', 6);

--- numProcessoSocorro
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES(1);
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES(2);
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES(3);
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES(4);
INSERT INTO ProcessoSocorro(numProcessoSocorro) VALUES(5);

--- nomeEntidade
INSERT INTO EntidadeMeio(nomeEntidade) VALUES('Bombeiros');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES('Exercito');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES('Forca Aerea');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES('Policia');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES('Municipio');
INSERT INTO EntidadeMeio(nomeEntidade) VALUES('Hospital');

--- numMeio --- nomeMeio --- nomeEntidade
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(1, 'Ambulancia', 'Hospital');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(2, 'Ambulancia', 'Hospital');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(3, 'Ambulancia', 'Hospital');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(4, 'Tanque', 'Exercito');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(5, 'Tanque', 'Exercito');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(6, 'Helicoptero', 'Forca Aerea');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(7, 'helicoptero', 'Forca Aerea');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(8, 'helicoptero', 'Forca Aerea');
INSERT INTO Meio(numMeio, nomeMeio, nomeEntidade) VALUES(9, 'helicoptero', 'Forca Aerea');

--- numMeio --- nomeEntidade
INSERT INTO MeioSocorro(numMeio, nomeEntidade) VALUES(1, 'Hospital');
INSERT INTO MeioSocorro(numMeio, nomeEntidade) VALUES(2, 'Hospital');
INSERT INTO MeioSocorro(numMeio, nomeEntidade) VALUES(3, 'Hospital');

--- numMeio --- nomeEntidade
INSERT INTO MeioApoio(numMeio, nomeEntidade) VALUES(1, 'Hospital');
INSERT INTO MeioApoio(numMeio, nomeEntidade) VALUES(6, 'Forca Aerea');
INSERT INTO MeioApoio(numMeio, nomeEntidade) VALUES(7, 'Forca Aerea');
INSERT INTO MeioApoio(numMeio, nomeEntidade) VALUES(8, 'Forca Aerea');
INSERT INTO MeioApoio(numMeio, nomeEntidade) VALUES(9, 'Forca Aerea');

--- numMeio --- nomeEntidade
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(4, 'Exercito');
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(5, 'Exercito');
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(6, 'Forca Aerea');
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(7, 'Forca Aerea');
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(8, 'Forca Aerea');
INSERT INTO MeioCombate(numMeio, nomeEntidade) VALUES(9, 'Forca Aerea');

--- numMeio --- nomeEntidade --- numProcessoSocorro
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(6, 'Forca Aerea', 1);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(7, 'Forca Aerea', 1);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(1, 'Hospital', 1);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(2, 'Hospital', 1);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(6, 'Forca Aerea', 2);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(1, 'Hospital', 2);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(3, 'Hospital', 2);
INSERT INTO Acciona(numMeio, nomeEntidade, numProcessoSocorro) VALUES(4, 'Exercito', 2);

--- numMeio --- nomeEntidade --- numVitimas --- numProcessoSocorro
INSERT INTO Transporta(numMeio, nomeEntidade, numVitimas, numProcessoSocorro) VALUES(1, 'Hospital', 5, 1);

--- numMeio --- nomeEntidade --- numHoras --- numProcessoSocorro
INSERT INTO Alocado(numMeio, nomeEntidade, numHoras, numProcessoSocorro) VALUES(6, 'Forca Aerea', 14, 1);

--- numTelefone --- instanteChamada --- nomePessoa --- moradaLocal --- numProcessoSocorro
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES(969235711,'2016-06-22 19:10:25', 'Luis Pinto', 'Natalia Luisa', 1);
INSERT INTO EventoEmergencia(numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro) VALUES(912267711,'2018-09-22 02:13:25', 'Rui Santo', 'Oliveira do Hospital', 2);

--- idCoordenador
INSERT INTO Coordenador(idCoordenador) VALUES(1);
INSERT INTO Coordenador(idCoordenador) VALUES(2);
INSERT INTO Coordenador(idCoordenador) VALUES(3);
INSERT INTO Coordenador(idCoordenador) VALUES(4);
INSERT INTO Coordenador(idCoordenador) VALUES(5);

---idCoordenador --- numMeio --- nomeEntidade --- numProcessoSocorro --- datahoraInicio --- datahoraFim --- dataAuditoria --- texto
INSERT INTO Audita(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro, datahoraInicio, datahoraFim, dataAuditoria, texto) VALUES(1, 6,'Forca Aerea', 1, '2016-06-23 10:00:00', '2016-06-30 19:05:15', '2019-06-30 20:00:00', 'Correu tudo bem.');
INSERT INTO Audita(idCoordenador, numMeio, nomeEntidade, numProcessoSocorro, datahoraInicio, datahoraFim, dataAuditoria, texto) VALUES(1, 1,'Hospital', 2, '2018-08-13 09:40:02', '2018-09-01 15:05:39', '2019-09-01 20:00:00', 'Correu tudo mal.');

--- idCoordenador --- dataHoraInicioVideo --- numCamara --- dataHoraInicio --- dataHoraFim
INSERT INTO Solicita(idCoordenador, dataHoraInicioVideo, numCamara, datahoraInicio, dataHoraFim) VALUES(1, '2016-06-22 19:00:25-07', 1, '2016-06-22 19:00:25-07', '2016-06-22 20:00:25-07');