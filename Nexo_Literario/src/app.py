from flask import Flask, session, render_template, redirect
from controllers.auth_controller import auth_bp

app = Flask(__name__)
app.secret_key = "tu_clave_secreta"  

app.register_blueprint(auth_bp)


@app.route("/inicio")
def inicio():
    if "usuario_id" in session:
        nombre = session.get("nombre")
        return (
            f"<h1>Bienvenido, {nombre}</h1><p>¡Has iniciado sesión correctamente!</p>"
        )
    else:
        return redirect("/login")


if __name__ == "__main__":
    app.run(debug=True)
