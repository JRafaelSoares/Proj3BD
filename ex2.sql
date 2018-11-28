--EVENTO EMERGENCIA
--numProcessoSocorro
INSERT INTO ProcessoSocorro VALUES (1);
INSERT INTO ProcessoSocorro VALUES (2);
INSERT INTO ProcessoSocorro VALUES (3);

--moradaLocal
INSERT INTO Local VALUES('Cascais');
INSERT INTO Local VALUES('Lisboa');
INSERT INTO Local VALUES('Parede');

--numTelefone, instanteChamada, nomePessoa, moradaLocal, numProcessoSocorro
INSERT INTO EventoEmergencia VALUES (123123123, '2018-06-30 19:19:19', 'Manuel', 'Cascais', 1);
INSERT INTO EventoEmergencia VALUES (123123124, '2018-06-30 19:19:19', 'Peshoa', 'Lisboa', 2);
INSERT INTO EventoEmergencia VALUES (123123125, '2017-06-30 19:19:18', 'asd', 'Cascais', 1);

--ACCIONA

INSERT INTO EntidadeMeio VALUES ('A');
INSERT INTO EntidadeMeio VALUES ('B');
INSERT INTO EntidadeMeio VALUES ('C');

--numMeio nomeMeio nomeEntidade
INSERT INTO Meio VALUES (0, 'asd', 'A');
INSERT INTO Meio VALUES (1, 'ddd', 'A');
INSERT INTO Meio VALUES (2, 'kkk', 'B');
INSERT INTO Meio VALUES (3, 'asdf', 'C');

INSERT INTO Acciona VALUES (0, 'A', 1);
INSERT INTO Acciona VALUES (2, 'B', 2);
INSERT INTO Acciona VALUES (0, 'A', 3);
INSERT INTO Acciona VALUES (3, 'C', 3);