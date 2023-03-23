from flask import Flask,render_template,request

from . import admin

#importamos connDb para mysql
from app import dbConn

def getSqlCatalogo(tblCatalogo):
    strSqlCatalogo = "select " + tblCatalogo + "_id as id," + tblCatalogo + "_descripcion as descripcion from tbl_" + tblCatalogo
    return strSqlCatalogo

@admin.route('/')
def index():
    return render_template('admin/index.html')

@admin.route('/categoria')
def categoria():
    #lista de categorias
    cursor = dbConn.cursor(dictionary=True)
    sqlgetData = getSqlCatalogo('categoria')
    cursor.execute(sqlgetData)
    data = cursor.fetchall()
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
     #lista de jornadas
    cursor = dbConn.cursor(dictionary=True)
    cursor.execute('select jornada_id as id,jornada_descripcion as descripcion from tbl_jornada' )
    data = cursor.fetchall()
    print(data)
    cursor.close()

    context = {
        'jornadas':data
    }
    return render_template('admin/jornada.html',**context)

@admin.route('/empresa')
def empresa():
    return render_template('admin/empresa.html')

@admin.route('/oferta')
def oferta():
    return render_template('admin/oferta.html')