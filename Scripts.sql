CREATE DATABASE IF NOT EXISTS peluqueria_canina;
USE peluqueria_canina;

CREATE TABLE IF NOT EXISTS Dueno (
    DNI INT NOT NULL UNIQUE,
    Nombre VARCHAR(50) NOT NULL,
    Apellido VARCHAR(50) NOT NULL,
    Telefono VARCHAR(20) NULL,
    Direccion VARCHAR (100) NOT NULL,
    PRIMARY KEY (DNI)
);

CREATE TABLE IF NOT EXISTS Perro (
	ID_Perro INT NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR(50) NOT NULL,
    Fecha_nac DATE NOT NULL,
    Sexo VARCHAR(25) NULL,
    DNI_Dueno INT NOT NULL,
    PRIMARY KEY (ID_Perro),
    CONSTRAINT fk_DNI_Dueno
		FOREIGN KEY (DNI_Dueno)
		REFERENCES Dueno (DNI)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

CREATE TABLE IF NOT EXISTS Historial (
	ID_Historial INT NOT NULL AUTO_INCREMENT,
    Fecha DATE NOT NULL,
    ID_Perro INT NOT NULL,
    Descripcion VARCHAR(100) NULL,
    Monto FLOAT NOT NULL,
    PRIMARY KEY (ID_Historial),
    CONSTRAINT fk_ID_Perro
		FOREIGN KEY (ID_Perro)
		REFERENCES Perro (ID_Perro)
		ON DELETE NO ACTION
		ON UPDATE NO ACTION
);

INSERT INTO Dueno (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(36313966,'Samuel', 'Gatica', '2302643592', 'Bolivia 95'),
(23285987, 'Pedro', 'Gomez', '23456789', 'Libertador 528'),
(33270490, 'Paola', 'Estevez', '34567890', 'Av. Cabildo 3146'),
(30313790, 'Pedro', 'Rossi', '45678901', 'Olavarria 147');

INSERT INTO Perro (Nombre, Fecha_nac, Sexo, DNI_Dueno) VALUES 
('Morgan', '2013-08-02', 'Macho', 36313966),
('Nemo', '2014-03-01', 'Macho', 23285987),
('Lila', '2013-10-12', 'Hembra', 33270490),
('Black', '2015-07-09', 'Macho', 30313790);

INSERT INTO Historial (Fecha, ID_Perro, Descripcion, Monto) VALUES
('2022-01-02', 1, 'Baño Completo', 1600),
('2022-02-03', 2, 'Desparasitación', 2000),
('2022-03-04', 3, 'Corte y Baño', 1500),
('2022-04-05', 4, 'Corte Uñas y Baño', 3000);

-- Realice una consulta multitabla que arroje el nombre de todos los perros cuyos dueños se llaman Pedro

SELECT Nombre FROM Perro
WHERE DNI_Dueno IN (SELECT DNI FROM Dueno WHERE Nombre = 'Pedro');