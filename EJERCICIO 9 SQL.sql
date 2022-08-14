-- CREAR BASE DE DATOS

CREATE DATABASE  veterinaria_peluqueria;

-- SELECCIONAR BASE DE DATOS veterinaria_peluqueria

USE veterinaria_peluqueria;

-- CREAR TABLA CON LOS DATOS DE LOS DUEÑOS DE LAS MASCOTAS

CREATE TABLE  Dueno (

    DNI INT NOT NULL UNIQUE,
    Nombre VARCHAR(70) NOT NULL,
    Apellido VARCHAR(60) NOT NULL,
    Telefono VARCHAR(40) NULL,
    Direccion VARCHAR (110) NOT NULL,
    PRIMARY KEY (DNI)
);

-- CREAR LA TABLA Perro PARA IDENTIFICAR DATOS DE LAS MASCOTAS

CREATE TABLE Perro (

ID_Perro INT AUTO_INCREMENT,
    Nombre VARCHAR(45) NOT NULL,
    Fecha_nac DATE NOT NULL,
    Sexo VARCHAR(20),
    DNI_Dueno INT NOT NULL,
    PRIMARY KEY (ID_Perro),
    CONSTRAINT fk_DNI_Dueno
FOREIGN KEY (DNI_Dueno)
REFERENCES Dueno (DNI)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

-- CREAR LA TABLA CORRESPONDIENTE A HISTORIAL

CREATE TABLE Historial (

ID_Historial INT AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    ID_Perro INT NOT NULL,
    Descripcion VARCHAR(130) NULL,
    Monto FLOAT NOT NULL,
    PRIMARY KEY (ID_Historial),
    CONSTRAINT fk_ID_Perro
FOREIGN KEY (ID_Perro)
REFERENCES Perro (ID_Perro)
ON DELETE NO ACTION
ON UPDATE NO ACTION
);

-- SE CARGAN LOS DATOS EN LA TABLA Dueno

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(28957346,'Juan', 'Perez', '4789689', 'Belgrano 101'),
(23285987, 'Ariel', 'Gomez', '23456789', 'Libertador 123'),
(33270490, 'Marianella', 'Rodriguez', '34567890', 'Mitre 2346'),
(23546987, 'Maria', 'Perez', '4789680', 'Pueyrredon 811'),
(23457600, 'Mario', 'Sanchez', '47556248', 'Sarmiento 921'),
(25360207, 'Josefina', 'Garcia', '47321890', 'Tucuman 2025');

-- SE INGRESAN LOS DATOS CORRESPONDIENTES A LA TABLA Perro

INSERT INTO Perro (ID_Perro, Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
(NULL, 'Puppy', '2012-12-13', 'Macho', 28957346),
(NULL, 'Olivia', '2014-03-01', 'Hembra', 23285987),
(NULL, 'Frida', '2013-10-12', 'Hembra', 33270490),
(NULL, 'Lennon', '2015-07-09', 'Macho', 23457600),
(NULL, 'Fido', '2012-12-02', 'Macho', 23546987),
(NULL, 'Toto', '2019-08-08', 'Macho', 25360207);

-- INGRESAR DATOS A LA TABLA HISTORIAL

INSERT INTO Historial (ID_Historial, Fecha, ID_Perro, Descripcion, Monto) VALUES

(NULL, '2022-01-02', '1', 'Baño y uñas', 1300),
(NULL, '2022-02-03', '4', 'Consulta', 1800),
(NULL, '2022-03-04', '3', 'Corte, Baño y uñas', 2700),
(NULL, '2022-04-05', '2', 'Corte y Baño', 2000),
(NULL, '2022-03-08', '6', 'Consulta', 1800),
(NULL, '2022-05-04', '5', 'Corte y Baño', 2000);

-- PUNTO 9. ESCRIBIR UNA CONSULTA QUE PERMITA ACTUALIZAR LA DIRECCIÓN DE UN DUEÑO. SU NUEVA DIRECCIÓN ES LIBERTAD 123.

SET SQL_SAFE_UPDATE = 0;

UPDATE Dueno
SET Direccion = 'Libertad 123'
WHERE DNI = '23285987';

SELECT * FROM Dueno;