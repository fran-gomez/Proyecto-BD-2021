USE banco;
set dateformat dmy;
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


INSERT INTO Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
VALUES (00001, 'Olivarez','Javier','DNI', 28351947, 'Chiclana 121', '123123','18-12-1990');
INSERT INTO Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
VALUES (00002, 'Galvez','Manuel','DNI', 13351921, 'Mitre 121', '654123','18-06-1992');
INSERT INTO Cliente(nro_cliente, apellido, nombre, tipo_doc, nro_doc, direccion, telefono, fecha_nac)
VALUES (00003, 'Hernandez','Guillermo','DNI', 21231947, 'Juan Molina 121', '987223','11-01-1981');

#-------------------------Plazo_Fijo----------------------------------#


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

INSERT INTO Tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
VALUES (0123456789123456, md5('1234'), md5('adse'), '23-04-25',00001, 12345678 );
INSERT INTO Tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
VALUES (1123456789123456, md5('2345'), md5('fdas'), '28-05-22',00002, 22345678 );
INSERT INTO Tarjeta(nro_tarjeta, PIN, CVT, fecha_venc, nro_cliente, nro_ca)
VALUES (2123456789123456, md5('3456'), md5('efds'), '03-08-24',00003, 33345678 );

#-------------------------Caja----------------------------------#


INSERT INTO Caja(cod_caja)
VALUES (12345);
INSERT INTO Caja(cod_caja)
VALUES (22345);
INSERT INTO Caja(cod_caja)
VALUES (32345);
INSERT INTO Caja(cod_caja)
VALUES (42345);
INSERT INTO Caja(cod_caja)
VALUES (52345);
INSERT INTO Caja(cod_caja)
VALUES (62345);


#-------------------------Ventanilla----------------------------------#


INSERT INTO Ventanilla(cod_caja, nro_suc)
VALUES (12345, 001);
INSERT INTO Ventanilla(cod_caja, nro_suc)
VALUES (22345, 002);
INSERT INTO Ventanilla(cod_caja, nro_suc)
VALUES (32345, 002);


#-------------------------ATM----------------------------------#


INSERT INTO ATM(cod_caja, cod_postal, direccion)
VALUES (42345, 5500, 'Dambo 454' );
INSERT INTO ATM(cod_caja, cod_postal, direccion)
VALUES (52345, 3300, 'Alvarado 100' );
INSERT INTO ATM(cod_caja, cod_postal, direccion)
VALUES (62345, 3300, 'Rodriguez 20' );


#-------------------------Transaccion----------------------------------#


INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000001, '01-02-21', '10:00:00', 1234.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000002, '12-04-21', '13:00:00', 14.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000003, '12-04-21', '13:04:00', 122222.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000004, '03-02-21', '13:04:00', 3434.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000005, '21-05-20', '16:00:00', 14.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000006, '01-12-19', '21:00:00', 3213.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000007, '12-11-11', '17:00:00', 34.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000008, '19-08-19', '12:00:00', 35.00);
INSERT INTO Transaccion(nro_trans, fecha, hora, monto)
VALUES (0000000009, '22-02-21', '20:00:00', 22234.00);


#-------------------------Debito----------------------------------#


INSERT INTO Debito(nro_trans, descripcion, nro_cliente, nro_ca)
VALUES (0000000001, 'Varios', 00001, 12345678);
INSERT INTO Debito(nro_trans, descripcion, nro_cliente, nro_ca)
VALUES (0000000002, 'Alquiler', 00002, 22345678);
INSERT INTO Debito(nro_trans, descripcion, nro_cliente, nro_ca)
VALUES (0000000003, 'Mercado', 00003, 33345678);


#-------------------------Transaccion_por_caja----------------------------------#


INSERT INTO Transaccion_por_caja(nro_trans, cod_caja)
VALUES (0000000004, 12345);
INSERT INTO Transaccion_por_caja(nro_trans, cod_caja)
VALUES (0000000005, 22345);
INSERT INTO Transaccion_por_caja(nro_trans, cod_caja)
VALUES (0000000006, 32345);
INSERT INTO Transaccion_por_caja(nro_trans, cod_caja)
VALUES (0000000007, 12345);
INSERT INTO Transaccion_por_caja(nro_trans, cod_caja)
VALUES (0000000008, 22345);
INSERT INTO Transaccion_por_caja(nro_trans, cod_caja)
VALUES (0000000009, 32345);


#-------------------------Deposito----------------------------------#


INSERT INTO Deposito(nro_trans, nro_ca)
VALUES (0000000004, 12345);
INSERT INTO Deposito(nro_trans, nro_ca)
VALUES (0000000005, 22345);


#-------------------------Extraccion----------------------------------#


INSERT INTO Extraccion(nro_trans, nro_cliente, nro_ca)
VALUES (0000000006, 00001, 12345678);
INSERT INTO Deposito(nro_trans, nro_cliente, nro_ca)
VALUES (0000000007, 00002, 22345678);


#-------------------------Transferencia----------------------------------#


INSERT INTO Transferencia(nro_trans, nro_cliente, origen, destino)
VALUES (0000000008, 00001, 12345678, 22345678);
INSERT INTO Transferencia(nro_trans, nro_cliente, origen, destino)
VALUES (0000000009, 00002, 22345678, 32345678);



#------------------------------------------------------------------------#