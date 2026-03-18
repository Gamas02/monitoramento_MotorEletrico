from app.database.connection import get_connection
from datetime import datetime

def inserir_dados(temperatura, vibracao, origem="Simulado"):
    conn = get_connection()
    cursor = conn.cursor()

    sql = """
        INSERT INTO registros_ambiente (data_hora, temperatura, vibracao, origem_dado)
        VALUES (%s, %s, %s, %s)
    """
    data_hora = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    valores = (data_hora, temperatura, vibracao, origem)

    cursor.execute(sql, valores)
    conn.commit()
    cursor.close()
    conn.close()