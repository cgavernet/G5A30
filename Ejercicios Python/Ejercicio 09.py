""" 9) Crear una tupla en Python con el nombre de “Historial5” la cual contenga los siguientes valores:

          8520, 9510, 7530, 3570, 1590

Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Toto”. 
Crear una función para determinar el valor máximo de atención gastada en “Toto”."""

def MaxGasto(datos):
    return max(datos)

Historial5 = [8520, 9510, 7530, 3570, 1590]

print(f"El valor máximo de atención gastada en Toto es de ${MaxGasto(Historial5)}")

