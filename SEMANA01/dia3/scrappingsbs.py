import requests
from bs4 import BeautifulSoup

URL_SBS = 'https://www.sbs.gob.pe/app/pp/SISTIP_PORTAL/Paginas/Publicacion/TipoCambioPromedio.aspx'

requestsSBS = requests.get(URL_SBS)

if(requestsSBS.status_code == 200):
    html = BeautifulSoup(requestsSBS.text, 'html.parser')
    tabla = html.find('table',{'id':'ctl00_cphContent_rgTipoCambio_ctl00'})
    fila = tabla.find('tr',{'id':'ctl00_cphContent_rgTipoCambio_ctl00__0'})
    moneda = fila.find('td',{'class':'APLI_fila3'})
    print('Moneda : ' + moneda.get_text())
    listaTiposCambio = fila.find_all('td',{'class':'APLI_fila2'})
    for cambio in listaTiposCambio:
        print(cambio.get_text())
else:
    print("error" + str(requestsSBS.status_code))