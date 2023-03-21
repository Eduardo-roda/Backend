#PASOS PARA DESPLIEGUE

PASO 1 - CREAR ENTORNO VIRTUAL 
`python -m venv venv`

PASO 2 - ACTIVAR ENTORNO VIRTUAL 
`source venv/Scripts/activate`

#instalamos dependencias
`pip install -r requirements.txt`

PASO 4 - CREAR VARIABLES DE ENTORNO 
`export FLASK_APP=run.py`
`export FLASK_DEBUG=1`

PASO 5 - DESPLIEGUE 
`flask run`