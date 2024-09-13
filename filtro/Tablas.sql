insert into inventarioVehiculo (marca,modelo,año,precio,estado) values
	('marca1','modelo1',1001,1000,'Nuevo'),
	('marca2','modelo2',1011,2000,'Usado'),
	('marca3','modelo3',1021,3000,'Nuevo'),
	('marca4','modelo4',1031,4000,'Usado'),
	('marca5','modelo5',1041,5000,'Nuevo'),
	('marca6','modelo6',1051,1500,'Usado'),
	('marca7','modelo7',1061,2400,'Nuevo'),
	('marca8','modelo8',1071,3300,'Usado'),
	('marca9','modelo9',1081,4200,'Nuevo'),
	('marca10','modelo10',1091,5100,'Usado'),
	('marca11','modelo11',1002,1900,'Nuevo'),
	('marca12','modelo12',1003,2800,'Usado'),
	('marca13','modelo13',1004,3700,'Nuevo'),
	('marca14','modelo14',1005,4600,'Usado'),
	('marca15','modelo15',1006,5500,'Nuevo'),
	('marca16','modelo16',1007,1050,'Usado'),
	('marca17','modelo17',1008,2040,'Nuevo'),
	('marca18','modelo18',1009,3030,'Usado'),
	('marca19','modelo19',1521,4020,'Nuevo'),
	('marca20','modelo20',2001,5010,'Usado');
	
insert into clientes (nombre, apellido1, apellido2, telefono, email) values
	('Juan','Rivero','Romero','3186924044','juandariver1@outlook.com'),
	('Nombre1','apellido1.0','apellido2.0','1000000000','email0@generico.com'),
	('Nombre2','apellido1.1','apellido2.1','1000000001','email1@generico.com'),
	('Nombre3','apellido1.2','apellido2.2','1000000002','email2@generico.com'),
	('Nombre4','apellido1.3','apellido2.3','1000000003','email3@generico.com'),
	('Nombre5','apellido1.4','apellido2.4','1000000004','email4@generico.com'),
	('Nombre6','apellido1.5','apellido2.5','1000000005','email5@generico.com'),
	('Nombre7','apellido1.6','apellido2.6','1000000006','email6@generico.com'),
	('Nombre8','apellido1.7','apellido2.7','1000000007','email7@generico.com'),
	('Nombre9','apellido1.8','apellido2.8','1000000008','email8@generico.com'),
	('Nombre10','apellido1.9','apellido2.9','1000000009','email9@generico.com'),
	('Nombre11','apellido1.10','apellido2.10','1000000010','email10@generico.com'),
	('Nombre12','apellido1.11','apellido2.11','1000000011','email11@generico.com'),
	('Nombre13','apellido1.12','apellido2.12','1000000012','email12@generico.com'),
	('Nombre14','apellido1.13','apellido2.13','1000000013','email13@generico.com'),
	('Nombre15','apellido1.14','apellido2.14','1000000014','email14@generico.com'),
	('Nombre16','apellido1.15','apellido2.15','1000000015','email15@generico.com'),
	('Nombre17','apellido1.16','apellido2.16','1000000016','email16@generico.com'),
	('Nombre18','apellido1.17','apellido2.17','1000000017','email17@generico.com'),
	('Nombre19','apellido1.18','apellido2.18','1000000018','email18@generico.com'),
	('Nombre20','apellido1.19','apellido2.19','1000000019','email19@generico.com');


insert into ventas (id_vehiculo, id_cliente, fecha_venta) values
	(1,20,'1001-10-10'),
	(2,19,'1002-10-10'),
	(3,18,'1003-10-10'),
	(4,17,'1004-10-10'),
	(5,16,'1005-10-10'),
	(6,15,'1006-10-10'),
	(7,14,'1007-10-10'),
	(8,13,'1008-10-10'),
	(9,12,'1009-10-10'),
	(10,11,'1010-10-10'),
	(11,10,'1001-10-10'),
	(12,9,'1001-11-10'),
	(13,8,'1001-12-10'),
	(14,7,'2001-10-10'),
	(15,6,'3001-10-10'),
	(16,5,'4001-10-10'),
	(17,4,'1001-10-16'),
	(18,3,'1001-10-18'),
	(19,2,'1001-10-20'),
	(20,1,'1001-10-24');

insert into proveedores (nombre, apellido1, apellido2, telefono, email, componentes) values
	('Juan','Rivero','Romero','3186924044','juandariver1@outlook.com','usado en mantenimiento'),
	('Daniel','Latorre','Ruiz','3453454531','latorre@gmail.com','sin usar en mantenimiento'),
	('Nombre1','Apellido1.1','Apellido2.1','1000000000','emails1@generico.com','usado en mantenimiento'),
	('Nombre2','Apellido1.2','Apellido2.2','1000000001','emails2@generico.com','sin usar en mantenimiento'),
	('Nombre3','Apellido1.3','Apellido2.3','1000000002','emails3@generico.com','usado en mantenimiento'),
	('Nombre4','Apellido1.4','Apellido2.4','1000000003','emails4@generico.com','sin usar en mantenimiento'),
	('Nombre5','Apellido1.5','Apellido2.5','1000000004','emails5@generico.com','usado en mantenimiento'),
	('Nombre6','Apellido1.6','Apellido2.6','1000000005','emails6@generico.com','sin usar en mantenimiento'),
	('Nombre7','Apellido1.7','Apellido2.7','1000000006','emails7@generico.com','usado en mantenimiento'),
	('Nombre8','Apellido1.8','Apellido2.8','1000000007','emails8@generico.com','sin usar en mantenimiento'),
	('Nombre9','Apellido1.9','Apellido2.9','1000000008','emails9@generico.com','usado en mantenimiento'),
	('Nombre10','Apellido1.10','Apellido2.10','1000000009','emails10@generico.com','sin usar en mantenimiento'),
	('Nombre11','Apellido1.11','Apellido2.11','1000000010','emails11@generico.com','usado en mantenimiento'),
	('Nombre12','Apellido1.12','Apellido2.12','1000000011','emails12@generico.com','sin usar en mantenimiento'),
	('Nombre13','Apellido1.13','Apellido2.13','1000000012','emails13@generico.com','usado en mantenimiento'),
	('Nombre14','Apellido1.14','Apellido2.14','1000000013','emails14@generico.com','sin usar en mantenimiento'),
	('Nombre15','Apellido1.15','Apellido2.15','1000000014','emails15@generico.com','usado en mantenimiento'),
	('Nombre16','Apellido1.16','Apellido2.16','1000000015','emails16@generico.com','sin usar en mantenimiento'),
	('Nombre17','Apellido1.17','Apellido2.17','1000000016','emails17@generico.com','usado en mantenimiento'),
	('Nombre18','Apellido1.18','Apellido2.18','1000000017','emails18@generico.com','sin usar en mantenimiento');

insert into empleado (nombre, apellido1, apellido2, telefono, email, hora_entrada, hora_salida, rol, fecha_contratacion) values
	('Juan','Rivero','Romero','3186924044','juandariver1@outlook.com','06:00','14:00','Ventas','1000-10-10'),
	('Daniel','Latorre','Ruiz','3453454532','latorre@gmail.com','14:00','22:00','Servicio','1001-10-10'),
	('Juan2','Rivero2','Romero','3186924045','juandariver1@outlook.com','06:00','14:00','Ventas','1002-10-10'),
	('Daniel2','Latorre2','Ruiz','3453454522','latorre@gmail.com','14:00','22:00','Servicio','1003-10-10'),
	('Juan3','Rivero3','Romero','3186924544','juandariver1@outlook.com','06:00','14:00','Ventas','1004-10-10'),
	('Daniel3','Latorre3','Ruiz','3453458532','latorre@gmail.com','14:00','22:00','Servicio','1005-10-10'),
	('Juan4','Rivero4','Romero','3186934044','juandariver1@outlook.com','06:00','14:00','Ventas','1006-10-10'),
	('Daniel4','Latorre4','Ruiz','3453254532','latorre@gmail.com','14:00','22:00','Servicio','1007-10-10'),
	('Juan5','Rivero5','Romero','3186974044','juandariver1@outlook.com','06:00','14:00','Ventas','1008-10-10'),
	('Daniel5','Latorre5','Ruiz','3453474532','latorre@gmail.com','14:00','22:00','Servicio','1009-10-10');

insert into historialServicio (id_vehiculo, id_empleado, id_proveedor, fecha_entrada, fecha_salida, servicio) values
	(1,1,1,'1001-10-10','1001-10-01','Mantenimiento'),
	(2,2,2,'1001-10-10','1001-10-02','Reparacion'),
	(3,3,3,'1001-10-10','1001-10-03','Mantenimiento'),
	(4,4,4,'1001-10-10','1001-10-04','Reparacion'),
	(5,5,5,'1001-10-10','1001-10-05','Mantenimiento'),
	(6,6,6,'1001-10-10','1001-10-06','Reparacion'),
	(7,7,7,'1001-10-10','1001-10-07','Mantenimiento'),
	(8,8,8,'1001-10-10','1001-10-08','Reparacion'),
	(9,9,9,'1001-10-10','1001-10-09','Mantenimiento'),
	(10,10,10,'1001-10-10','1001-10-10','Reparacion');
	
insert into departamento (nombre, direccion) values
	('Ventas', 'Calle 123, Ciudad A'),
	('Servicio', 'Calle 456, Ciudad B'),
	('Administración', 'Calle 789, Ciudad C'),
	('Compras', 'Avenida 101, Ciudad D'),
	('Logística', 'Avenida 202, Ciudad E'),
	('Recursos Humanos', 'Calle 303, Ciudad F'),
	('Finanzas', 'Calle 404, Ciudad G'),
	('Marketing', 'Calle 505, Ciudad H'),
	('IT', 'Avenida 606, Ciudad I'),
	('Legal', 'Calle 707, Ciudad J');


insert into departamento_ventas (id_departamento, ventas_realizadas, comisiones_generadas) values
	(1, 100, '10000'),
	(1, 200, '20000'),
	(1, 150, '15000'),
	(1, 180, '18000'),
	(1, 220, '22000'),
	(1, 190, '19000'),
	(1, 210, '21000'),
	(1, 230, '23000'),
	(1, 170, '17000'),
	(1, 160, '16000');

insert into departamento_servicio (id_departamento, id_empleado, servicios_realizados) values
	(2, 1, 'Cambio de aceite'),
	(2, 2, 'Reparación de motor'),
	(2, 3, 'Ajuste de frenos'),
	(2, 4, 'Mantenimiento general'),
	(2, 5, 'Cambio de neumáticos'),
	(2, 6, 'Revisión técnica'),
	(2, 7, 'Reparación de suspensión'),
	(2, 8, 'Revisión de frenos'),
	(2, 9, 'Cambio de bujías'),
	(2, 10, 'Reparación de transmisión');


insert into departamento_empleado (id_departamento, id_empleado, rendimiento) values
	(1, 1, 'Excelente'),
	(1, 2, 'Bueno'),
	(1, 3, 'Excelente'),
	(2, 4, 'Satisfactorio'),
	(2, 5, 'Sobresaliente'),
	(2, 6, 'Bueno'),
	(3, 7, 'Excelente'),
	(3, 8, 'Satisfactorio'),
	(4, 9, 'Bueno'),
	(5, 10, 'Excelente');


insert into cliente_potencial (id_cliente, id_vehiculo, pistas_valiosas) values
	(1, 1, 'Cliente interesado en vehículos nuevos'),
	(2, 2, 'Cliente busca modelos de 2020 en adelante'),
	(3, 3, 'Interesado en autos deportivos'),
	(4, 4, 'Cliente con alta capacidad de pago'),
	(5, 5, 'Busca vehículos con bajo kilometraje'),
	(6, 6, 'Cliente prioriza el consumo de combustible'),
	(7, 7, 'Busca autos familiares'),
	(8, 8, 'Cliente prefiere autos de lujo'),
	(9, 9, 'Busca opciones de autos eléctricos'),
	(10, 10, 'Cliente tiene referencias de modelos SUV');


insert into proveedor_componentes (id_proveedor, componente) values
	(1, 'Filtro de aceite'),
	(2, 'Bujías'),
	(3, 'Llantas'),
	(4, 'Pastillas de freno'),
	(5, 'Correa de distribución'),
	(6, 'Radiador'),
	(7, 'Alternador'),
	(8, 'Suspensión'),
	(9, 'Transmisión'),
	(10, 'Motor'),
	(1, 'Batería'),
	(2, 'Faro'),
	(3, 'Volante'),
	(4, 'Asiento'),
	(5, 'Parabrisas');

select * from inventarioVehiculo;
select * from clientes;
select * from ventas;
select * from proveedores;
select * from empleado;
select * from departamento;
select * from departamento_ventas;
select * from departamento_servicio;
select * from departamento_empleado;
select * from cliente_potencial;
select * from proveedor_componentes;











