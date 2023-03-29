from flask_wtf import FlaskForm
from wtforms.validators import DataRequired
from wtforms.fields import StringField, SubmitField

class CatalogoForm(FlaskForm):
    descripcion = StringField('Descripcion',validators=[DataRequired()])
    submit = SubmitField('Guardar')

class EmpresaForms(FlaskForm):
    nombre = StringField('Nombre Empresa: ', validators=[DataRequired()])
    descripcion = StringField('Descripcion')
    logo = StringField('Logo')
    beneficios = StringField('Beneficios')
    submit = SubmitField('Guardar')