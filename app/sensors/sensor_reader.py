# app/sensors/sensor_reader.py
import random

def ler_dados():
    temperatura = round(random.uniform(20, 30), 2)
    vibracao = round(random.uniform(50, 70), 2)
    return temperatura, vibracao