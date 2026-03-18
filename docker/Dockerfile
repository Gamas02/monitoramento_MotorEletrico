# Dockerfile
FROM python:3.11-slim

# Define diretório de trabalho
WORKDIR /app

# Copia requirements e instala dependências
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copia o código da aplicação
COPY app ./app

# Copia arquivo .env para dentro do container (opcional)
COPY .env .

# Comando para rodar a aplicação
CMD ["python", "app/app.py"]