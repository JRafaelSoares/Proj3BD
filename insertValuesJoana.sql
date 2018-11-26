--- numCamara
INSERT INTO Camara VALUES(1);
INSERT INTO Camara VALUES(2);
INSERT INTO Camara VALUES(3);
INSERT INTO Camara VALUES(4);
INSERT INTO Camara VALUES(5);
INSERT INTO Camara VALUES(6);

--- dataHoraInicio --- dataHoraFim --- numCamara
INSERT INTO Video VALUES('2016-06-22 19:00:25-07', '2018-12-22 20:00:25-07', 1);
INSERT INTO Video VALUES('2018-08-22 19:00:25-07', '2018-08-22 19:01:35-07', 6);

--- numSegmento --- duracao --- dataHoraInicio --- numCamara
INSERT INTO SegmentoVideo VALUES(1, '00:00:20', '2016-06-22 19:00:25-07', 1);
INSERT INTO SegmentoVideo VALUES(2, '00:00:20', '2016-06-22 19:00:25-07', 1);
INSERT INTO SegmentoVideo VALUES(3, '00:00:20', '2016-06-22 19:00:25-07', 1);
INSERT INTO SegmentoVideo VALUES(4, '00:01:10', '2018-08-22 19:00:25-07', 6);

--- moradaLocal
INSERT INTO Local VALUES('Oliveira do Hospital');
INSERT INTO Local VALUES('Natalia Luisa');
INSERT INTO Local VALUES('Monchique');

--- moradaLocal --- numCamara
INSERT INTO Vigia VALUES('Oliveira do Hospital', 1);
INSERT INTO Vigia VALUES('Oliveira do Hospital', 2);
INSERT INTO Vigia VALUES('Oliveira do Hospital', 3);
INSERT INTO Vigia VALUES('Natalia Luisa', 4);
INSERT INTO Vigia VALUES('Natalia Luisa', 5);
INSERT INTO Vigia VALUES('Monchique', 6);

--- numProcessoSocorro
INSERT INTO ProcessoSocorro VALUES(1);
INSERT INTO ProcessoSocorro VALUES(2);
INSERT INTO ProcessoSocorro VALUES(3);
INSERT INTO ProcessoSocorro VALUES(4);
INSERT INTO ProcessoSocorro VALUES(5);

--- nomeEntidade
INSERT INTO EntidadeMeio VALUES('Bombeiros');
INSERT INTO EntidadeMeio VALUES('Exercito');
INSERT INTO EntidadeMeio VALUES('Forca Aerea');
INSERT INTO EntidadeMeio VALUES('Policia');
INSERT INTO EntidadeMeio VALUES('Municipio');
INSERT INTO EntidadeMeio VALUES('Hospital');

--- numMeio --- nomeMeio --- nomeEntidade
INSERT INTO Meio VALUES(1, 'Ambulancia', 'Hospital');
INSERT INTO Meio VALUES(2, 'Ambulancia', 'Hospital');
INSERT INTO Meio VALUES(3, 'Ambulancia', 'Hospital');
INSERT INTO Meio VALUES(4, 'Tanque', 'Exercito');
INSERT INTO Meio VALUES(5, 'Tanque', 'Exercito');
INSERT INTO Meio VALUES(6, 'Helicoptero', 'Forca Aerea');
INSERT INTO Meio VALUES(7, 'helicoptero', 'Forca Aerea');
INSERT INTO Meio VALUES(8, 'helicoptero', 'Forca Aerea');
INSERT INTO Meio VALUES(9, 'helicoptero', 'Forca Aerea');

--- numMeio --- nomeEntidade
INSERT INTO MeioSocorro VALUES(1, 'Hospital');
INSERT INTO MeioSocorro VALUES(2, 'Hospital');
INSERT INTO MeioSocorro VALUES(3, 'Hospital');

--- numMeio --- nomeEntidade
INSERT INTO MeioApoio VALUES(1, 'Hospital');
INSERT INTO MeioApoio VALUES(6, 'Forca Aerea');
INSERT INTO MeioApoio VALUES(7, 'Forca Aerea');
INSERT INTO MeioApoio VALUES(8, 'Forca Aerea');
INSERT INTO MeioApoio VALUES(9, 'Forca Aerea');

--- numMeio --- nomeEntidade
INSERT INTO MeioCombate VALUES(4, 'Exercito');
INSERT INTO MeioCombate VALUES(5, 'Exercito');
INSERT INTO MeioCombate VALUES(6, 'Forca Aerea');
INSERT INTO MeioCombate VALUES(7, 'Forca Aerea');
INSERT INTO MeioCombate VALUES(8, 'Forca Aerea');
INSERT INTO MeioCombate VALUES(9, 'Forca Aerea');

--- numMeio --- nomeEntidade --- numProcessoSocorro
INSERT INTO Acciona VALUES(6, 'Forca Aerea', 1);
INSERT INTO Acciona VALUES(7, 'Forca Aerea', 1);
INSERT INTO Acciona VALUES(1, 'Hospital', 1);
INSERT INTO Acciona VALUES(2, 'Hospital', 1);
INSERT INTO Acciona VALUES(6, 'Forca Aerea', 2);
INSERT INTO Acciona VALUES(1, 'Hospital', 2);
INSERT INTO Acciona VALUES(3, 'Hospital', 2);
INSERT INTO Acciona VALUES(4, 'Exercito', 2);

--- nomeEntidade --- numMeio --- numProcessoSocorro --- numVitimas
INSERT INTO Transporta VALUES('Hospital', 1, 1, 5);

--- nomeEntidade --- numMeio --- numProcessoSocorro --- numHoras
INSERT INTO Alocado VALUES('Forca Aerea', 6, 1, 14);

--- numTelefone --- instanteChamada --- nomePessoa --- moradaLocal --- numProcessoSocorro
INSERT INTO EventoEmergencia VALUES(969235711,'2016-06-22 19:10:25-07', 'Luis Pinto', 'Natalia Luisa', 1);
INSERT INTO EventoEmergencia VALUES(912267711,'2018-09-22 02:13:25-07', 'Rui Santo', 'Oliveira do Hospital', 2);

--- idCoordenador
INSERT INTO Coordenador VALUES(1);
INSERT INTO Coordenador VALUES(2);
INSERT INTO Coordenador VALUES(3);
INSERT INTO Coordenador VALUES(4);
INSERT INTO Coordenador VALUES(5);

--- nomeEntidade --- numMeio --- numProcessoSocorro --- idCoordenador --- datahoraInicio --- datahoraFim --- dataAuditoria --- texto
INSERT INTO Audita VALUES('Forca Aerea', 6, 1, 1, '2016-06-23 10:00:00-07', '2016-06-30 19:05:15-07', '2019-06-30 20:00:00-07', 'Correu tudo bem.');
INSERT INTO Audita VALUES('Hospital', 1, 2, 1, '2018-08-13 09:40:02-07', '2018-09-01 15:05:39-07', '2019-09-01 20:00:00-07', 'Correu tudo mal.');

--- idCoordenador --- dataHoraInicioVideo --- numCamara --- dataHoraInicio --- dataHoraFim
INSERT INTO Solicita VALUES(1, '2016-06-22 19:00:25-07', 1, '2016-06-22 19:00:25-07', '2016-06-22 20:00:25-07');