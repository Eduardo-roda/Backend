from flask import Flask,render_template,request

from . import admin

#importamos connDb para mysql
from app import dbConn

@admin.route('/')
def index():
    return render_template('admin/index.html')

@admin.route('/categoria')
def categoria():
    #lista de categorias
    cursor = dbConn.cursor(dictionary=True)
    cursor.execute('select categoria_id as id,categoria_descripcion as descripcion from tbl_categoria' )
    data = cursor.fetchall()
    print(data)
    cursor.close()

    context = {
        'categorias':data
    }
    return render_template('admin/categoria.html',**context)

@admin.route('/modalidad')
def modalidad():
    return render_template('admin/modalidad.html')

@admin.route('/jornada')
def jornada():
    return render_template('admin/jornada.html')

@admin.route('/empresa')
def empresa():
    return render_template('admin/empresa.html')

@admin.route('/oferta')
def oferta():
    return render_template('admin/oferta.html')