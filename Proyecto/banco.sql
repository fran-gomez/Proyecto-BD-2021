CREATE USER 'admin'@'localhost' IDENTIFIED BY 'admin';
GRANT ALL PRIVILEGES ON banco.* TO 'admin'@'localhost' WITH GRANT OPTION;

CREATE USER 'empleado'@'%' IDENTIFIED BY 'empleado';
GRANT SELECT ON banco.Empleado, banco.Sucursal, banco.Tasa_Plazo_Fijo, banco.Tasa_Prestamo TO 'empleado'@'%';
GRANT SELECT, INSERT ON banco.Prestamo, banco.Plazo_Fijo, banco.Plazo_Cliente banco.Caja_Ahorro, banco.Tarjeta TO 'empleado'@'%';
GRANT SELECT, INSERT, UPDATE ON banco.Cliente_CA, banco.Cliente, banco.Pago TO 'empleado'@'%';

CREATE VIEW trans_caja_ahorro AS
    SELECT nro_ca, saldo, nro_trans, ..., nro_cliente, tipo_doc, nro_doc, nombre, apellido
    FROM Caja_Ahorro NATURAL JOIN (...) NATURAL JOIN Cliente
    WHERE 

CREATE USER 'atm'@'%' IDENTIFIED BY 'atm';
GRANT SELECT ON trans_caja_ahorro TO 'atm'@'%';
GRANT SELECT, UPDATE ON tarjeta TO 'atm'@'%';


CREATE TABLE Ciudad (
    cod_postal INT,
    nombre VARCHAR(32),
) ENGINE = InnoDB;

CREATE TABLE Sucursal (
    nro_suc INT,
    nombre VARCHAR(32),
    direccion VARCHAR(32),
    telefono VARCHAR(32),
    horario VARCHAR(32),
    cod_postal INT,
    
) ENGINE = InnoDB;

CREATE TABLE Empelado (
    legajo INT,
    apellido VARCHAR(32),
    nombre VARCHAR(32),
    tipo_doc VARCHAR(3),
    nro_doc VARCHAR(8),
    direccion VARCHAR(32),
    telefono VARCHAR(16),
    cargo VARCHAR(32),
    password VARCHAR(32),
    nro suc INT,
    
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
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Fijo (
    nro_plazo
    capital
    fecha_inicio
    fecha_fin
    tasa_interes
    interes
    nro_suc
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Plazo_Fijo (
    periodo
    monto inf
    monto sup
    tasa
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Cliente (
    nro plazo
    nro cliente
    
) ENGINE = InnoDB;

CREATE TABLE Prestamo (
    nro prestamo
    fecha
    cant meses
    monto
    tasa interes
    interes
    valor cuota
    legajo
    nro cliente
    
) ENGINE = InnoDB;

CREATE TABLE Pago (
    nro prestamo
    nro pago
    fecha venc
    fecha pago
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Prestamo (
    periodo
    monto inf
    monto sup
    tasa
    
) ENGINE = InnoDB;

CREATE TABLE Caja_Ahorro (
    nro ca
    CBU
    saldo
    
) ENGINE = InnoDB;

CREATE TABLE Cliente_CA (
    nro cliente
    nro ca
    
) ENGINE = InnoDB;

CREATE TABLE Tarjeta (
    nro tarjeta
    PIN
    CVT
    fecha venc
    nro cliente
    nro ca
    
) ENGINE = InnoDB;

CREATE TABLE Caja (
    cod caja
    
) ENGINE = InnoDB;

CREATE TABLE Ventanilla (
    cod caja
    nro suc
    
) ENGINE = InnoDB;

CREATE TABLE ATM (
    cod caja
    cod postal
    direccion
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion (
    nro trans
    fecha
    hora
    monto
    
) ENGINE = InnoDB;

CREATE TABLE Debito (
    nro trans
    descripcion
    nro cliente
    nro ca
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro trans
    cod caja
    
) ENGINE = InnoDB;

CREATE TABLE Deposito (
    nro trans
    nro ca
    
) ENGINE = InnoDB;

CREATE TABLE Extraccion (
    nro trans
    nro cliente
    nro ca
    
) ENGINE = InnoDB;

CREATE TABLE Transferencia (
    nro trans
    nro cliente
    origen
    destino
    
) ENGINE = InnoDB;