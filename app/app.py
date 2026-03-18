# app/main.py
import time
from app.sensors.sensor_reader import ler_dados
from app.services.thingspeak import enviar_dados

while True:
    temperatura, vibracao = ler_dados()
    enviar_dados(temperatura, vibracao)
    time.sleep(15)