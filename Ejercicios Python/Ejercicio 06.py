""" 6) Crear una tupla en Python con el nombre de “Historial2” la cual contenga los siguientes valores:

          23500, 5960, 2300, 10200, 8900

Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Frida”. 
Calcular el monto total gastado a lo largo del tiempo por atención de “Frida”. 
Crear una función que cuente cuantos gastos fueron superiores a 5000 mostrando  el número calculado en pantalla."""

def cuentoGastosSuperiores(datos, montoSuperior):
    cont=0
    for dato in datos:
        if dato > montoSuperior:
            cont+=1
    return cont

Historial2 = [23500, 5960, 2300, 10200, 8900]
TotalGastado = sum(Historial2)
print(f"Total de gastos mayores a $5000: {cuentoGastosSuperiores(Historial2, 5000)}")
