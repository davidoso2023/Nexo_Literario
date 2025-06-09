from flask import Blueprint, request, redirect, render_template, flash
from services.auth_service import registrar_usuario
from services.auth_service import login_usuario

from flask import session

auth_bp = Blueprint("auth", __name__)


@auth_bp.route("/registro", methods=["GET", "POST"])
def registro():
    if request.method == "POST":
        nombre = request.form["nombre"]
        correo = request.form["correo"]
        contraseña = request.form["contraseña"]
        facultad_id = request.form["facultad_id"]
        registrar_usuario(nombre, correo, contraseña, facultad_id)
        flash("Usuario registrado correctamente.")
        return redirect("/registro")  # puedes cambiar esto a /login luego
    return render_template("registro.html")


@auth_bp.route("/login", methods=["GET", "POST"])
def login():
    if request.method == "POST":
        correo = request.form["correo"]
        contraseña = request.form["contraseña"]
        usuario = login_usuario(correo, contraseña)

        if usuario:
            session["usuario_id"] = usuario["id_usuarios"]
            session["nombre"] = usuario["nombre"]
            return redirect("/inicio")
        else:
            flash("Correo o contraseña incorrectos.")
            return redirect("/login")

    return render_template("login.html")
