from tabulate import tabulate

tabla = [
    ["cesar mayta", "cesar@gmail.com", "963852741"],
    ["eduardo rodriguez", "eduardo@gmail.com", "963852741"]
]

cabeceras = ["nombre","email","celular"]

print(tabulate(tabla,headers=cabeceras,tablefmt="grid"))