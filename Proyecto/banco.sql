drop database banco;
CREATE DATABASE banco;

USE banco;

DROP USER 'atm'@'%';
DROP USER 'empleado'@'%';
DROP USER 'admin'@'localhost';
FLUSH PRIVILEGES;

CREATE TABLE Ciudad (
    cod_postal INT,
    nombre VARCHAR(32),
		
		CONSTRAINT pk_ciudad
		PRIMARY KEY (cod_postal)
) ENGINE = InnoDB;

CREATE TABLE Sucursal (
    nro_suc INT,
    nombre VARCHAR(32),
    direccion VARCHAR(32),
    telefono VARCHAR(32),
    horario VARCHAR(32),
    cod_postal INT,
		
		CONSTRAINT pk_sucursal
		PRIMARY KEY (nro_suc)
    
) ENGINE = InnoDB;

CREATE TABLE Empleado (
    legajo INT,
    apellido VARCHAR(32),
    nombre VARCHAR(32),
    tipo_doc VARCHAR(3),
    nro_doc VARCHAR(8),
    direccion VARCHAR(32),
    telefono VARCHAR(16),
    cargo VARCHAR(32),
    passwd VARCHAR(32),
    nro_suc INT,
		
		CONSTRAINT pk_empleado
		PRIMARY KEY (legajo),
		
		CONSTRAINT fk_empleado_sucursal
		FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Cliente (
    nro_cliente INT,
    apellido VARCHAR(32),
    nombre VARCHAR(32),
    tipo_doc VARCHAR(3),
    nro_doc VARCHAR(8),
    direccion VARCHAR(32),
    telefono VARCHAR(16),
    fecha_nac DATE,
		
		CONSTRAINT pk_cliente
		PRIMARY KEY (nro_cliente)
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Fijo (
    nro_plazo INT,
    capital DECIMAL(8, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    tasa_interes DECIMAL(5, 2),
    interes DECIMAL(5, 2),
    nro_suc INT,
		
		CONSTRAINT pk_plazo_fijo
		PRIMARY KEY (nro_plazo),
		
		CONSTRAINT fk_plazofijo_sucursal
		FOREIGN KEY (nro_suc) REFERENCES Sucursal(nro_suc)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Plazo_Fijo (
    periodo INT,
    monto_inf DECIMAL(8, 2),
    monto_sup DECIMAL(8, 2),
    tasa DECIMAL(4, 2),
		
		CONSTRAINT pk_taza_plazo_fijo
		PRIMARY KEY (periodo,monto_inf,monto_sup)
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Cliente (
    nro_plazo INT,
    nro_cliente INT,
		
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
    nro_prestamo INT,
    fecha DATE,
    cant_meses INT,
    monto DECIMAL(8, 2),
    tasa_interes DECIMAL(5, 2),
    interes DECIMAL(5, 2),
    valor_cuota DECIMAL(8, 2),
    legajo INT,
    nro_cliente INT,
		
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
    nro_prestamo INT,
    nro_pago INT,
    fecha_venc DATE,
    fecha_pago DATE,
		
		CONSTRAINT pk_pago
		PRIMARY KEY (nro_prestamo,nro_pago),
		
		CONSTRAINT fk_pago_prestamo
		FOREIGN KEY (nro_prestamo) REFERENCES Prestamo(nro_prestamo)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Prestamo (
    periodo INT,
    monto_inf DECIMAL(8, 2),
    monto_sup DECIMAL(8, 2),
    tasa DECIMAL(5, 2),
		
		CONSTRAINT pk_tasa_prestamo
		PRIMARY KEY (periodo,monto_inf,monto_sup)
    
) ENGINE = InnoDB;

CREATE TABLE Caja_Ahorro (
    nro_ca INT,
    CBU LONG,
    saldo DECIMAL(8, 2),
		
		CONSTRAINT pk_caja_ahorro
		PRIMARY KEY (nro_ca)
    
) ENGINE = InnoDB;

CREATE TABLE Cliente_CA (
    nro_cliente INT,
    nro_ca INT,
		
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
    nro_tarjeta INT,
    PIN VARCHAR(32),
    CVT VARCHAR(32),
    fecha_venc DATE,
    nro_cliente INT,
    nro_ca INT,
		
		CONSTRAINT pk_tarjeta
		PRIMARY KEY (nro_tarjeta),
		
		CONSTRAINT fk_tarjeta_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_tarjeta_cajaahorro
		FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Caja (
    cod_caja INT,
		
		CONSTRAINT pk_caja
		PRIMARY KEY (cod_caja)
    
) ENGINE = InnoDB;

CREATE TABLE Ventanilla (
    cod_caja INT,
    nro_suc INT,
		
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
    cod_caja INT,
    cod_postal INT,
    direccion VARCHAR(32),
		
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
    nro_trans INT,
    fecha DATE,
    hora TIME,
    monto DECIMAL(8, 2),
		
		CONSTRAINT pk_transaccion
		PRIMARY KEY (nro_trans)
    
) ENGINE = InnoDB;

CREATE TABLE Debito (
    nro_trans INT,
    descripcion VARCHAR(128),
    nro_cliente INT,
    nro_ca INT,
		
		CONSTRAINT pk_debito
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_debito_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_debito_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_debito_cajaahorro
		FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro_trans INT,
    cod_caja INT,
		
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
    nro_trans INT,
    nro_ca INT,
		
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
    nro_trans INT,
    nro_cliente INT,
    nro_ca INT,
		
		CONSTRAINT pk_extraccion
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_extraccion_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_extraccion_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_extraccion_cajaahorro
		FOREIGN KEY (nro_ca) REFERENCES Caja_Ahorro(nro_ca)
		ON UPDATE CASCADE ON DELETE CASCADE
    
) ENGINE = InnoDB;

CREATE TABLE Transferencia (
    nro_trans INT,
    nro_cliente INT,
    origen INT,
    destino INT,
		
		CONSTRAINT pk_transferencia
		PRIMARY KEY (nro_trans),
		
		CONSTRAINT fk_transferencia_transaccion
		FOREIGN KEY (nro_trans) REFERENCES Transaccion_por_caja(nro_trans)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_transferencia_cliente
		FOREIGN KEY (nro_cliente) REFERENCES Cliente(nro_cliente)
		ON UPDATE CASCADE ON DELETE CASCADE,
		
		CONSTRAINT fk_transferencia_cajaahorro_origen
		FOREIGN KEY (origen) REFERENCES Caja_Ahorro(nro_ca)
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

#CREATE VIEW trans_caja_ahorro AS
#    SELECT nro_ca, saldo, nro_trans, ..., nro_cliente, tipo_doc, nro_doc, nombre, apellido
#    FROM Caja_Ahorro NATURAL JOIN (...) NATURAL JOIN Cliente
#    WHERE 

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm';
#GRANT SELECT ON trans_caja_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE ON tarjeta TO 'atm'@'%';