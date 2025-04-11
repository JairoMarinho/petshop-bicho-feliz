from flask import Flask, render_template, request

app = Flask(__name__)

@app.route("/")
def home():
    return render_template("home.html")

@app.route("/cadastro", methods=["GET", "POST"])
def cadastro():
    if request.method == "POST":
        nome = request.form["nome"]
        pet = request.form["pet"]
        # Aqui entraria lógica para salvar no banco
        return f"Cliente {nome} com pet {pet} cadastrado!"
    return render_template("cadastro.html")

if __name__ == "__main__":
    app.run(debug=True)