
-- Camara
insert into Camara(numCamara) values(0);
insert into Camara(numCamara) values(1);
insert into Camara(numCamara) values(2);
insert into Camara(numCamara) values(3);
insert into Camara(numCamara) values(4);
insert into Camara(numCamara) values(5);
insert into Camara(numCamara) values(6);
insert into Camara(numCamara) values(7);
insert into Camara(numCamara) values(8);
insert into Camara(numCamara) values(9);
insert into Camara(numCamara) values(10);
insert into Camara(numCamara) values(11);
insert into Camara(numCamara) values(12);

-- Video


-- Processo Socorro
insert into ProcessoSocorro(numProcessoSocorro) values(0);
insert into ProcessoSocorro(numProcessoSocorro) values(1);
insert into ProcessoSocorro(numProcessoSocorro) values(2);
insert into ProcessoSocorro(numProcessoSocorro) values(3);
insert into ProcessoSocorro(numProcessoSocorro) values(4);
insert into ProcessoSocorro(numProcessoSocorro) values(5);
insert into ProcessoSocorro(numProcessoSocorro) values(6);
insert into ProcessoSocorro(numProcessoSocorro) values(7);

-- Entidade Meio
insert into EntidadeMeio(nomeEntidade) values('Bombeiros');
insert into EntidadeMeio(nomeEntidade) values('Forca Aerea');
insert into EntidadeMeio(nomeEntidade) values('INEM');
insert into EntidadeMeio(nomeEntidade) values('GNR');
insert into EntidadeMeio(nomeEntidade) values('PSP');

-- Meio
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(0, 'Ambulancia', 'INEM');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(1, 'Ambulancia', 'INEM');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(2, 'Ambulancia', 'INEM');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(3, 'Ambulancia', 'INEM');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(4, 'Ambulancia', 'INEM');

insert into Meio(numMeio, nomeMeio, nomeEntidade) values(0, 'Carrinha', 'Bombeiros');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(1, 'Carrinha', 'Bombeiros');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(2, 'Carrinha', 'Bombeiros');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(3, 'Carrinha', 'Bombeiros');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(4, 'Carrinha', 'Bombeiros');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(5, 'Carrinha', 'Bombeiros');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(6, 'Carrinha', 'Bombeiros');

insert into Meio(numMeio, nomeMeio, nomeEntidade) values(0, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(1, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(2, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(3, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(4, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(5, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(6, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(7, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(8, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(9, 'Carro', 'PSP');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(10, 'Carro', 'PSP');

insert into Meio(numMeio, nomeMeio, nomeEntidade) values(0, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(1, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(2, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(3, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(4, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(5, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(6, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(7, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(8, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(9, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(10, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(11, 'Carro', 'GNR');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(12, 'Carro', 'GNR');

insert into Meio(numMeio, nomeMeio, nomeEntidade) values(0, 'Canadair', 'Forca Aerea');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(1, 'Canadair', 'Forca Aerea');
insert into Meio(numMeio, nomeMeio, nomeEntidade) values(2, 'Canadair', 'Forca Aerea');


-- Meio Combate
insert into MeioCombate(numMeio, nomeEntidade) values(0, 'Bombeiros');
insert into MeioCombate(numMeio, nomeEntidade) values(1, 'Bombeiros');
insert into MeioCombate(numMeio, nomeEntidade) values(2, 'Bombeiros');
insert into MeioCombate(numMeio, nomeEntidade) values(3, 'Bombeiros');
insert into MeioCombate(numMeio, nomeEntidade) values(4, 'Bombeiros');
insert into MeioCombate(numMeio, nomeEntidade) values(5, 'Bombeiros');
insert into MeioCombate(numMeio, nomeEntidade) values(6, 'Bombeiros');

insert into MeioCombate(numMeio, nomeEntidade) values(0, 'Forca Aerea');
insert into MeioCombate(numMeio, nomeEntidade) values(1, 'Forca Aerea');
insert into MeioCombate(numMeio, nomeEntidade) values(2, 'Forca Aerea');

-- MeioApoio
insert into MeioApoio(numMeio, nomeEntidade) values(0, 'Bombeiros');
insert into MeioApoio(numMeio, nomeEntidade) values(1, 'Bombeiros');
insert into MeioApoio(numMeio, nomeEntidade) values(2, 'Bombeiros');
insert into MeioApoio(numMeio, nomeEntidade) values(3, 'Bombeiros');
insert into MeioApoio(numMeio, nomeEntidade) values(4, 'Bombeiros');
insert into MeioApoio(numMeio, nomeEntidade) values(5, 'Bombeiros');
insert into MeioApoio(numMeio, nomeEntidade) values(6, 'Bombeiros');

insert into MeioApoio(numMeio, nomeEntidade) values(0, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(1, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(2, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(3, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(4, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(5, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(6, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(7, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(8, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(9, 'PSP');
insert into MeioApoio(numMeio, nomeEntidade) values(10, 'PSP');

insert into MeioApoio(numMeio, nomeEntidade) values(0, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(1, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(2, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(3, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(4, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(5, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(6, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(7, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(8, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(9, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(10, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(11, 'GNR');
insert into MeioApoio(numMeio, nomeEntidade) values(12, 'GNR');

-- Meio Socorro
insert into MeioSocorro(numMeio, nomeEntidade) values(0, 'INEM');
insert into MeioSocorro(numMeio, nomeEntidade) values(1, 'INEM');
insert into MeioSocorro(numMeio, nomeEntidade) values(2, 'INEM');
insert into MeioSocorro(numMeio, nomeEntidade) values(3, 'INEM');
insert into MeioSocorro(numMeio, nomeEntidade) values(4, 'INEM');

-- Acciona
insert into Acciona(numProcessoSocorro, nomeEntidade, numMeio) values(0, 'INEM', 0);
insert into Acciona(numProcessoSocorro, nomeEntidade, numMeio) values(0, 'INEM', 1);
insert into Acciona(numProcessoSocorro, nomeEntidade, numMeio) values(1, 'INEM', 0);
insert into Acciona(numProcessoSocorro, nomeEntidade, numMeio) values(1, 'INEM', 1);
insert into Acciona(numProcessoSocorro, nomeEntidade, numMeio) values(3, 'INEM', 0);
insert into Acciona(numProcessoSocorro, nomeEntidade, numMeio) values(4, 'INEM', 0);