from config import get_connection


def registrar_usuario(nombre, correo, contraseña, facultad_id):
    conn = get_connection()
    cursor = conn.cursor()
    cursor.callproc("sp_RegistrarUsuario", [nombre, correo, contraseña, facultad_id])
    conn.commit()
    cursor.close()
    conn.close()


def login_usuario(correo, contraseña):
    conn = get_connection()
    cursor = conn.cursor(dictionary=True)
    cursor.callproc("sp_Login", [correo, contraseña])

    for result in cursor.stored_results():
        usuario = result.fetchone()

    cursor.close()
    conn.close()

    return usuario  
