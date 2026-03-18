import requests
import os
from dotenv import load_dotenv

load_dotenv()

API_KEY = os.getenv("THLP3MKO5MRKXQIT")

def enviar_dados(temperatura, vibracao):
    url = "https://api.thingspeak.com/update"
    payload = {
        "api_key": API_KEY,
        "field1": temperatura,
        "field2": vibracao
    }

    try:
        response = requests.get(url, params=payload)
        print(f"Enviado para ThingSpeak: temperatura={temperatura}, vibracao={vibracao} | Status: {response.status_code}")
    except Exception as e:
        print("Erro ao enviar dados para ThingSpeak:", e)