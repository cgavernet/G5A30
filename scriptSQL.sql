-- Creamos una BD para usarla durante el ejercicio
CREATE DATABASE ValFinalISPC;
USE ValFinalISPC;

-- Creamos las tablas para Dueno, Perro e Historial
CREATE TABLE Dueno(
	DNI int NOT NULL UNIQUE,
    Nombre VARCHAR(45) NOT NULL,
    Apellido VARCHAR(45) NOT NULL,
    Telefono VARCHAR(45) NOT NULL,
    Direccion VARCHAR(45) NOT NULL, 
    PRIMARY KEY(DNI)
);

CREATE TABLE Perro(
	ID_Perro int NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(45) NOT NULL,
    Fecha_nac DATE NOT NULL,
    Sexo VARCHAR(15) NOT NULL,
    DNI_Dueno int NOT NULL, 
    PRIMARY KEY(ID_Perro),
    FOREIGN KEY(DNI_Dueno) REFERENCES Dueno(DNI)
);

CREATE TABLE Historial(
	ID_Historial int NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    Perro_ID INT NOT NULL,
    Descripcion VARCHAR(45) NOT NULL,
    Monto DOUBLE NOT NULL, 
    PRIMARY KEY(ID_Historial),
    FOREIGN KEY(Perro_ID) REFERENCES Perro(ID_Perro)
);

-- Cargamos los datos de las tablas
INSERT INTO Dueno 
VALUES
(36245663, 'Juan', 'Carreras', '3516467888', 'Gral Paz 123'),
(16843635, 'Albertina', 'Figueroa', '3517644831', 'Av Colon 323'),
(21265677, 'Olivia', 'Suarez', '3518762238', 'Independencia 256'),
(27866572, 'Pedro', 'Marquez', '3516544228', 'Independencia 816'),
(29261577, 'Jana', 'Florentin', '3517877618', 'Libertad 811');

INSERT INTO Perro(Nombre, Fecha_nac, Sexo, DNI_Dueno) 
VALUES
('Coty', '2020-02-18', 'Hembra', 36245663), 
('Pini', '2019-05-11', 'Hembra', 36245663),
('Pupi', '2020-04-11', 'Hembra', 36245663),
('Piter', '2018-03-12', 'Macho', 16843635),
('Luli', '2021-03-21', 'Hembra', 16843635),
('Duke', '2018-11-30', 'Macho', 21265677),
('Guardian', '2019-08-22', 'Macho', 21265677),
('Poyo', '2020-04-10', 'Macho', 27866572), 
('Jazmin', '2021-10-21', 'Hembra', 27866572),
('Rex', '2020-12-18', 'Macho', 27866572),
('Jasper', '2020-10-14', 'Macho', 29261577),
('Susy', '2022-01-18', 'Hembra', 29261577);

INSERT INTO Historial(Fecha, Perro_ID, Descripcion, Monto)
VALUES
('2018-09-12',4,'Corte general', 500),
('2018-11-12',4,'Corte general', 500),
('2019-03-12',4,'Corte + baño', 1100),
('2019-05-30',6,'Corte general', 600),
('2019-07-12',4,'Corte general', 650),
('2019-10-30',6,'Corte general', 650),
('2019-11-11',2,'Corte + baño', 1250),
('2019-11-12',4,'Corte general', 650),
('2020-02-22',7,'Corte general', 700),
('2020-03-12',4,'Corte general', 700),
('2020-03-30',6,'Corte general', 700),
('2020-06-18',1,'Corte general', 700),
('2020-06-22',7,'Corte general', 700),
('2020-07-12',4,'Corte general', 700),
('2020-08-30',6,'Corte general', 700),
('2020-10-11',2,'Corte + baño', 1350),
('2020-10-11',3,'Corte + baño', 1350),
('2020-10-22',7,'Corte general', 750),
('2020-11-12',4,'Corte general', 750),
('2020-12-10',8,'Corte general', 750),
('2020-12-18',1,'Corte general', 800),
('2021-01-30',6,'Corte + baño', 1500),
('2021-02-22',7,'Corte general', 800),
('2021-03-12',4,'Corte general', 800),
('2021-04-14',11,'Corte general', 800),
('2021-06-18',1,'Corte general', 800),
('2021-06-22',7,'Corte general', 800),
('2021-06-30',6,'Corte general', 800),
('2021-07-12',4,'Corte general', 800),
('2021-07-14',11,'Corte + baño', 1500),
('2021-08-18',10,'Corte general', 800),
('2021-10-14',11,'Corte general', 850),
('2021-10-21',5,'Corte + baño', 1550),
('2021-10-22',7,'Corte general', 850),
('2021-11-12',4,'Corte general', 850),
('2021-11-30',6,'Corte general', 850),
('2021-12-18',1,'Corte general', 850),
('2022-01-14',11,'Corte general', 900),
('2022-02-21',5,'Corte + baño', 1600),
('2022-03-12',4,'Corte general', 900),
('2022-03-21',9,'Corte + baño', 1700),
('2022-04-14',11,'Corte general', 900),
('2022-04-18',10,'Corte general', 900),
('2022-06-18',1,'Corte general', 950),
('2022-07-12',4,'Corte general', 1000),
('2022-07-14',11,'Corte general', 1000),
('2022-07-18',12,'Corte general', 1000),
('2022-07-21',5,'Corte + baño', 2000);

-- 2. Inserte en la tabla correspondiente un nuevo animal (perro) como paciente y el dueño asociado a ese animal.
INSERT INTO Dueno VALUES (36225649,'Javier','Medina','3514744635','Pte Peron 442');
INSERT INTO Perro(Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES ('Snoopy', '2022-03-03', 'Macho', 36225649);
INSERT INTO Historial(Fecha, Perro_ID, Descripcion, Monto) VALUES ('2022-08-11',13,'Corte',1100);

-- 8. Insertar un nuevo registro en la tabla historial de un perro cuyo ID Perro es igual a 10.
INSERT INTO Historial (Fecha, Perro_ID, Descripcion, Monto) VALUES ('2022-08-11',10,'Corte',1100);


-- Práctica!

-- 3. Borre un animal que ya no va a ser atendido. Para ello consulte antes en el historial, algún animal que ya no sea atendido 
-- desde hace mucho tiempo.

-- Consulto la ultima vez que fueron atendidos 
SELECT MAX(Fecha) as Fecha, Perro_ID FROM Historial
GROUP BY Perro_ID
ORDER BY Fecha Asc;

-- Para el ejercicio, borro el perro que más tiempo lleva sin venir (Perro id 2)
DELETE FROM Historial WHERE Perro_ID = 2; -- Borro historial
DELETE FROM Perro WHERE ID_Perro = 2; -- Borro animal

-- 4. Actualice la fecha de nacimiento de algún animal (perro) que usted considere. - Snoopy (ID: 13)
UPDATE Perro
SET Fecha_nac = '2022-03-01'
WHERE ID_Perro = 13;

-- 5. Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro
SELECT p.Nombre as Nombre
FROM Perro p LEFT JOIN Dueno d ON d.DNI = p.DNI_Dueno
WHERE d.Nombre = 'Pedro';

-- 6. Obtener todos los perros que asistieron a la peluquería en 2022
SELECT DISTINCT p.Nombre as Nombre
FROM Perro p LEFT JOIN Historial h ON h.Perro_ID = p.ID_Perro
WHERE h.Fecha > '2022-01-01';

-- 7. Obtener los ingresos percibidos en Julio del 2022
SELECT SUM(Monto) FROM Historial
WHERE MONTH(Fecha) = 07 AND YEAR(Fecha) = 2022;

-- 9. Escriba una consulta que permita actualizar la dirección de un dueño. Su nueva dirección es Libertad 123
UPDATE Dueno 
SET Direccion = 'Libertad 123'
WHERE DNI = 29261577;

-- 10. Vaciar la tabla historial y resetear el contador del campo ID.
TRUNCATE TABLE Historial;
ALTER TABLE Historial AUTO_INCREMENT = 1;

-- 11. Obtener todos los dueños que tengan perros de menos de 5 años de edad que no hayan visitado la peluquería en el año 2022.
SELECT DISTINCT d.*
FROM Dueno d LEFT JOIN Perro p ON d.DNI = p.DNI_Dueno LEFT JOIN Historial h ON p.ID_Perro = h.Perro_ID
WHERE TIMESTAMPDIFF(YEAR,p.Fecha_nac,CURRENT_TIME()) < 5 AND h.Fecha NOT LIKE '2022%';

-- 12. Obtener todos los perros de sexo “Macho” nacidos entre 2020 y 2022.
SELECT * FROM Perro
WHERE Sexo = 'Macho' AND YEAR(Fecha_nac) IN (2020,2021,2022);
