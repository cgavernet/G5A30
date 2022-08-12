"""
8) Crear una tupla en Python con el nombre de “Historial4”
la cual contenga los siguientes valores:

          7510, 7960, 76180, 800, 4100

Que representa montos de atención en pesos por diferentes servicios/consultas
de la mascota “Olivia”. Cree una función para determinar el valor mínimo de
atención gastada en “Olivia”  mostrándolo en pantalla.
"""

Historial4 = (7510, 7960, 76180, 800, 4100)
 
#Funcion que obtiene el mínimo importe por atención
def minimoImporte(valores):
    minimo = 999999999
    for valor in valores:
        if valor < minimo:
            minimo = valor
    return minimo

print(f"Minimo importe de atención a Olivia es ${minimoImporte(Historial4)}")

