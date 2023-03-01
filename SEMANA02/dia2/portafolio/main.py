from flask import Flask,request,render_template

app = Flask(__name__)

@app.route('/')
def index():
    nombre = 'Eduardo Rodriguez'
    context = {
        'nombre':nombre
    }
    return render_template('index.html',**context)

@app.route('/portafolio')
def portafolio():
    return render_template('portafolio.html')

@app.route('/acercade')
def acercade():
    return render_template('acercade.html')

@app.route('/contacto')
def contacto():
    return render_template('contacto.html')


app.run(debug=True)