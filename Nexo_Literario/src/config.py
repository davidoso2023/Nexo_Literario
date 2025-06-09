import mysql.connector


def get_connection():
    return mysql.connector.connect(
        host="localhost",
        user="root",
        password="",  # o tu contraseña
        database="nexo_literario",
    )
