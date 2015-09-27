create table USUARIOS (
	id INT NOT NULL auto_increment,
	nombre_usuario VARCHAR(15) PRIMARY KEY NOT NULL,
	nombre VARCHAR(15) NOT NULL,
	apellido VARCHAR(15) NOT NULL,
	email VARCHAR(30) NOT NULL,
	fecha_nacimiento VARCHAR(10) NOT NULL,
	esta_validada BOOLEAN NOT NULL,
	codigo_validacion INTEGER NOT NULL,
	PRIMARY KEY(id)
)
create table AUTOS(
	id INT NOT NULL auto_increment,
	marca VARCHAR(20) NOT NULL,
	modelo VARCHAR(20) NOT NULL,
	anyo INT NOT NULL,
	patente VARCHAR(10),
	costoBase DOUBLE PRECISION,
	categoria INT NOT NULL,
	ubicacionInicial INT NOT NULL,
	PRIMARY KEY (id)
)
create table RESERVAS(
	id INT NOT NULL auto_increment,
	origen INT NOT NULL,
	destino INT NOT NULL,
	inicio DATE,
	fin DATE,
	auto INT,
	usuario INT,
	PRIMARY KEY(id)
)
