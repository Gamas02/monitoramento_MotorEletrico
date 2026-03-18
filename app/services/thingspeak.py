# app/services/thingspeak.py
import requests
import os

API_KEY = os.getenv("THINGSPEAK_API_KEY")

def enviar_dados(temp, vib):
    url = "https://api.thingspeak.com/update"
    payload = {
        "api_key": API_KEY,
        "field1": temp,
        "field2": vib
    }

    requests.get(url, params=payload)