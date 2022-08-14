# Módulo Programador TSDWAD
# VALORACIÓN FINAL DEL MÓDULO
# Realización del punto 7 correspondiente al ejercicio de Python
# Alumna: Noemí Zalazar, aula 30, equipo 5.
# Usuario GitHub: @NoeCoast


# 7)Crear una tupla en Python con el nombre de “Historial3” la cual contenga los siguientes valores: 9530, 4120, 4580, 1500, 890,7516,426

Historial3 = (9530, 4120, 4580, 1500, 890, 7516, 426)

# Calcular el promedio de gasto en pesos por atención de “Lennon” mostrándolo en pantalla.   

GastoPromLennon = (sum(Historial3) / len(Historial3))
print(GastoPromLennon)

# Si el promedio es mayor a 4500 indicar con un mensaje “Se ha excedido del gasto promedio para su mascota”.

if GastoPromLennon > 4500:
    print("Se ha excedido del gasto promedio de su mascota")
    
else:
    print("Su gasto se encuentra dentro del promedio esperado")
    
    
    #Respuesta esperada
    #4080.285714285714
    #Su gasto se encuentra dentro del promedio esperado
        
