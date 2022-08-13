# Creo la Base de datos si no existe
CREATE DATABASE IF NOT EXISTS PetShop;

#Selecciono la BD PetShop
USE PetShop;

#Creo la Tabla Dueño
CREATE TABLE IF NOT EXISTS Dueno (
    DNI INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NULL,
    Direccion VARCHAR (100) NOT NULL,
    PRIMARY KEY (DNI)
);

#Creo la Tabla Perro 
CREATE TABLE IF NOT EXISTS Perro (
	ID_Perro INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Fecha_nac DATE NOT NULL,
    Sexo VARCHAR(25),
    DNI_Dueno INT NOT NULL,
    PRIMARY KEY (ID_Perro),
    CONSTRAINT fk_DNI_Dueno
		FOREIGN KEY (DNI_Dueno)
		REFERENCES Dueno (DNI)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

#Creo la Tabla Historial
CREATE TABLE IF NOT EXISTS Historial (
	ID_Historial INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    perro INT NOT NULL,
    Descripcion VARCHAR(100) NULL,
    Monto INT NOT NULL,
    PRIMARY KEY (ID_Historial),
    CONSTRAINT fk_Perro
		FOREIGN KEY (perro)
		REFERENCES Perro (ID_Perro)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

#Ingreso datos en las diferentes tablas
INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(28962129,'Juan Carlos', 'Gonzalez', '3385400563', 'San Martin 23'),
(7852896, 'Alicia', 'Jerez', '3382456528', 'Risatti 46'),
(25586321,'Pedro', 'Alvarez', '3385456328', 'AV. Independencia 145'),
(17355456,'Rebecca', 'Suarez', '3385406378', 'Colon 452'),
(33215460,'Mariana', 'Gil', '3385415632', 'Felipe Varela 59'),
(12563782, 'Pedro', 'Fernandez', '3385123845', 'Juan XXIII 68'); 

INSERT INTO Perro (Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
('Odie','2015-10-08','Macho',28962129),
('Snoopy','2019-04-05','Macho',25586321),
('Frida','2021-06-02','Hembra',17355456),
('Toto','2022-02-06','Macho',7852896),
('Dama','2020-03-03','Hembra',33215460),
('Nana','2021-05-06','Hembra',12563782),
('Bolt','2019-03-15','Macho',33215460),
('Laika','2020-10-27','Hembra',28962129),
('Lazzie','2019-03-15','Macho',33215460),
('leyla','2021-10-27','Hembra',33215460);

INSERT INTO Historial (Fecha, Perro, Descripcion, Monto) VALUES
('2015-10-12', 1,'Primer Control', 820 ),
('2018-12-14', 1,'Vacunacion', 800 ),
('2021-11-12', 2,'Primer Control', 1825),
('2021-11-12', 7,'Primer Control', 1825),
('2021-12-14', 8,'Baño y Peluqueria', 1920 ),
('2022-02-14', 2,'Vacunacion',1450 ),
('2022-03-12', 3,'Baño y Peluqueria', 2400),
('2022-07-14', 4,'Vacunacion', 1450 ),
('2022-07-14', 8,'Control', 1680 );

# Punto 3 - Borre un animal que ya no va a ser atendido. Para ello consulte antes en el historial, algún animal que ya no sea atendido desde hace mucho tiempo.
-- Debo modificar la Tabla Historial para que borre la restriccion
-- Elimino la clave foranea
ALTER TABLE Historial
DROP FOREIGN KEY fk_Perro;

-- Agrego el contraint con la modificacion ON DELETE CASCADE
ALTER TABLE Historial
ADD CONSTRAINT fk_Perro
		FOREIGN KEY (perro)
		REFERENCES Perro (ID_Perro)
		ON DELETE CASCADE
		ON UPDATE NO ACTION;

-- Ahora borro el registro
DELETE FROM Perro
WHERE ID_Perro IN (SELECT Perro FROM Historial WHERE YEAR(Fecha) < (YEAR(curdate())-6));

# Punto 4 - Actualice la fecha de nacimiento de algún animal (perro) que usted considere.
UPDATE Perro
SET  Fecha_nac = '2021-08-02'
WHERE ID_Perro = 3;

# Punto 5 - Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro
SELECT Nombre FROM Perro
WHERE DNI_Dueno IN (SELECT DNI FROM Dueno WHERE Nombre = 'Pedro');

# Punto 6 - Obtener todos los perros que asistieron a la peluquería en 2022
SELECT Nombre FROM Perro
WHERE ID_Perro IN (SELECT Perro FROM Historial WHERE YEAR(Fecha) = '2022'); 

# Punto 7 - Obtener los ingresos percibidos en Julio del 2022
SELECT SUM(Monto) AS Ingresos FROM Historial WHERE (YEAR(Fecha) = '2022' AND MONTH(Fecha) = '07');

# Punto 8 - Insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 10.
INSERT INTO Historial (Fecha, Perro, Descripcion, Monto) VALUES
('2018-10-12', 10,'Primer Control', 1568 );

# Punto 9 - Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123
UPDATE Dueno
SET  Direccion = 'Libertad 123'
WHERE DNI = 7852896;

# Punto 10. Vaciar la tabla historial y resetear el contador del campo ID.
TRUNCATE TABLE Historial;

# Punto 11 - Obtener todos los dueños que tengan perros de menos de 5 años de edad que no hayan visitado la peluquería en el año 2022.
SELECT D.Nombre FROM Dueno D, Perro P, Historial H
WHERE (DNI = P.DNI_Dueno AND P.ID_Perro = H.Perro)
AND (YEAR(H.Fecha) < (YEAR(curdate())-5))
GROUP BY (P.ID_Perro) ORDER BY (D.Nombre);

# Punto 12 - Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022.
SELECT Nombre, Fecha_nac FROM Perro WHERE Sexo = 'Macho' AND YEAR(Fecha_nac) >= '2020' AND YEAR(Fecha_nac) <= '2022'
