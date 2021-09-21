USE banco;

#---------------------------------------------------------------------#
#ELIMINACIONES:

DELETE FROM Ciudad;
DELETE FROM Sucursal;
DELETE FROM Empleado;
DELETE FROM Cliente;
DELETE FROM Plazo_Fijo;
DELETE FROM Tasa_Plazo_Fijo;
DELETE FROM Plazo_Cliente;
DELETE FROM Prestamo;
DELETE FROM Pago;
DELETE FROM Tasa_Prestamo;
DELETE FROM Caja_Ahorro;
DELETE FROM Cliente_CA;
DELETE FROM Tarjeta;
DELETE FROM Caja;
DELETE FROM Ventanilla;
DELETE FROM ATM;
DELETE FROM Transaccion;
DELETE FROM Debito;
DELETE FROM Transaccion_por_caja;
DELETE FROM Deposito;
DELETE FROM Extraccion;
DELETE FROM Transferencia;


#---------------------------------------------------------------------#
#INSERCIONES:

#-------------------------Ciudad----------------------------------#

INSERT INTO Ciudad(cod_postal, nombre) 
VALUES (8000, Bahia Blanca);
INSERT INTO Ciudad(cod_postal, nombre) 
VALUES (8300, Neuquen);
INSERT INTO Ciudad(cod_postal, nombre) 
VALUES (5500, Mendoza);
INSERT INTO Ciudad(cod_postal, nombre) 
VALUES (3300, Posadas);
INSERT INTO Ciudad(cod_postal, nombre)  
VALUES (9400, Rio Gallegos);


#-------------------------Sucursal----------------------------------#


INSERT INTO Sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
VALUES (001,'Bahia','Estomba 100','123456',8000);
INSERT INTO Sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
VALUES (002,'Nqn','Zelarrayan 100','654321',8300);
INSERT INTO Sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
VALUES (003,'Mdz','Mitre 100','456123',5500);
INSERT INTO Sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
VALUES (004,'Psds','Alvarado 100','321456',3300);
INSERT INTO Sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
VALUES (005,'RioG','Zapiola 100','456456',9400);
INSERT INTO Sucursal(nro_suc, nombre, direccion, telefono, horario, cod_postal) 
VALUES (006,'Bahia','Alsina 100','333456',8000);

#-------------------------Empleado----------------------------------#

INSERT INTO Empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES (0001,'Perez','Luis','DNI', 12345678, 'Chiclana 1', '111111', 'administrativo', md5('empleado1'), 001);
INSERT INTO Empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES (0002,'Lopez','Jose','DNI', 87654321, 'San Martin 2', '222222', 'administrativo', md5('empleado2'), 002);
INSERT INTO Empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES (0003,'Gonzalez','Jorge','DNI', 43215678, '12 de Octubre 3', '333333', 'administrativo', md5('empleado3'), 003);
INSERT INTO Empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES (0004,'Ramirez','Luis','DNI', 12348765, 'Colon 4', '444444', 'administrativo', md5('empleado4'), 004);
INSERT INTO Empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES (0005,'Fernandez','Daniel','DNI', 56785678, 'Saavedra 5', '555555', 'administrativo', md5('empleado5'), 005);
INSERT INTO Empleado(legajo, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, cargo, password,
nro_suc)
VALUES (0006,'Alvarez','Damian','DNI', 43218765, 'Allem 6', '666666', 'administrativo', md5('empleado6'), 001);


#-------------------------Cliente----------------------------------#
set dateformat dmy;

INSERT INTO Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
VALUES (00001, 'Olivarez','Javier','DNI', 28351947, 'Chiclana 121', '123123','18-12-1990');
INSERT INTO Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
VALUES (00002, 'Galvez','Manuel','DNI', 13351921, 'Mitre 121', '654123','18-06-1992');
INSERT INTO Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
VALUES (00003, 'Hernandez','Guillermo','DNI', 21231947, 'Juan Molina 121', '987223','11-01-1981');

#-------------------------Plazo_Fijo----------------------------------#

set dateformat dmy;

INSERT INTO Plazo_Fijo(nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc)
VALUES (11111111, 1000.00, '10-06-2021', '10-07-2021', 10.00, 100.00, 001);
INSERT INTO Plazo_Fijo(nro_plazo, capital, fecha_inicio, fecha_fin, tasa_interes, interes, nro_suc)
VALUES (22222222, 100.00, '12-05-2021', '12-06-2021', 10.00, 10.00, 002);


#-------------------------Tasa_Plazo_Fijo----------------------------------#

INSERT INTO Tasa_Plazo_Fijo(periodo, monto_inf, monto_sup, tasa)
VALUES (030, 10.00, 20.00, 10.00);
INSERT INTO Tasa_Plazo_Fijo(periodo, monto_inf, monto_sup, tasa)
VALUES (060, 10.00, 20.00, 10.00);
INSERT INTO Tasa_Plazo_Fijo(periodo, monto_inf, monto_sup, tasa)
VALUES (090, 10.00, 20.00, 10.00);

#-------------------------Plazo_Cliente----------------------------------#

INSERT INTO Plazo_Cliente(nro_plazo, nro_cliente) 
VALUES (11111111, 00001);
INSERT INTO Plazo_Cliente(nro_plazo, nro_cliente) 
VALUES (22222222, 00002);

#-------------------------Prestamo---------------------------------#
set dateformat dmy;

INSERT INTO Prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente) 
VALUES (12345678, '10-10-2020', 22, 1000.00, 10.00, 100.00, 50.00, 0001, 00002);
INSERT INTO Prestamo(nro_prestamo, fecha, cant_meses, monto, tasa_interes, interes, valor_cuota, legajo, nro_cliente) 
VALUES (11115678, '12-02-2021', 10, 2000.00, 10.00, 200.00, 200.00, 0002, 00003);

#-------------------------Pago----------------------------------#
INSERT INTO Pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago)
VALUES (12345678, 12, '10-08-2022', '10-09-2021');
INSERT INTO Pago(nro_prestamo, nro_pago, fecha_venc, fecha_pago)
VALUES (11115678, 13, '12-12-2021', '12-09-2021');

#-------------------------Tasa_Prestamo---------------------------------#

INSERT INTO Tasa_Prestamo(periodo, monto_inf, monto_sup, tasa)
VALUES (030, 100.00, 100000.00, 10.00);
INSERT INTO Tasa_Prestamo(periodo, monto_inf, monto_sup, tasa)
VALUES (060, 100.00, 100000.00, 20.00);
INSERT INTO Tasa_Prestamo(periodo, monto_inf, monto_sup, tasa)
VALUES (090, 100.00, 100000.00, 30.00);

#-------------------------Caja_Ahorro----------------------------------#
INSERT INTO Caja_Ahorro(nro_ca, CBU, saldo)
VALUES (12345678, 123456789123456789, 1234.00);
INSERT INTO Caja_Ahorro(nro_ca, CBU, saldo)
VALUES (22345678, 222456789123456789, 10.00);
INSERT INTO Caja_Ahorro(nro_ca, CBU, saldo)
VALUES (33345678, 333456789123456789, 129482.00);

#-------------------------Cliente_CA---------------------------------#

INSERT INTO Cliente_CA(nro_cliente, nro_ca)
VALUES (00001, 12345678);
INSERT INTO Cliente_CA(nro_cliente, nro_ca)
VALUES (00002, 22345678);
INSERT INTO Cliente_CA(nro_cliente, nro_ca)
VALUES (00003, 33345678);


#-------------------------Tarjeta----------------------------------#
