drop database banco;
CREATE DATABASE banco;

USE banco;
#DROP USER 'admin'@'localhost';
#DROP USER 'empleado'@'%';
#DROP USER 'atm'@'%';
FLUSH PRIVILEGES;

CREATE TABLE Ciudad (
    cod_postal INT UNSIGNED ,
    nombre VARCHAR(32) NOT NULL,
		
		CONSTRAINT pk_ciudad
		PRIMARY KEY (cod_postal)
) ENGINE = InnoDB;

CREATE TABLE Sucursal (
    nro_suc INT UNSIGNED AUTO_INCREMENT,
    nombre VARCHAR(32) NOT NULL,
    direccion VARCHAR(32) NOT NULL,
    telefono VARCHAR(32) NOT NULL,
    horario VARCHAR(32) NOT NULL,
    cod_postal INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_sucursal
		PRIMARY KEY (nro_suc),

		CONSTRAINT fk_sucursal_ciudad
		FOREIGN KEY (cod_postal) REFERENCES Ciudad(cod_postal)
    
) ENGINE = InnoDB;

CREATE TABLE Empleado (
    legajo INT UNSIGNED AUTO_INCREMENT,
    apellido VARCHAR(32)NOT NULL,
    nombre VARCHAR(32)NOT NULL,
    tipo_doc VARCHAR(20) NOT NULL,
    nro_doc INT UNSIGNED NOT NULL,
    direccion VARCHAR(32) NOT NULL,
    telefono VARCHAR(16) NOT NULL,
    cargo VARCHAR(32) NOT NULL,
    password VARCHAR(32)NOT NULL,
    nro_suc INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_empleado
		PRIMARY KEY (legajo),
		
		CONSTRAINT fk_empleado_sucursal
		FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Cliente (
    nro_cliente INT UNSIGNED AUTO_INCREMENT,
    apellido VARCHAR(32) NOT NULL,
    nombre VARCHAR(32) NOT NULL,
    tipo_doc VARCHAR(20) NOT NULL,
    nro_doc INT UNSIGNED NOT NULL,
    direccion VARCHAR(32) NOT NULL,
    telefono VARCHAR(16) NOT NULL,
    fecha_nac DATE NOT NULL,
		
		CONSTRAINT pk_cliente
		PRIMARY KEY (nro_cliente)
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Fijo (
    nro_plazo INT UNSIGNED AUTO_INCREMENT,
    capital DECIMAL(16, 2) UNSIGNED NOT NULL,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL,
    tasa_interes DECIMAL(4, 2)UNSIGNED NOT NULL,
    interes DECIMAL(16, 2) UNSIGNED NOT NULL,
    nro_suc INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_plazo_fijo
		PRIMARY KEY (nro_plazo),
		
		CONSTRAINT fk_plazofijo_sucursal
		FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Plazo_Fijo (
    periodo INT UNSIGNED,
    monto_inf DECIMAL(16, 2)UNSIGNED,
    monto_sup DECIMAL(16, 2)UNSIGNED,
    tasa DECIMAL(4, 2)UNSIGNED NOT NULL,
		
		CONSTRAINT pk_taza_plazo_fijo
		PRIMARY KEY (periodo,monto_inf,monto_sup)
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Cliente (
    nro_plazo INT UNSIGNED,
    nro_cliente INT UNSIGNED,
		
		CONSTRAINT pk_plazo_cliente
		PRIMARY KEY (nro_plazo,nro_cliente),
		
		CONSTRAINT fk_plazocliente_plazofijo
		FOREIGN KEY (nro_plazo) REFERENCES Plazo_Fijo(nro_plazo)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_plazocliente_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Prestamo (
    nro_prestamo INT UNSIGNED AUTO_INCREMENT ,
    fecha DATE NOT NULL,
    cant_meses INT UNSIGNED NOT NULL,
    monto DECIMAL(10, 2) UNSIGNED NOT NULL,
    tasa_interes DECIMAL(4, 2) UNSIGNED NOT NULL,
    interes DECIMAL(9, 2) UNSIGNED NOT NULL,
    valor_cuota DECIMAL(9, 2) UNSIGNED NOT NULL,
    legajo INT UNSIGNED NOT NULL,
    nro_cliente INT UNSIGNED NOT NULL,
		
		CONSTRAINT fk_prestamo
		PRIMARY KEY (nro_prestamo),
		
		CONSTRAINT fk_prestamo_empleado
		FOREIGN KEY (legajo) REFERENCES Empleado(legajo)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_prestamo_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Pago (
    nro_prestamo INT UNSIGNED,
    nro_pago INT UNSIGNED,
    fecha_venc DATE NOT NULL,
    fecha_pago DATE,
		
		CONSTRAINT pk_pago
		PRIMARY KEY (nro_prestamo,nro_pago),
		
		CONSTRAINT fk_pago_prestamo
		FOREIGN KEY (nro_prestamo) REFERENCES Prestamo(nro_prestamo)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Prestamo (
    periodo INT UNSIGNED,
    monto_inf DECIMAL(10, 2) UNSIGNED,
    monto_sup DECIMAL(10, 2) UNSIGNED,
    tasa DECIMAL(4, 2) UNSIGNED NOT NULL,
		
		CONSTRAINT pk_tasa_prestamo
		PRIMARY KEY (periodo,monto_inf,monto_sup)
    
) ENGINE = InnoDB;

CREATE TABLE Caja_Ahorro (
    nro_ca INT UNSIGNED AUTO_INCREMENT,
    CBU BIGINT UNSIGNED NOT NULL,
    saldo DECIMAL(16, 2) UNSIGNED NOT NULL,
		
		CONSTRAINT pk_caja_ahorro
		PRIMARY KEY (nro_ca)
    
) ENGINE = InnoDB;

CREATE TABLE Cliente_CA (
    nro_cliente INT UNSIGNED,
    nro_ca INT UNSIGNED,
		
		CONSTRAINT pk_cliente_ca
		PRIMARY KEY (nro_cliente,nro_ca),
		
		CONSTRAINT fk_clienteca_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_clienteca_cajaahorro
		FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Tarjeta (
    nro_tarjeta BIGINT UNSIGNED AUTO_INCREMENT,
    PIN VARCHAR(32) NOT NULL,
    CVT VARCHAR(32) NOT NULL,
    fecha_venc DATE NOT NULL,
    nro_cliente INT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_tarjeta
		PRIMARY KEY (nro_tarjeta),
		
		CONSTRAINT fk_tarjeta_cliente
		FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Caja (
    cod_caja INT UNSIGNED AUTO_INCREMENT,
		
		CONSTRAINT pk_caja
		PRIMARY KEY (cod_caja)
    
) ENGINE = InnoDB;

CREATE TABLE Ventanilla (
    cod_caja INT UNSIGNED,
    nro_suc INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_cod_caja
		PRIMARY KEY (cod_caja),
		
		CONSTRAINT fk_ventanilla_caja
		FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_ventanilla_sucursal
		FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE ATM (
    cod_caja INT UNSIGNED,
    cod_postal INT UNSIGNED NOT NULL,
    direccion VARCHAR(32) NOT NULL,
		
		CONSTRAINT pk_atm
		PRIMARY KEY (cod_caja),
		
		CONSTRAINT fk_atm_caja
		FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_atm_ciudad
		FOREIGN KEY (cod_postal) REFERENCES Ciudad(cod_postal)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion (
    nro_trans INT UNSIGNED AUTO_INCREMENT,
    fecha DATE NOT NULL,
    hora TIME NOT NULL,
    monto DECIMAL(16, 2) UNSIGNED NOT NULL,
		
		CONSTRAINT pk_transaccion
		PRIMARY KEY (nro_trans)
    
) ENGINE = InnoDB;

CREATE TABLE Debito (
    nro_trans INT UNSIGNED,
    descripcion TEXT(128),
    nro_cliente INT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_debito
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_debito_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_debito_cliente
		FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro_trans INT UNSIGNED,
    cod_caja INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_transaccion_por_caja
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_transaccionporcaja_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_transaccionporcaja_caja
		FOREIGN KEY (cod_caja) REFERENCES Caja(cod_caja)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Deposito (
    nro_trans INT UNSIGNED,
    nro_ca INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_deposito
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_deposito_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_deposito_cajaahorro
		FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Extraccion (
    nro_trans INT UNSIGNED,
    nro_cliente INT UNSIGNED NOT NULL,
    nro_ca INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_extraccion
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_extraccion_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_extraccion_cliente
		FOREIGN KEY (nro_cliente,nro_ca) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Transferencia (
    nro_trans INT UNSIGNED,
    nro_cliente INT UNSIGNED NOT NULL,
    origen INT UNSIGNED NOT NULL,
    destino INT UNSIGNED NOT NULL,
		
		CONSTRAINT pk_transferencia
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_transferencia_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_transferencia_cliente
		FOREIGN KEY (nro_cliente,origen) REFERENCES Cliente_CA(nro_cliente,nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_transferencia_cajaahorro_destino
		FOREIGN KEY (destino) REFERENCES Caja_Ahorro(nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado';
GRANT SELECT ON banco.Empleado TO 'empleado'@'%';
GRANT SELECT ON banco.Sucursal TO 'empleado'@'%';
GRANT SELECT ON banco.Tasa_Plazo_Fijo TO 'empleado'@'%';
GRANT SELECT ON banco.Tasa_Prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Plazo_Fijo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Plazo_Cliente TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Caja_Ahorro TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Tarjeta TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.Cliente_CA TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.Cliente TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.Pago TO 'empleado'@'%';


CREATE VIEW trans_debito AS
	SELECT Debito.nro_ca, saldo, nro_trans, fecha, hora, 'DEBITO' AS tipo, monto, NULL as cod_caja, Debito.nro_cliente, tipo_doc, nro_doc, nombre, apellido, NULL AS destino
	FROM (Debito NATURAL JOIN Transaccion)
	INNER JOIN Caja_Ahorro ON Debito.nro_ca=Caja_Ahorro.nro_ca
	INNER JOIN Cliente ON Debito.nro_cliente=Cliente.nro_cliente;
	
CREATE VIEW trans_transferencias AS
    SELECT Transferencia.origen, saldo, nro_trans, fecha, hora, 'TRANSFERENCIA' AS tipo, monto, NULL as cod_caja, Transferencia.nro_cliente, tipo_doc, nro_doc, nombre, apellido, Transferencia.destino AS destino
    FROM (Transferencia NATURAL JOIN Transaccion)
		INNER JOIN Caja_Ahorro ON Transferencia.origen=Caja_Ahorro.nro_ca
		INNER JOIN Cliente ON Transferencia.nro_cliente=Cliente.nro_cliente;
		
CREATE VIEW trans_depositos AS 
	SELECT Deposito.nro_ca, saldo, Deposito.nro_trans, fecha, hora, 'DEPOSITO' AS tipo, monto, cod_caja, NULL as nro_cliente, NULL as tipo_doc, NULL as nro_doc, NULL AS nombre, NULL AS apellido, NULL AS destino
	FROM (Deposito NATURAL JOIN Transaccion)
		INNER JOIN Caja_Ahorro ON Deposito.origen=Caja_Ahorro.nro_ca
		INNER JOIN Cliente ON Deposito.nro_cliente=Cliente.nro_cliente;

CREATE VIEW trans_extracciones AS 
	SELECT Extraccion.nro_ca, saldo, Extraccion.nro_trans, fecha, hora, 'DEPOSITO' AS tipo, monto, cod_caja, Extraccion.nro_cliente, tipo_doc, nro_doc, nombre, apellido, NULL AS destino
	FROM (Extraccion NATURAL JOIN Transaccion)
		INNER JOIN Caja_Ahorro ON Extraccion.origen=Caja_Ahorro.nro_ca
		INNER JOIN Cliente ON Extraccion.nro_cliente=Cliente.nro_cliente;
	
CREATE VIEW trans_cajas_ahorro

	SELECT * FROM trans_debito
	UNION
	SELECT * FROM trans_transferencias
	UNION
	SELECT * FROM trans_depositos
	UNION
	SELECT * FROM trans_extracciones;

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm';
GRANT SELECT ON trans_cajas_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE ON tarjeta TO 'atm'@'%';