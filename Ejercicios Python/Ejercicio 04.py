"""4) Crear un lista en Python denominado “Perro2” que contenga los siguientes valores:

      14,  Fido,  12/12/2012 , Macho, 23546987

Recorrer la lista “Perro” con un bucle y mostrar sus elementos por pantalla , 
comenzando desde el último hasta el primero."""

Perro2 = [14,  'Fido',  '12/12/2012' , 'Macho', 23546987]
for datos in Perro2[::-1]:
    print(datos, end=" ")