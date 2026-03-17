CREATE TABLE dados_motor (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vibracao FLOAT,
    temperatura FLOAT,
    data_hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);