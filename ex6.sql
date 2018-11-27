-- numMeio, nomeMeio, nome Entidade
INSERT INTO EntidadeMeio VALUES('Bombeiros');

INSERT INTO EntidadeMeio VALUES('Forca Aerea');
INSERT INTO EntidadeMeio VALUES('Exercito');
INSERT INTO EntidadeMeio VALUES('Marinha');

INSERT INTO Meio VALUES (1, 'Mota1', 'Forca Aerea');
INSERT INTO Meio VALUES (2, 'Mota2', 'Forca Aerea');
INSERT INTO Meio VALUES (1, 'Carro1', 'Exercito');
INSERT INTO Meio VALUES (2, 'Carro2', 'Exercito');
INSERT INTO Meio VALUES (1, 'Barco', 'Marinha');

INSERT INTO MeioCombate VALUES (1, 'Forca Aerea');
INSERT INTO MeioCombate VALUES (2, 'Forca Aerea');
INSERT INTO MeioCombate VALUES (1, 'Exercito');
INSERT INTO MeioCombate VALUES (2, 'Exercito');
INSERT INTO MeioCombate VALUES (1, 'Marinha');

INSERT INTO ProcessoSocorro VALUES(1);
INSERT INTO ProcessoSocorro VALUES(2);
INSERT INTO ProcessoSocorro VALUES(3);

--Processo1
INSERT INTO Acciona VALUES(1, 'Forca Aerea', 1);
INSERT INTO Acciona VALUES(2, 'Forca Aerea', 1);
INSERT INTO Acciona VALUES(1, 'Exercito', 1);
INSERT INTO Acciona VALUES(1, 'Marinha', 1);

--Processo2
INSERT INTO Acciona VALUES(1, 'Forca Aerea', 2);
INSERT INTO Acciona VALUES(2, 'Forca Aerea', 2);
INSERT INTO Acciona VALUES(1, 'Exercito', 2);
INSERT INTO Acciona VALUES(1, 'Marinha', 2);

--Processo3
INSERT INTO Acciona VALUES(1, 'Forca Aerea', 3);
INSERT INTO Acciona VALUES(2, 'Forca Aerea', 3);
INSERT INTO Acciona VALUES(1, 'Exercito', 3);





