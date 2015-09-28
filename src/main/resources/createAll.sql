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
