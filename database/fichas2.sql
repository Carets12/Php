DROP TABLE IF EXISTS REINO;
DROP TABLE IF EXISTS FICHA;
DROP TABLE IF EXISTS IDIOMA;
DROP TABLE IF EXISTS FICHA_LOCALIZADA;
DROP TABLE IF EXISTS FICHA_ZONA;
DROP TABLE IF EXISTS ZONA;

CREATE TABLE REINO(
	codigo INT AUTO_INCREMENT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
);

CREATE TABLE ZONA(
	codigo INT PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
);

CREATE TABLE FICHA(
	id_ficha INT AUTO_INCREMENT PRIMARY KEY,
	nombreComun VARCHAR(255) NOT NULL,
	nombreCientifico VARCHAR(255),
	codigoQR VARCHAR(255) NOT NULL,
	enlaceYoutube VARCHAR(255),
	estado ENUM('BORRADOR','PENDIENTE','VALIDADA','BORRADA') NOT NULL,
	reino INT NOT NULL FOREIGN KEY REFERENCES REINO(codigo)
);

CREATE TABLE FICHA_ZONA(
	codigo_zona INT PRIMARY KEY FOREIGN KEY REFERENCES ZONA(codigo),
	codigo_ficha INT PRIMARY KEY FOREIGN KEY REFERENCES FICHA(id_ficha)
);

CREATE TABLE IDIOMA(
	codigo VARCHAR(2) PRIMARY KEY,
	nombre VARCHAR(255) NOT NULL
);

CREATE TABLE FICHA_LOCALIZADA(
	id_ficha INT AUTO_INCREMENT PRIMARY KEY FOREIGN KEY REFERENCES FICHA(id_ficha),
	nombreLoc VARCHAR(255) NOT NULL,
	DescipcionLoc VARCHAR(255),
	zonaLoc VARCHAR(255) NOT NULL,
	reinoLoc VARCHAR(255) NOT NULL,
	idioma VARCHAR(2) PRIMARY KEY FOREIGN KEY REFERENCES IDIOMA(codigo)
);


