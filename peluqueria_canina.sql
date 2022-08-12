create database peluqueria_canina; 
use peluqueria_canina;

create table Dueño(
DNI int not null unique,
Nombre varchar(20) not null,
Apellido varchar(20) not null,
Telefono varchar(20) not null,
Direccion varchar(50) not null,
 primary key(DNI)
);
create table Perro(
ID_Perro int not null auto_increment,
Nombre varchar(20) not null,
Fecha_nac date not null,
Sexo varchar(10) not null,
DNI_dueño int not null unique,
primary key(ID_Perro),
foreign key(DNI_dueño) references Dueño (DNI)
);
create table Historial (
ID_Historial int not null auto_increment,
Fecha date not null,
Perro int not null,
Descripcion varchar(100)not null,
Monto int not null,
primary key(ID_Historial),
foreign key(Perro) references Perro (ID_Perro)
);

INSERT INTO Dueño (DNI, Nombre, Apellido, Telefono, Direccion) VALUES
(44472923, 'Milagros', 'Wolowiez', '3512130840', 'Nicolas Accame 7179'),
(42474962, 'Jeremias', 'Carnero', '3512576977', 'Pasaje Pauli 5710'),
(28567890, 'Susana', 'Torres', '3515309949', 'Av. Vucetich 145'),
(26578967, 'Ariel', 'Soler', '3516587901', 'Faraday 5501'),
(27689754, 'Ivana', 'Melica', '3514508019', 'Lippman 6079');

INSERT INTO Perro ( Nombre, Fecha_nac, Sexo, DNI_Dueño) VALUES
('Oso', '2019-04-14', 'Masculino', 44472923),
('Luna', '2019-11-12', 'Femenino', 42474962),
('Canela', '2020-02-27', 'Femenino', 28567890),
('Bruno', '2020-08-18', 'Masculino', 26578967),
('Valiente', '2020-12-20', 'Masculino', 27689754);

INSERT INTO Historial (Fecha, Perro, Descripcion, Monto) VALUES
('2021-09-24', 7 , 'Corte general', 600),
('2022-01-16', 10 , 'baño+corte', 1000),
('2022-01-30', 11 , 'baño+corte', 1000),
('2022-02-14', 8 , 'baño+corte', 1000),
('2022-03-04', 9 , 'baño+corte', 1000),
('2022-04-14', 11 , 'corte general', 600),
('2022-05-19', 10 , 'corte general', 600),
('2022-06-10', 7 , 'corte general', 600),
('2022-07-16', 9 , 'baño+corte', 1000),
('2022-08-02', 8 , 'baño+corte', 1000);

SELECT * FROM Dueño
SELECT * FROM Perro

SELECT DISTINCT p.nombre as nombre,
MAX(h.Fecha) AS 'Ultima asistencia'
FROM Perro p left JOIN Historial h ON h.Perro= p.ID_Perro
group by p.nombre
HAVING MAX(h.Fecha)> '2022-01-01'
ORDER BY MAX(h.Fecha);