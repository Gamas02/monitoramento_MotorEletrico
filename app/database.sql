-- =========================================
-- CRIAÇÃO DO BANCO DE DADOS
-- =========================================
CREATE DATABASE IF NOT EXISTS monitoramento;

-- Seleciona o banco
USE monitoramento;

-- =========================================
-- CRIAÇÃO DA TABELA PRINCIPAL
-- =========================================
CREATE TABLE IF NOT EXISTS registros_ambiente (
    id INT AUTO_INCREMENT PRIMARY KEY,
    
    -- Data e hora do dado vindo do ThingSpeak
    data_hora DATETIME NOT NULL,
    
    -- Valores do sensor
    temperatura FLOAT NOT NULL,
    umidade FLOAT NOT NULL,
    
    -- Origem do dado (ThingSpeak, Simulado, etc)
    origem_dado VARCHAR(50) DEFAULT 'ThingSpeak',
    
    -- Quando foi salvo no banco
    data_insercao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- =========================================
-- INSERÇÃO DE DADOS DE TESTE (OPCIONAL)
-- =========================================
INSERT INTO registros_ambiente (data_hora, temperatura, umidade, origem_dado)
VALUES 
('2026-03-17 10:00:00', 24.5, 55.0, 'Simulado'),
('2026-03-17 10:05:00', 25.1, 57.2, 'Simulado'),
('2026-03-17 10:10:00', 26.0, 60.3, 'ThingSpeak');

-- =========================================
-- CONSULTAS ÚTEIS (PARA TESTES)
-- =========================================

-- Ver todos os dados
SELECT * FROM registros_ambiente;

-- Últimos 10 registros
SELECT * FROM registros_ambiente
ORDER BY data_hora DESC
LIMIT 10;

-- Média de temperatura
SELECT AVG(temperatura) AS media_temperatura
FROM registros_ambiente;

-- Média de umidade
SELECT AVG(umidade) AS media_umidade
FROM registros_ambiente;

-- Maior temperatura registrada
SELECT MAX(temperatura) AS maior_temperatura
FROM registros_ambiente;

-- Menor temperatura registrada
SELECT MIN(temperatura) AS menor_temperatura
FROM registros_ambiente;