CREATE TABLE Parques_Energeticos (
	id_parque SERIAL PRIMARY KEY,
	nome_parque VARCHAR (100) NOT NULL,
	tipo_energia VARCHAR (50) NOT NULL,
	cidade VARCHAR (50),
	estado VARCHAR (2),
	capacidade_instalada_mw INT,
	data_inicio_operacao DATE
);

CREATE TABLE Metas_Producao (
    id_meta SERIAL PRIMARY KEY,
    id_parque INT REFERENCES Parques_Energeticos(id_parque),
    mes_ano DATE,
    meta_mwh INT
);

CREATE TABLE Manutencoes (
    id_manutencao SERIAL PRIMARY KEY,
    id_parque INT REFERENCES Parques_Energeticos(id_parque),
    data_inicio TIMESTAMP,
    data_fim TIMESTAMP,
    tipo_manutencao VARCHAR(50),
    custo_manutencao NUMERIC(12, 2),
    horas_parado INT
);

CREATE TABLE Producao_Horaria (
    id_producao SERIAL PRIMARY KEY,
    id_parque INT REFERENCES Parques_Energeticos(id_parque),
    data_hora_leitura TIMESTAMP,
    geracao_mwh NUMERIC(10, 2),
    velocidade_vento_ms NUMERIC(5, 2),
    irradiancia_solar_wh_m2 NUMERIC(10, 2)
);


INSERT INTO Parques_Energeticos 
	(nome_parque, tipo_energia, cidade, estado, capacidade_instalada_mw, data_inicio_operacao) 
VALUES
	('Parque Eólico de Icaraí', 'Eólica', 'Amontada', 'CE', 150, '2021-03-15'),
	('Usina Solar de Tauá', 'Solar', 'Tauá', 'CE', 120, '2022-08-01'),
	('Parque Eólico Delta', 'Eólica', 'Parnaíba', 'PI', 200, '2020-11-20'),
	('Usina Solar de Mossoró', 'Solar', 'Mossoró', 'RN', 180, '2023-05-10'),
	('Parque Eólico de Jeri', 'Eólica', 'Jijoca de Jericoacoara', 'CE', 100, '2024-02-01');


INSERT INTO Metas_Producao 
	(id_parque, mes_ano, meta_mwh) 
VALUES
	(1, '2025-07-01', 70000), 
	(2, '2025-07-01', 55000), 
	(3, '2025-07-01', 85000),
	(4, '2025-07-01', 75000), 
	(5, '2025-07-01', 45000), 
	(1, '2025-08-01', 72000),
	(2, '2025-08-01', 58000), 
	(3, '2025-08-01', 88000), 
	(4, '2025-08-01', 79000),
	(5, '2025-08-01', 48000),
	(1, '2025-09-01', 75000),
	(2, '2025-09-01', 62000),
	(3, '2025-09-01', 90000),
	(4, '2025-09-01', 82000),
	(5, '2025-09-01', 50000),
	(1, '2025-09-01', 72000),
	(2, '2025-09-01', 58000), 
	(3, '2025-09-01', 88000), 
	(4, '2025-09-01', 79000),
	(5, '2025-09-01', 48000),
	(1, '2025-10-01', 72000),
	(2, '2025-10-01', 58000), 
	(3, '2025-10-01', 88000), 
	(4, '2025-10-01', 79000),
	(5, '2025-10-01', 48000),
	(1, '2025-11-01', 72000),
	(2, '2025-11-01', 58000), 
	(3, '2025-11-01', 88000), 
	(4, '2025-11-01', 79000),
	(5, '2025-11-01', 48000),
	(1, '2025-12-01', 72000),
	(2, '2025-12-01', 58000), 
	(3, '2025-12-01', 88000), 
	(4, '2025-12-01', 79000),
	(5, '2025-12-01', 48000);


INSERT INTO Manutencoes 
	(id_parque, data_inicio, data_fim, tipo_manutencao, custo_manutencao, horas_parado) 
VALUES
	(1, '2025-07-20 09:00:00', '2025-07-20 18:00:00', 'Preventiva', 35000.00, 9),
	(2, '2025-08-05 08:00:00', '2025-08-05 12:00:00', 'Preventiva', 20000.00, 4),
	(2, '2025-08-11 22:00:00', '2025-08-12 04:00:00', 'Corretiva', 65000.00, 9),
	(3, '2025-07-10 08:00:00', '2025-07-12 17:00:00', 'Corretiva', 150000.00, 57),
	(3, '2025-08-01 11:00:00', '2025-08-02 11:00:00', 'Preventiva', 255000.00, 24),
	(4, '2025-07-25 08:30:00', '2025-07-28 18:00:00', 'Corretiva', 210000.00, 81),
	(5, '2025-08-10 10:00:00', '2025-08-10 16:00:00', 'Preventiva', 45000.00, 6);



INSERT INTO Producao_Horaria 
	(id_parque, data_hora_leitura, geracao_mwh, velocidade_vento_ms, irradiancia_solar_wh_m2) 
VALUES
	(1, '2025-08-12 13:00:00', 95.50, 11.5, NULL),
	(1, '2025-08-12 14:00:00', 102.30, 12.1, NULL),
	(1, '2025-08-14 04:00:00', 115.2, 12.5, NULL),
	(1, '2025-08-14 16:00:00', 92.8, 10.8, NULL),
	(1, '2025-08-15 05:00:00', 75.5, 9.5, NULL),
	(1, '2025-08-15 11:00:00', 68.2, 8.8, NULL),
	(1, '2025-08-15 17:00:00', 82.0, 10.2, NULL),
	(2, '2025-08-12 13:00:00', 80.20, NULL, 850),
	(2, '2025-08-12 14:00:00', 75.60, NULL, 820),
	(2, '2025-08-14 08:00:00', 45.3, NULL, 550),
	(2, '2025-08-14 13:00:00', 118.1, NULL, 995),
	(2, '2025-08-14 17:00:00', 15.5, NULL, 210),
	(2, '2025-08-15 09:00:00', 75.4, NULL, 710),
	(2, '2025-08-15 12:00:00', 110.0, NULL, 950),
	(2, '2025-08-15 15:00:00', 35.1, NULL, 340),
	(3, '2025-08-12 13:00:00', 150.00, 13.2, NULL),
	(3, '2025-08-12 15:00:00', 155.40, 13.5, NULL),
	(3, '2025-08-14 04:00:00', 188.6, 14.0, NULL),
	(3, '2025-08-14 16:00:00', 160.1, 12.5, NULL),
	(3, '2025-08-15 05:00:00', 185.1, 13.8, NULL),
	(3, '2025-08-15 17:00:00', 179.3, 13.2, NULL),
	(4, '2025-08-12 15:00:00', 120.00, NULL, 750),
	(4, '2025-08-14 08:00:00', 105.0, NULL, 580),
	(4, '2025-08-14 13:00:00', 175.0, NULL, 1020),
	(4, '2025-08-14 17:00:00', 25.8, NULL, 230),
	(4, '2025-08-15 09:00:00', 70.8, NULL, 450),
	(4, '2025-08-15 12:00:00', 95.0, NULL, 610),
	(4, '2025-08-15 15:00:00', 65.3, NULL, 420),
	(5, '2025-08-12 14:00:00', 88.90, 14.0, NULL),
	(5, '2025-08-14 04:00:00', 93.3, 14.6, NULL),
	(5, '2025-08-14 16:00:00', 95.1, 15.0, NULL),
	(5, '2025-08-15 05:00:00', 94.2, 14.8, NULL),
	(5, '2025-08-15 11:00:00', 95.9, 15.1, NULL),
	(5, '2025-08-15 17:00:00', 93.8, 14.7, NULL);





SELECT * FROM MANUTENCOES
SELECT * FROM METAS_PRODUCAO
SELECT * FROM PARQUES_ENERGETICOS
SELECT * FROM PRODUCAO_HORARIA











