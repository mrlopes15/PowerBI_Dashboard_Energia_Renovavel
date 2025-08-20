-- CUIDADO: O comando a seguir DELETARÁ TODOS os dados da sua tabela de produção
-- para inserir o novo conjunto de dados focado no 1º trimestre.
DELETE FROM producao_horaria;

-- Este script usa a função generate_series para criar uma linha para cada hora
-- de cada parque, e então calcula uma produção realista baseada no tipo de energia.
INSERT INTO producao_horaria 
(id_parque, data_hora_leitura, geracao_mwh, velocidade_vento_ms, irradiancia_solar_wh_m2)

-- Usamos uma "Common Table Expression" (CTE), que é como uma tabela temporária.
-- Esta primeira CTE, chamada 'serie_temporal', cria a nossa linha do tempo.
WITH serie_temporal AS (
    SELECT generate_series(
        '2025-01-01 00:00:00'::timestamp, -- Data de início
        '2025-03-31 23:00:00'::timestamp, -- Data de fim
        '1 hour'::interval                -- Intervalo
    ) AS hora
),

-- Esta segunda CTE, 'serie_temporal_dos_parques', cruza cada hora da CTE anterior
-- com cada parque da nossa tabela 'parques_energeticos'.
serie_temporal_dos_parques AS (
    SELECT
        parques.id_parque,
        parques.nome_parque,
        parques.tipo_energia,
        parques.capacidade_instalada_mw,
        temporal.hora
    FROM parques_energeticos AS parques
    CROSS JOIN serie_temporal AS temporal
)

-- Finalmente, fazemos a seleção a partir da nossa CTE final ('serie_temporal_dos_parques')
-- e calculamos os valores para inserir na tabela 'producao_horaria'.
SELECT
    id_parque,
    hora AS data_hora_leitura,

    -- Lógica para calcular a geração de energia em megawatt-hora (mwh)
    CASE
        WHEN tipo_energia = 'Solar' THEN
            CASE
                WHEN EXTRACT(HOUR FROM hora) >= 6 AND EXTRACT(HOUR FROM hora) <= 18 THEN
                    (capacidade_instalada_mw * sin( (EXTRACT(HOUR FROM hora) - 6) * pi() / 12 )) * (0.8 + random() * 0.2)
                ELSE 0
            END
        WHEN tipo_energia = 'Eólica' THEN
            capacidade_instalada_mw * (0.4 + random() * 0.55)
        ELSE 0
    END AS geracao_mwh,

    -- Lógica para calcular a velocidade do vento em metros por segundo (ms)
    CASE
        WHEN tipo_energia = 'Eólica' THEN 8 + random() * 7
        ELSE NULL
    END AS velocidade_vento_ms,

    -- Lógica para calcular a irradiação solar em watt-hora por metro quadrado (wh_m2)
    CASE
        WHEN tipo_energia = 'Solar' THEN
            CASE
                WHEN EXTRACT(HOUR FROM hora) >= 6 AND EXTRACT(HOUR FROM hora) <= 18 THEN
                    1050 * sin( (EXTRACT(HOUR FROM hora) - 6) * pi() / 12 ) * (0.7 + random() * 0.3)
                ELSE 0
            END
        ELSE NULL
    END AS irradiancia_solar_wh_m2

FROM serie_temporal_dos_parques;