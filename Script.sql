-- Paso A
create database peluqueria_canina;
use peluqueria_canina;
create table Dueño
(
DNI int not null unique,
Nombre varchar(30) not null,
Apellido varchar(30) not null,
Telefono bigint null,
Direccion varchar(50) null,
primary key (DNI)
)
comment = 'Tabla para registración de dueños de perros';

create table Perro
(
Id_Perro int not null auto_increment,
Nombre varchar(30) not null,
Fecha_nac date not null,
Sexo varchar(30) null,
DNI_Dueño int not null,
primary key (Id_Perro),
constraint fk_DNI_Dueño foreign key (DNI_Dueño) references Dueño(DNI)
)
comment = 'Tabla para registración de perros';

create table Historial
(
Id_Historial int not null auto_increment,
Fecha date not null,
Perro int not null,
Descripcion varchar(200) null,
Monto int null,
primary key (Id_Historial),
constraint fk_Perro foreign key (Perro) references Perro(Id_Perro)
)
comment = 'Tabla para registración de las historias clínicas';

-- Paso B 
insert into Dueño (DNI, Nombre, Apellido, Telefono, Direccion)
values
(20380994, 'Carlos Daniel', 'Pozzo', 3546404883, 'Ruta 5 km 68 Villa Ciudad Parque'),
(23777832, 'Carlos Alberto', 'Rodriguez', 3547405567, 'Av. Libertador 770 Alta Gracia'),
(37155233, 'Ana Maria', 'Caballero', 3513470890, 'Dean Funes 37 Cordoba Capital');

insert into Perro (Nombre, Fecha_nac, Sexo, DNI_Dueño)
values
('Filomena', '2015-10-03', 'Hembra', 20380994),
('Athos','2017-03-25','Macho',23777832),
('Suricata','2015-04-27','Hembra',20380994),
('Chocolate','2016-11-13','Macho',37155233);

insert into Historial (Fecha, Perro, Descripcion, Monto)
values
('2017-03-03',1,'Corte y cepillado de pelo',1500),
('2017-06-10',1,'Corte de pelo',1000),
('2019-01-05',2,'Cepillado de pelo',700),
('2020-07-01',4,'Lavado de pelo',700);

-- Paso C 
update Perro
set Fecha_nac = '2014-09-25'
where Id_Perro = 1;
-- Modifico la fecha de nacimiento de Filomena

select Fecha_nac from Perro where Id_Perro = 1;
-- Verifico la modificación realizada filtrando por campo modificado y código del animal
