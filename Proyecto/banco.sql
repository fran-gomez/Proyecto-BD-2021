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
    nro_plazo INT,
    capital DECIMAL(4, 2),
    fecha_inicio DATE,
    fecha_fin DATE,
    tasa_interes DECIMAL(4, 2),
    interes DECIMAL(4, 2),
    nro_suc INT,
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Plazo_Fijo (
    periodo INT,
    monto_inf DECIMAL(4, 2),
    monto_sup DECIMAL(4, 2),
    tasa DECIMAL(4, 2),
    
) ENGINE = InnoDB;

CREATE TABLE Plazo_Cliente (
    nro_plazo INT,
    nro_cliente INT,
    
) ENGINE = InnoDB;

CREATE TABLE Prestamo (
    nro_prestamo INT,
    fecha DATE,
    cant_meses INT,
    monto DECIMAL(, 2),
    tasa_interes DECIMAL(, 2),
    interes DECIMAL(, 2),
    valor_cuota DECIMAL(, 2),
    legajo INT,
    nro_cliente INT,
    
) ENGINE = InnoDB;

CREATE TABLE Pago (
    nro_prestamo INT,
    nro_pago DECIMAL(, 2),
    fecha_venc DATE,
    fecha_pago DATE,
    
) ENGINE = InnoDB;

CREATE TABLE Tasa_Prestamo (
    periodo INT,
    monto_inf DECIMAL(, 2),
    monto_sup DECIMAL(, 2),
    tasa DECIMAL(, 2),
    
) ENGINE = InnoDB;

CREATE TABLE Caja_Ahorro (
    nro_ca INT,
    CBU LONG,
    saldo DECIMAL(, 2),
    
) ENGINE = InnoDB;

CREATE TABLE Cliente_CA (
    nro_cliente INT,
    nro_ca INT,
    
) ENGINE = InnoDB;

CREATE TABLE Tarjeta (
    nro_tarjeta LONG,
    PIN VARCHAR(32),
    CVT VARCHAR(32),
    fecha_venc DATE,
    nro_cliente INT,
    nro_ca INT,
    
) ENGINE = InnoDB;

CREATE TABLE Caja (
    cod_caja INT,
    
) ENGINE = InnoDB;

CREATE TABLE Ventanilla (
    cod_caja INT,
    nro_suc INT,
    
) ENGINE = InnoDB;

CREATE TABLE ATM (
    cod_caja INT,
    cod_postal INT,
    direccion VARCHAR(32),
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion (
    nro_trans INT,
    fecha DATE,
    hora TIME,
    monto DECIMAL(, 2),
    
) ENGINE = InnoDB;

CREATE TABLE Debito (
    nro_trans INT,
    descripcion VARCHAR(128),
    nro_cliente INT,
    nro_ca INT,
    
) ENGINE = InnoDB;

CREATE TABLE Transaccion_por_caja (
    nro_trans INT,
    cod_caja INT,
    
) ENGINE = InnoDB;

CREATE TABLE Deposito (
    nro_trans INT,
    nro_ca INT,
    
) ENGINE = InnoDB;

CREATE TABLE Extraccion (
    nro_trans INT,
    nro_cliente INT,
    nro_ca INT,
    
) ENGINE = InnoDB;

CREATE TABLE Transferencia (
    nro_trans INT,
    nro_cliente INT,
    origen INT,
    destino INT,
    
) ENGINE = InnoDB;