/* Creación de DB */
CREATE DATABASE planningpoker
/* Creación de tablas */
CREATE TABLE usuario(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL
)

CREATE TABLE sesion(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_usuario INT,
    asunto VARCHAR(100) NOT NULL,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id)
)

CREATE TABLE issues(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_sesion INT NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    descripcion VARCHAR(100) NOT NULL,
    FOREIGN KEY(id_sesion) REFERENCES sesion(id)
)

CREATE TABLE votos(
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    id_usuario INT NOT NULL,
    id_issues INT NOT NULL,
    valor INT,
    FOREIGN KEY(id_usuario) REFERENCES usuario(id),
    FOREIGN KEY(id_issues) REFERENCES issues(id)
)