import time
from app.sensors.sensor_reader import ler_dados
from app.services.thingspeak import enviar_dados
from app.database.insert_data import inserir_dados

def main():
    while True:
        temperatura, vibracao = ler_dados()

        enviar_dados(temperatura, vibracao)
        
        inserir_dados(temperatura, vibracao, origem="Simulado")

        time.sleep(15)

if __name__ == "__main__":
    main()