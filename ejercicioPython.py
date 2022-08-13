# 5) Crear una tupla en Python con el nombre de “Historial” la cual contenga los siguientes valores:
#       2350, 5960, 23000, 1000, 8900
# Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Puppy”. Calcular el monto total gastado a lo largo del tiempo por atención de “Puppy”. Si el gasto efectuado es menor a 30000, mostrar en pantalla dicho resultado, caso contrario mostrar el mensaje “Gastos por encima de lo presupuestado”.

Historial = (2350, 5960, 23000, 1000, 8900)
gastos = sum(Historial)
print("Gastos:",gastos) if gastos < 30000 else print("Gastos por encima de lo presupuestado")



# Practica!

# 1) Crear una lista en Python denominada “Dueno” que contenga los siguientes valores:
#    28957346,  Juan,  Perez, 4789689,  Belgrano 101
#  Dichos datos se corresponden  con los datos del dueño de un perro (DNI, nombre, apellido, teléfono y dirección). Muestre en pantalla el teléfono del dueño si el DNI es mayor a 26000000.

from audioop import reverse


Dueno = [28957346, "Juan", "Perez", 4789689, "Belgrano 101"]
if Dueno[0] > 26000000:
    print(Dueno[3])
    
# 2)   Crear una lista en Python denominada “Dueno2”  y recorrerla con un bucle  mostrando sus elementos por pantalla con excepción del DNI y el apellido. Los elementos de la lista son:
#          23546987,  “Maria”,  “Perez”, 4789689,  “Pueyrredon  811”
# que representan los datos del dueño de un perro (DNI, nombre, apellido, teléfono y dirección) 

Dueno2 = [23546987, "Maria", "Perez", 4789689,  "Pueyrredon 811"]
for i in range(len(Dueno2)):
    if i != 0 and i != 2:
        print(Dueno2[i])
        
# 3)  Crear un lista en Python denominado “Perro” que contenga los siguientes valores:
#13,  Puppy,  12/12/2012 , Macho, 123
#Que se corresponde con los datos de un perro de nuestra base de datos (Id_Perro, nombre, fecha de nacimiento, sexo y dni del dueño). Modificar la fecha de nacimiento por 13/12/2012 y reemplazar “dni del dueño” por 28957346 .

Perro = [13, "Puppy", "12/12/2012", "Macho", 123]
Perro[2]="13/12/2012"
Perro[4]=28957346

# 4) Crear un lista en Python denominado “Perro2” que contenga los siguientes valores:
#    14,  Fido,  12/12/2012 , Macho, 23546987
# Recorrer la lista “Perro” con un bucle y mostrar sus elementos por pantalla , comenzando desde el último hasta el primero.

Perro2 = [14, "Fido", "12/12/2012", "Macho", 23546987]
for dato in reversed(Perro2):
    print(dato)
    
# 5) - Version con for
# Crear una tupla en Python con el nombre de “Historial” la cual contenga los siguientes valores:
# 2350, 5960, 23000, 1000, 8900
#Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Puppy”. Calcular el monto total gastado a lo largo del tiempo por atención de “Puppy”. Si el gasto efectuado es menor a 30000, mostrar en pantalla dicho resultado, caso contrario mostrar el mensaje “Gastos por encima de lo presupuestado”.

Historial = (2350, 5960, 23000, 1000, 8900)
gastos_puppy = 0
for gasto in Historial:
    gastos_puppy += gasto
    
print("Gastos efectuados:",gastos_puppy) if gastos_puppy < 30000 else print("Gastos por encima de lo presupuestado")

# 6)       Crear una tupla en Python con el nombre de “Historial2” la cual contenga los siguientes valores:
# 23500, 5960, 2300, 10200, 8900
# Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Frida”. Calcular el monto total gastado a lo largo del tiempo por atención de “Frida”. Crear una función que cuente cuantos gastos fueron superiores a 5000 mostrando  el número calculado en pantalla.

Historial2 = (23500, 5960, 2300, 10200, 8900)
gastos_frida = 0
for gasto in Historial:
    gastos_frida += gasto
    
def contar_gastos_mayores_a_5000(gastos):
    count = 0
    for gasto in gastos:
        if gasto > 5000:
            count += 1
    return print(count)

# 7)  Crear una tupla en Python con el nombre de “Historial3” la cual contenga los siguientes valores:
# 9530, 4120, 4580, 1500, 890,7516,426
#Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Lennon”. Calcular el promedio de gasto en pesos por atención de “Lennon” mostrándolo en pantalla. Si el promedio es mayor a 4500 indicar con un mensaje “Se ha excedido del gasto promedio para su mascota”.

Historial3 = (9530, 4120, 4580, 1500, 890, 7516, 426)
gastos_lennon = 0
for gasto in Historial:
    gastos_lennon += gasto
promedio_gastos = gastos_lennon / len(Historial3)
print("Promedio de gastos de Lennon:",promedio_gastos)
if promedio_gastos > 4500:
    print("Se ha excedido del gasto promedio para su mascota")
    
# 8) Crear una tupla en Python con el nombre de “Historial4” la cual contenga los siguientes valores:
# 7510, 7960, 76180, 800, 4100
# Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Olivia”. Cree una función para determinar el valor mínimo de atención gastada en “Olivia”  mostrándolo en pantalla.

Historial4 = (7510, 7960, 76180, 800, 4100)
def menor_gasto(gastos):
    return print(min(gastos))

# 9) Crear una tupla en Python con el nombre de “Historial5” la cual contenga los siguientes valores:
#          8520, 9510, 7530, 3570, 1590
# Que representa montos de atención en pesos por diferentes servicios/consultas de la mascota “Toto”. Crear una función para determinar el valor máximo de atención gastada en “Toto”.

Historial5 = (8520, 9510, 7530, 3570, 1590)
def mayor_gasto(gastos):
    return print(max(gastos))

# 10) Crear una lista denominada “Clientes” con los nombres de los diferentes  dueños de perros.
# Juan,  Mario,  Ariel,  Josefina,  Marianella.
# Ordenarla alfabéticamente y mostrarla por pantalla.

Clientes = ["Juan", "Mario", "Ariel", "Josefina", "Marianella"]
Clientes.sort()
print(Clientes)
