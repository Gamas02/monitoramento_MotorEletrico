-- =========================================
-- CRIAÇÃO DO BANCO DE DADOS
-- =========================================
CREATE DATABASE IF NOT EXISTS monitoramento;

USE monitoramento;

-- =========================================
-- TABELA: registros do motor elétrico
-- =========================================
CREATE TABLE IF NOT EXISTS registros_motor (
    id INT AUTO_INCREMENT PRIMARY KEY,

    -- Data/hora da leitura (vinda do ThingSpeak)
    data_hora DATETIME NOT NULL,

    -- Sensores
    temperatura FLOAT NOT NULL,
    vibracao FLOAT NOT NULL,

    -- Origem do dado
    origem_dado VARCHAR(50) DEFAULT 'ThingSpeak',

    -- Data de inserção no banco
    data_insercao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- ÍNDICE (melhora performance de consultas)
-- =========================================
CREATE INDEX idx_data_hora ON registros_motor(data_hora);

-- =========================================
-- DADOS DE TESTE (OPCIONAL)
-- =========================================
INSERT INTO registros_motor (data_hora, temperatura, vibracao, origem_dado)
VALUES 
('2026-03-17 10:00:00', 60.5, 0.02, 'Simulado'),
('2026-03-17 10:05:00', 62.1, 0.03, 'Simulado'),
('2026-03-17 10:10:00', 65.0, 0.05, 'ThingSpeak');

-- =========================================
-- CONSULTAS ÚTEIS
-- =========================================

-- Todos os registros
SELECT * FROM registros_motor;

-- Últimos 10 registros
SELECT * FROM registros_motor
ORDER BY data_hora DESC
LIMIT 10;

-- Média de temperatura
SELECT AVG(temperatura) AS media_temperatura
FROM registros_motor;

-- Média de vibração
SELECT AVG(vibracao) AS media_vibracao
FROM registros_motor;

-- Maior vibração (importante para falhas)
SELECT MAX(vibracao) AS pico_vibracao
FROM registros_motor;

-- Maior temperatura
SELECT MAX(temperatura) AS pico_temperatura
FROM registros_motor;