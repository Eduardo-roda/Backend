from flask import Flask
from .portal import portal
from .admin import admin
from .postulante import postulante

def create_app():
    app = Flask(__name__)
    app.register_blueprint(portal)
    app.register_blueprint(admin)
    app.register_blueprint(postulante)

    return app