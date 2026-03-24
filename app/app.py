import time
from app.sensors.sensor_reader import ler_dados
from app.services.thingspeak import enviar_dados
from app.database.insert_data import inserir_dados
from app.database.connection import get_connection

def wait_for_db(retries=10, delay=3):
    for i in range(retries):
        try:
            conn = get_connection()
            conn.close()
            print("MySQL pronto!")
            return
        except Exception as e:
            print(f"Aguardando MySQL ({i+1}/{retries})... {e}")
            time.sleep(delay)
    raise Exception("Não foi possível conectar ao MySQL.")

wait_for_db()

def main():
    while True:
        temperatura, vibracao = ler_dados()

        enviar_dados(temperatura, vibracao)
        
        inserir_dados(temperatura, vibracao, origem="Simulado")

        time.sleep(15)

if __name__ == "__main__":
    main()