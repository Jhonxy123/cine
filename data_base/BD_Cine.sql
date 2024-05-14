----------------------------------------------------DDL--------------------------------------------------------

CREATE DATABASE cinefeliz;

CREATE TABLE calificacion(
    id_calificacion int not null,
    calificacion varchar(40) not null,
    PRIMARY KEY(id_calificacion)
);

CREATE TABLE pelicula(
    id_pelicula int not null,
    titulo varchar(60) not null,
    descripcion varchar(400),
    id_calificacion int,
    PRIMARY KEY(id_pelicula),
    FOREIGN KEY(id_calificacion)
        REFERENCES calificacion(id_calificacion)
);

CREATE TABLE tipo_sala(
    id_tipo_sala int not null,
    tipo_sala varchar(30),
    PRIMARY KEY(id_tipo_sala)
);

CREATE TABLE sala(
    num_sala int not null,
    id_tipo_sala int not null,
    PRIMARY KEY(num_sala)
);

CREATE TABLE tener(
    id_horario int not null,
    id_pelicula int not null,
    num_sala int not null,
    horario varchar(10),
    PRIMARY KEY(id_horario,id_pelicula,num_sala),
    FOREIGN KEY(id_pelicula)
        REFERENCES pelicula(id_pelicula),
    FOREIGN KEY(num_sala)
        REFERENCES sala(num_sala)
);

CREATE TABLE tipo_empleado(
    id_tipo_empleado int not null,
    tipo_empleado varchar(30),
    PRIMARY KEY(id_tipo_empleado)
);

CREATE TABLE empleado(
    id_empleado int not null,
    id_tipo_empleado int not null,
    nombre varchar(40),
    cedula bigint not null,
    usuario varchar(40),
    telefono bigint,
    contrasena varchar(30),
    PRIMARY KEY(id_empleado),
    FOREIGN KEY(id_tipo_empleado)
        REFERENCES tipo_empleado(id_tipo_empleado)
);

CREATE TABLE tipo_boleta(
    id_tipo_boleta int not null,
    tipo_boleta varchar(30),
    PRIMARY KEY(id_tipo_boleta) 
);

CREATE TABLE cliente(
    cedula bigint not null,
    nombre varchar(30) not null,
    telefono bigint,
    fecha_nac date not null,
    correo varchar(40) not null,
    contrasena varchar(30),
    PRIMARY KEY(cedula)
);

CREATE TABLE boleta(
    id_boleta int not null,
    id_tipo_boleta int not null,
    id_horario int not null,
    id_pelicula int not null,
    num_sala int not null,
    cedula_cliente bigint not null,
    cantidad bigint not null,
    PRIMARY KEY(id_boleta),
    FOREIGN KEY(id_tipo_boleta)
        REFERENCES tipo_boleta(id_tipo_boleta),
    FOREIGN KEY(id_horario,id_pelicula,num_sala)
        REFERENCES tener(id_horario,id_pelicula,num_sala),
    FOREIGN KEY(cedula_cliente)
        REFERENCES cliente(cedula)
);

CREATE TABLE asiento(
    id_boleta int not null,
    asiento varchar(30) not null,
    PRIMARY KEY(id_boleta,asiento),
    FOREIGN KEY(id_boleta)
        REFERENCES boleta(id_boleta)
    );

---------------------DML---------------------------------------------    

#calificacion

INSERT INTO calificacion VALUES(1,'Para todo publico');
INSERT INTO calificacion VALUES(2,'Para mayores de 7 años');
INSERT INTO calificacion VALUES(3,'Para mayores de 12 años');
INSERT INTO calificacion VALUES(4,'Para mayores de 15 años');

#pelicula
INSERT INTO pelicula VALUES(,,,);

INSERT INTO pelicula VALUES(10,'John Wick 4','John Wick (Keanu Reeves) descubre una forma de derrotar a The High Table. Pero antes de poder ganar su libertad, Wick debe enfrentarse a un nuevo enemigo',3);
INSERT INTO pelicula VALUES(20,'The Menu','Una joven pareja (Anya Taylor-Joy y Nicholas Hoult) viaja a un exclusivo restaurante insular cuyo chef (Ralph Fiennes) ha preparado un caro y suntuoso menú.',4);
INSERT INTO pelicula VALUES(30,'Soul','Decidido a volver a su vida, Joe se une a 22, un alma precoz que nunca ha entendido el atractivo de la experiencia humana. En su desesperado empeño por ...',1);
INSERT INTO pelicula VALUES(40,'Jacobs Ladder','De luto por la muerte de su hijo, un angustiado veterano de la guerra de Vietnam intenta descubrir su pasado mientras sufre un grave caso de disociación.',4);
INSERT INTO pelicula VALUES(50,'eterno resplandor de una mente sin recuerdos','Un invento de médicos permite a una pareja borrar los recuerdos de su relación anterior',3);
INSERT INTO pelicula VALUES(60,'Godzilla x Kong: The New Empire','Una aventura cinematográfica completamente nueva, que enfrentará al todopoderoso Kong y al temible Godzilla contra una colosal amenaza desconocida escondida dentro de nuestro mundo.',2);

#tipo_sala

INSERT INTO tipo_sala VALUES(1,'2D');
INSERT INTO tipo_sala VALUES(2,'3D');
INSERT INTO tipo_sala VALUES(3,'Multiplex');
INSERT INTO tipo_sala VALUES(4,'IMAX');
INSERT INTO tipo_sala VALUES(5,'ONIX');

#sala

INSERT INTO sala VALUES(1,1);
INSERT INTO sala VALUES(2,1);
INSERT INTO sala VALUES(3,2);
INSERT INTO sala VALUES(4,2);
INSERT INTO sala VALUES(5,3);
INSERT INTO sala VALUES(6,4);
INSERT INTO sala VALUES(7,5);

#tener

INSERT INTO tener VALUES(11,30,1,'10am');
INSERT INTO tener VALUES(12,60,2,'10am');
INSERT INTO tener VALUES(13,60,3,'10am');
INSERT INTO tener VALUES(14,60,5,'10am');
INSERT INTO tener VALUES(15,60,6,'10am');
INSERT INTO tener VALUES(16,10,1,'2pm');
INSERT INTO tener VALUES(17,10,3,'2pm');
INSERT INTO tener VALUES(18,10,4,'2pm');
INSERT INTO tener VALUES(19,10,7,'2pm');
INSERT INTO tener VALUES(20,20,2,'2pm');
INSERT INTO tener VALUES(21,20,6,'2pm');
INSERT INTO tener VALUES(22,50,1,'4pm');
INSERT INTO tener VALUES(23,50,7,'4pm');
INSERT INTO tener VALUES(24,50,6,'4pm');
INSERT INTO tener VALUES(25,60,2,'4pm');
INSERT INTO tener VALUES(26,60,4,'4pm');
INSERT INTO tener VALUES(27,20,3,'4pm');
INSERT INTO tener VALUES(28,20,5,'4pm');
INSERT INTO tener VALUES(29,50,1,'7pm');
INSERT INTO tener VALUES(30,10,7,'7pm');
INSERT INTO tener VALUES(31,10,6,'7pm');
INSERT INTO tener VALUES(32,40,2,'7pm');
INSERT INTO tener VALUES(33,40,4,'7pm');
INSERT INTO tener VALUES(34,20,3,'7pm');
INSERT INTO tener VALUES(35,20,5,'7pm');
INSERT INTO tener VALUES(36,50,1,'9pm');
INSERT INTO tener VALUES(37,10,7,'9pm');
INSERT INTO tener VALUES(38,10,6,'9pm');
INSERT INTO tener VALUES(39,40,2,'9pm');
INSERT INTO tener VALUES(40,40,4,'9pm');
INSERT INTO tener VALUES(41,20,3,'9pm');
INSERT INTO tener VALUES(42,20,5,'9pm');

#tipo_empleado

INSERT INTO tipo_empleado VALUES(1,'Gerente');
INSERT INTO tipo_empleado VALUES(2,'Cajero');

#empleado

INSERT INTO empleado VALUES(100,1, 'Jose Luis',7755461,'jose1',3136523593,'123');
INSERT INTO empleado VALUES(101,2, 'Mario Casas',1044532,'mario1',3106513393,'123');

#tipo_boleta

INSERT INTO tipo_boleta VALUES(1,'General');
INSERT INTO tipo_boleta VALUES(2,'Preferencial');

#cliente 

INSERT INTO cliente VALUES(1111111111,'Pepe',3111111111,'2002-05-14','pepe@gmail.com','1');
INSERT INTO cliente VALUES(2222222222,'Maria',3222222222,'2001-04-17','maria@gmail.com','1');
INSERT INTO cliente VALUES(1000351643,'Jhon Gonzalez',3107852473,'2002-05-17','jhonxy123@gmail.com','1');

#boleta

INSERT INTO boleta VALUES(1000,1,11,30,1,1111111111,4);
INSERT INTO boleta VALUES(2000,2,18,10,4,2222222222,2);
INSERT INTO boleta VALUES(3000,1,39,40,2,1000351643,5);

#asiento

INSERT INTO asiento VALUES(1000,'E1');
INSERT INTO asiento VALUES(1000,'E2');
INSERT INTO asiento VALUES(1000,'E3');
INSERT INTO asiento VALUES(1000,'E4');
INSERT INTO asiento VALUES(2000,'J5');
INSERT INTO asiento VALUES(2000,'J6');
INSERT INTO asiento VALUES(3000,'F2');
INSERT INTO asiento VALUES(3000,'F3');
INSERT INTO asiento VALUES(3000,'F4');
INSERT INTO asiento VALUES(3000,'F5');
INSERT INTO asiento VALUES(3000,'F6');