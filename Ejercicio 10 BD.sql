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
('Odie','2018-10-08','Macho',28962129),
('Snoopy','2019-04-05','Macho',25586321),
('Frida','2021-06-02','Hembra',17355456),
('Toto','2022-02-06','Macho',7852896),
('Dama','2020-03-03','Hembra',33215460),
('Nana','2021-05-06','Hembra',12563782),
('Bolt','2019-03-15','Macho',33215460),
('Laika','2020-10-27','Hembra',28962129);

INSERT INTO Historial (Fecha, Perro, Descripcion) VALUES
('2018-10-12', 1,'Primer Control' ),
('2018-12-14', 1,'Vacunacion' );

# Punto 10. Vaciar la tabla historial y resetear el contador del campo ID.
TRUNCATE TABLE Historial;

