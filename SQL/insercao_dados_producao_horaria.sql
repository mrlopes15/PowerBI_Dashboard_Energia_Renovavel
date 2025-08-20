-- CUIDADO: O comando a seguir DELETARÁ TODOS OS dados da sua tabela de produção
-- para inserir um conjunto de dados novo, maior e mais realista.
DELETE FROM producao_horaria;

-- Este script usa a função generate_series para criar uma linha para cada hora
-- de cada parque, e então calcula uma produção realista baseada no tipo de energia.
INSERT INTO producao_horaria (id_parque, data_hora_leitura, geracao_mwh, velocidade_vento_ms, irradiancia_solar_wh_m2)

-- Usamos um Common Table Expression (CTE) para gerar a série de tempo
WITH time_series AS (
    SELECT generate_series(
        '2025-01-01 00:00:00'::timestamp, -- Data de início
        '2025-03-31 23:00:00'::timestamp, -- Data de fim
        '1 hour'::interval                -- Intervalo
    ) AS hora
),
-- Agora, cruzamos cada hora com cada parque para criar nossa base de registros
park_time_series AS (
    SELECT
        p.id_parque,
        p.nome_parque,
        p.tipo_energia,
        p.capacidade_instalada_mw,
        ts.hora
    FROM parques_energeticos p
    CROSS JOIN time_series ts
)
-- Finalmente, selecionamos da nossa base e calculamos a produção
SELECT
    id_parque,
    hora AS data_hora_leitura,

    -- Lógica para calcular a geração de energia
    CASE
        -- Para parques SOLARES
        WHEN tipo_energia = 'Solar' THEN
            -- A produção só ocorre entre 6h e 18h
            CASE
                WHEN EXTRACT(HOUR FROM hora) >= 6 AND EXTRACT(HOUR FROM hora) <= 18 THEN
                    -- Simula uma curva senoidal para o sol (0 -> pico -> 0) com um pouco de aleatoriedade
                    (capacidade_instalada_mw * sin( (EXTRACT(HOUR FROM hora) - 6) * pi() / 12 )) * (0.8 + random() * 0.2)
                ELSE 0
            END
        -- Para parques EÓLICOS
        WHEN tipo_energia = 'Eólica' THEN
            -- Simula uma produção aleatória entre 40% e 95% da capacidade
            capacidade_instalada_mw * (0.4 + random() * 0.55)
        ELSE 0
    END AS geracao_mwh,

    -- Lógica para calcular a velocidade do vento (apenas para eólicos)
    CASE
        WHEN tipo_energia = 'Eólica' THEN 8 + random() * 7 -- Vento entre 8 e 15 m/s
        ELSE NULL
    END AS velocidade_vento_ms,

    -- Lógica para calcular a irradiação solar (apenas para solares)
    CASE
        WHEN tipo_energia = 'Solar' THEN
            CASE
                WHEN EXTRACT(HOUR FROM hora) >= 6 AND EXTRACT(HOUR FROM hora) <= 18 THEN
                    -- Irradiação segue a mesma curva da produção
                    1050 * sin( (EXTRACT(HOUR FROM hora) - 6) * pi() / 12 ) * (0.7 + random() * 0.3)
                ELSE 0
            END
        ELSE NULL
    END AS irradiancia_solar_wh_m2

FROM park_time_series;