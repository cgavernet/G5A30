# ISPC - TSDWAD - Módulo PROGRAMADOR.
# Valoración Final.
# Espacio curricular Python.
# Ejercicio #2.
#
# Se crea la lista "Dueño2".
Dueño2 = [23546987, "María", "Pérez", 4789689, "Pueyrredon 811"]
# Se recorre la lista con el bucle for mostrando sus elementos
# por pantalla excepto DNI y Apellido.
indice = 0
for i in Dueño2:
    if indice == 1 or indice == 3 or indice == 4:
        print(i)
    indice += 1
# Fin.