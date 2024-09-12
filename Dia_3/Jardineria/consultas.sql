-- -------------------------------------
-- -    consultas sobre una tabla      -
-- -------------------------------------

-- 1. Devuelve un listado con el código de oficina y la ciudad donde hay oficinas.

select codigo_oficina, ciudad  from oficina;

-- 2. Devuelve un listado con la ciudad y el teléfono de las oficinas de España.

select ciudad, telefono  from oficina where pais = 'España';

-- 3. Devuelve un listado con el nombre, apellidos y email de los empleados cuyo jefe tiene un código de jefe igual a 7.

select nombre, apellido1, apellido2 from empleado where codigo_jefe = 7;

-- 4. Devuelve el nombre del puesto, nombre, apellidos y email del jefe de la empresa.

select nombre, apellido1, apellido2, email, puesto  from empleado where codigo_jefe is null ;

-- 5. Devuelve un listado con el nombre, apellidos y puesto de aquellos empleados que no sean representantes de ventas.

select nombre, apellido1, apellido2, puesto  from empleado where puesto != 'Representante Ventas';

-- 6. Devuelve un listado con el nombre de los todos los clientes españoles.

select nombre_cliente as Nombre, pais from cliente where pais = 'Spain';

-- 7. Devuelve un listado con los distintos estados por los que puede pasar un pedido.

select distinct estado from pedido ;

-- 8. Devuelve un listado con el código de cliente de aquellos clientes que
--    realizaron algún pago en 2008. Tenga en cuenta que deberá eliminar
--    aquellos códigos de cliente que aparezcan repetidos. Resuelva la consulta:

select distinct codigo_cliente, fecha_pago from pago WHERE EXTRACT(YEAR FROM fecha_pago) = 2008;

-- 9. Devuelve un listado con el código de pedido, código de cliente, fecha
--    esperada y fecha de entrega de los pedidos que no han sido entregados a
--    tiempo.

select codigo_pedido, codigo_cliente, fecha_esperada, fecha_entrega from pedido where fecha_entrega is null or fecha_entrega > fecha_esperada;

-- 10. Devuelve un listado con el código de pedido, código de cliente, fecha esperada y fecha de entrega de los pedidos cuya fecha de entrega ha sido al menos dos días antes de la fecha esperada.
select 
    codigo_pedido, 
    codigo_cliente, 
    fecha_esperada, 
    fecha_entrega
from pedido
where fecha_entrega <= fecha_esperada - interval '2 days';

-- 11. Devuelve un listado de todos los pedidos que fueron rechazados en 2009.
select 
    codigo_pedido, 
    fecha_pedido
from pedido
where estado = 'rechazado'
and extract(year from fecha_pedido) = 2009;

-- 12. Devuelve un listado de todos los pedidos que han sido entregados en el mes de enero de cualquier año.
select 
    codigo_pedido, 
    codigo_cliente, 
    fecha_pedido, 
    fecha_esperada, 
    fecha_entrega
from pedido
where extract(month from fecha_entrega) = 1;

-- 13. Devuelve un listado con todos los pagos que se realizaron en el año 2008 mediante Paypal. Ordene el resultado de mayor a menor.
select 
    codigo_cliente, 
    forma_pago, 
    fecha_pago, 
    total
from pago
where extract(year from fecha_pago) = 2008 
and forma_pago = 'paypal'
order by total desc;

-- 14. Devuelve un listado con todas las formas de pago que aparecen en la tabla pago. Tenga en cuenta que no deben aparecer formas de pago repetidas.
select distinct 
    forma_pago
from pago;

-- 15. Devuelve un listado con todos los productos que pertenecen a la gama Ornamentales y que tienen más de 100 unidades en stock. El listado deberá estar ordenado por su precio de venta, mostrando en primer lugar los de mayor precio.
select 
    codigo_producto, 
    nombre, 
    cantidad_en_stock, 
    precio_venta
from producto
where gama = 'ornamentales' 
and cantidad_en_stock > 100
order by precio_venta desc;

-- 16. Devuelve un listado con todos los clientes que sean de la ciudad de Madrid y cuyo representante de ventas tenga el código de empleado 11 o 30.
select 
    codigo_cliente, 
    nombre_cliente, 
    nombre_contacto, 
    apellido_contacto
from cliente
where ciudad = 'madrid' 
and codigo_empleado_rep_ventas in (11, 30);



-- ------------------------------------------------------
-- -    Consultas multitabla (Composición interna)      -
-- ------------------------------------------------------

-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
select 
    c.nombre_cliente, 
    e.nombre, 
    e.apellido1, 
    e.apellido2
from cliente c
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
select 
    c.nombre_cliente, 
    e.nombre, 
    e.apellido1, 
    e.apellido2
from cliente c
inner join pago p on c.codigo_cliente = p.codigo_cliente
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado;

-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
select 
    c.nombre_cliente, 
    e.nombre as nombre_representante, 
    e.apellido1 as apellido_representante
from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
where p.codigo_cliente is null;

-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select 
    c.nombre_cliente, 
    e.nombre, 
    e.apellido1, 
    e.apellido2, 
    o.ciudad
from cliente c
inner join pago p on c.codigo_cliente = p.codigo_cliente
inner join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
inner join oficina o on e.codigo_oficina = o.codigo_oficina;

-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select 
    c.nombre_cliente, 
    e.nombre as nombre_representante, 
    e.apellido1 as apellido_representante, 
    o.ciudad as ciudad_oficina
from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina
where p.codigo_cliente is null;

-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
select distinct
    o.linea_direccion1, 
    o.linea_direccion2, 
    o.ciudad, 
    o.pais, 
    o.codigo_postal, 
    o.telefono
from oficina o
join empleado e on o.codigo_oficina = e.codigo_oficina
join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.ciudad = 'Fuenlabrada';

-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
select 
    c.nombre_cliente, 
    e.nombre as nombre_representante, 
    o.ciudad as ciudad_oficina
from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina;

-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
select 
    e.nombre as nombre_empleado, 
    e.apellido1 as apellido_empleado, 
    j.nombre as nombre_jefe, 
    j.apellido1 as apellido_jefe
from empleado e
left join empleado j on e.codigo_jefe = j.codigo_empleado;

-- 9. Devuelve un listado que muestre el nombre de cada empleado, el nombre de su jefe y el nombre del jefe de su jefe.
select 
    e.nombre as nombre_empleado, 
    e.apellido1 as apellido_empleado, 
    j.nombre as nombre_jefe, 
    j.apellido1 as apellido_jefe, 
    jj.nombre as nombre_jefe_jefe, 
    jj.apellido1 as apellido_jefe_jefe
from empleado e
left join empleado j on e.codigo_jefe = j.codigo_empleado
left join empleado jj on j.codigo_jefe = jj.codigo_empleado;

-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
select distinct
    c.nombre_cliente
from cliente c
join pedido p on c.codigo_cliente = p.codigo_cliente
where p.fecha_entrega > p.fecha_esperada
or p.fecha_entrega is null;

-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
select 
    c.nombre_cliente, 
    p.gama as gama_producto
from cliente c
join pedido pd on c.codigo_cliente = pd.codigo_cliente
join detalle_pedido dp on pd.codigo_pedido = dp.codigo_pedido
join producto p on dp.codigo_producto = p.codigo_producto
group by c.nombre_cliente, p.gama
order by c.nombre_cliente, p.gama;




-- -----------------------------------------------------
-- -    consultas multitabla (Composición externa)     -
-- -----------------------------------------------------

/-- 1. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago. 
select c.*
from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
where p.codigo_cliente is null;

-- 2. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pedido.
select c.*
from cliente c
left join pedido pd on c.codigo_cliente = pd.codigo_cliente
where pd.codigo_pedido is null;

-- 3. Devuelve un listado que muestre los clientes que no han realizado ningún pago y los que no han realizado ningún pedido.
select c.*
from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
left join pedido pd on c.codigo_cliente = pd.codigo_cliente
where p.codigo_cliente is null and pd.codigo_pedido is null;

-- 4. Devuelve un listado que muestre solamente los empleados que no tienen una oficina asociada.
select e.*
from empleado e
left join oficina o on e.codigo_oficina = o.codigo_oficina
where o.codigo_oficina is null;

-- 5. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado.
select e.*
from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where c.codigo_cliente is null;

-- 6. Devuelve un listado que muestre solamente los empleados que no tienen un cliente asociado junto con los datos de la oficina donde trabajan.
select e.*, o.*
from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join oficina o on e.codigo_oficina = o.codigo_oficina
where c.codigo_cliente is null;

-- 7. Devuelve un listado que muestre los empleados que no tienen una oficina asociada y los que no tienen un cliente asociado.
select e.*
from empleado e
left join oficina o on e.codigo_oficina = o.codigo_oficina
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
where o.codigo_oficina is null or c.codigo_cliente is null;

-- 8. Devuelve un listado de los productos que nunca han aparecido en un pedido.
select p.*
from producto p
left join detalle_pedido dp on p.codigo_producto = dp.codigo_producto
where dp.codigo_producto is null;

-- 9. Devuelve un listado de los productos que nunca han aparecido en un pedido. El resultado debe mostrar el nombre, la descripción y la imagen del producto.
select 
    p.nombre, 
    p.descripcion, 
    g.imagen
from producto p
left join detalle_pedido dp on p.codigo_producto = dp.codigo_producto
left join gama_producto g on p.gama = g.gama
where dp.codigo_producto is null;

-- 10. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
select o.*
from oficina o
left join empleado e on o.codigo_oficina = e.codigo_oficina
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join pedido p on c.codigo_cliente = p.codigo_cliente
left join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
left join producto pr on dp.codigo_producto = pr.codigo_producto
left join gama_producto g on pr.gama = g.gama
where g.gama = 'Frutales'
  and e.codigo_empleado is null;

-- 11. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
select c.*
from cliente c
inner join pedido p on c.codigo_cliente = p.codigo_cliente
left join pago pa on c.codigo_cliente = pa.codigo_cliente
where pa.codigo_cliente is null;

-- 12. Devuelve un listado con los datos de los empleados que no tienen clientes asociados y el nombre de su jefe asociado.
select e.*, j.nombre as nombre_jefe, j.apellido1 as apellido1_jefe, j.apellido2 as apellido2_jefe
from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join empleado j on e.codigo_jefe = j.codigo_empleado
where c.codigo_cliente is null;


-- -----------------------------
-- -    Consultas resumen      -
-- -----------------------------

-- 1. ¿Cuántos empleados hay en la compañía?
select 
    count(*) as total_empleados
from empleado;

-- 2. ¿Cuántos clientes tiene cada país?
select 
    pais, 
    count(*) as total_clientes
from cliente
group by pais;

-- 3. ¿Cuál fue el pago medio en 2009?
select 
    avg(total) as pago_medio_2009
from pago
where extract(year from fecha_pago) = 2009;

-- 4. ¿Cuántos pedidos hay en cada estado? Ordena el resultado de forma descendente por el número de pedidos.
select 
    estado, 
    count(*) as total_pedidos
from pedido
group by estado
order by total_pedidos desc;

-- 5. Calcula el precio de venta del producto más caro y más barato en una misma consulta.
select 
    max(precio_venta) as precio_maximo,
    min(precio_venta) as precio_minimo
from producto;

-- 6. Calcula el número de clientes que tiene la empresa.
select 
    count(*) as total_clientes
from cliente;

-- 7. ¿Cuántos clientes existen con domicilio en la ciudad de Madrid?
select 
    count(*) as total_clientes_madrid
from cliente
where ciudad = 'madrid';

-- 8. Calcula cuántos clientes tiene cada una de las ciudades que empiezan por M.
select 
    ciudad, 
    count(*) as total_clientes
from cliente
where ciudad like 'm%'
group by ciudad;

-- 9. Devuelve el nombre de los representantes de ventas y el número de clientes al que atiende cada uno.
select 
    e.nombre as nombre_representante, 
    count(c.codigo_cliente) as numero_clientes
from empleado e
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
group by e.nombre;

-- 10. Calcula el número de clientes que no tiene asignado representante de ventas.
select 
    count(*) as total_clientes_sin_representante
from cliente
where codigo_empleado_rep_ventas is null;

-- 11. Calcula la fecha del primer y último pago realizado por cada uno de los clientes. El listado deberá mostrar el nombre y los apellidos de cada cliente.
select 
    c.nombre_cliente, 
    c.apellido1, 
    c.apellido2,
    min(p.fecha_pago) as primer_pago,
    max(p.fecha_pago) as ultimo_pago
from cliente c
join pago p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente, c.apellido1, c.apellido2;

-- 12. Calcula el número de productos diferentes que hay en cada uno de los pedidos.
select 
    codigo_pedido, 
    count(distinct codigo_producto) as num_productos_diferentes
from detalle_pedido
group by codigo_pedido;

-- 13. Calcula la suma de la cantidad total de todos los productos que aparecen en cada uno de los pedidos.
select 
    codigo_pedido, 
    sum(cantidad) as cantidad_total
from detalle_pedido
group by codigo_pedido;

-- 14. Devuelve un listado de los 20 productos más vendidos y el número total de unidades que se han vendido de cada uno. El listado deberá estar ordenado por el número total de unidades vendidas.
select 
    p.nombre as nombre_producto, 
    sum(dp.cantidad) as total_unidades_vendidas
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by p.nombre
order by total_unidades_vendidas desc
limit 20;

-- 15. La facturación que ha tenido la empresa en toda la historia, indicando la base imponible, el IVA y el total facturado. La base imponible se calcula sumando el coste del producto por el número de unidades vendidas de la tabla detalle_pedido. El IVA es el 21 % de la base imponible, y el total la suma de los dos campos anteriores.
select 
    sum(dp.cantidad * p.precio_proveedor) as base_imponible,
    sum(dp.cantidad * p.precio_proveedor) * 0.21 as iva,
    sum(dp.cantidad * p.precio_proveedor) * 1.21 as total_facturado
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto;

-- 16. La misma información que en la pregunta anterior, pero agrupada por código de producto.
select 
    dp.codigo_producto,
    sum(dp.cantidad * p.precio_proveedor) as base_imponible,
    sum(dp.cantidad * p.precio_proveedor) * 0.21 as iva,
    sum(dp.cantidad * p.precio_proveedor) * 1.21 as total_facturado
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by dp.codigo_producto;

-- 17. La misma información que en la pregunta anterior, pero agrupada por código de producto filtrada por los códigos que empiecen por OR.
select 
    dp.codigo_producto,
    sum(dp.cantidad * p.precio_proveedor) as base_imponible,
    sum(dp.cantidad * p.precio_proveedor) * 0.21 as iva,
    sum(dp.cantidad * p.precio_proveedor) * 1.21 as total_facturado
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
where dp.codigo_producto like 'or%'
group by dp.codigo_producto;

-- 18. Lista las ventas totales de los productos que hayan facturado más de 3000 euros. Se mostrará el nombre, unidades vendidas, total facturado y total facturado con impuestos (21% IVA).
select 
    p.nombre as nombre_producto,
    sum(dp.cantidad) as unidades_vendidas,
    sum(dp.cantidad * p.precio_proveedor) as total_facturado,
    sum(dp.cantidad * p.precio_proveedor) * 1.21 as total_facturado_con_iva
from detalle_pedido dp
join producto p on dp.codigo_producto = p.codigo_producto
group by p.nombre
having sum(dp.cantidad * p.precio_proveedor) > 3000;

-- 19. Muestre la suma total de todos los pagos que se realizaron para cada uno de los años que aparecen en la tabla pagos.
select 
    extract(year from fecha_pago) as anio, 
    sum(total) as total_pagos
from pago
group by extract(year from fecha_pago);



-- --------------------------------------------------------------
-- -    Subconsultas con operadores básicos de comparación      -
-- --------------------------------------------------------------

-- 1. Devuelve el nombre del cliente con mayor límite de crédito.
select nombre
from cliente
where limite_credito = (
    select max(limite_credito)
    from cliente
);

-- 2. Devuelve el nombre del producto que tenga el precio de venta más caro.
select nombre
from producto
where precio_venta = (
    select max(precio_venta)
    from producto
);

-- 3. Devuelve el nombre del producto del que se han vendido más unidades.
select nombre
from producto
where codigo_producto = (
    select codigo_producto
    from detalle_pedido
    group by codigo_producto
    order by sum(cantidad) desc
    limit 1
);

-- 4. Los clientes cuyo límite de crédito sea mayor que los pagos que haya realizado. (Sin utilizar INNER JOIN).
select nombre
from cliente
where limite_credito > (
    select coalesce(sum(monto), 0)
    from pago
    where codigo_cliente = cliente.codigo_cliente
);

-- 5. Devuelve el producto que más unidades tiene en stock.
select nombre
from producto
where unidades_stock = (
    select max(unidades_stock)
    from producto
);

-- 6. Devuelve el producto que menos unidades tiene en stock.
select nombre
from producto
where unidades_stock = (
    select min(unidades_stock)
    from producto
);

-- 7. Devuelve el nombre, los apellidos y el email de los empleados que están a cargo de Alberto Soria.
select nombre, apellido1, apellido2, email
from empleado
where codigo_empleado = (
    select codigo_jefe
    from empleado
    where nombre = 'Alberto' and apellido1 = 'Soria'
);


-- -------------------------------------
-- -    Subconsultas con ALL y ANY     -
-- -------------------------------------

-- 8. Devuelve el nombre del cliente con mayor límite de crédito.
select nombre
from cliente
where limite_credito = all (
    select limite_credito
    from cliente
);

-- 9. Devuelve el nombre del producto que tenga el precio de venta más caro.
select nombre
from producto
where precio_venta = all (
    select precio_venta
    from producto
);

-- 10. Devuelve el producto que menos unidades tiene en stock.
select nombre
from producto
where unidades_stock = any (
    select unidades_stock
    from producto
    order by unidades_stock
    limit 1
);

-- -------------------------------------
-- -    Subconsultas con IN y NOT IN   -
-- -------------------------------------

-- 11. Devuelve el nombre, apellido1 y cargo de los empleados que no representen a ningún cliente.
select nombre, apellido1, puesto
from empleado
where codigo_empleado not in (
    select codigo_empleado_rep_ventas
    from cliente
);

-- 12. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select nombre
from cliente
where codigo_cliente not in (
    select codigo_cliente
    from pago
);

-- 13. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
select nombre
from cliente
where codigo_cliente in (
    select codigo_cliente
    from pago
);

-- 14. Devuelve un listado de los productos que nunca han aparecido en un pedido.
select nombre
from producto
where codigo_producto not in (
    select codigo_producto
    from detalle_pedido
);

-- 15. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
select e.nombre, e.apellido1, e.apellido2, o.telefono
from empleado e
left join oficina o on e.codigo_oficina = o.codigo_oficina
where e.codigo_empleado not in (
    select codigo_empleado_rep_ventas
    from cliente
);

-- 16. Devuelve las oficinas donde no trabajan ninguno de los empleados que hayan sido los representantes de ventas de algún cliente que haya realizado la compra de algún producto de la gama Frutales.
select o.*
from oficina o
left join empleado e on o.codigo_oficina = e.codigo_oficina
left join cliente c on e.codigo_empleado = c.codigo_empleado_rep_ventas
left join pedido p on c.codigo_cliente = p.codigo_cliente
left join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
left join producto pr on dp.codigo_producto = pr.codigo_producto
left join gama_producto g on pr.gama = g.gama
where g.gama = 'Frutales'
  and e.codigo_empleado is null;

-- 17. Devuelve un listado con los clientes que han realizado algún pedido pero no han realizado ningún pago.
select c.*
from cliente c
where exists (
    select 1
    from pedido p
    where p.codigo_cliente = c.codigo_cliente
)
and not exists (
    select 1
    from pago pa
    where pa.codigo_cliente = c.codigo_cliente
);

-- ---------------------------------------------
-- -    Subconsultas con EXISTS y NOT EXISTS   -
-- ---------------------------------------------

-- 18. Devuelve un listado que muestre solamente los clientes que no han realizado ningún pago.
select c.*
from cliente c
where not exists (
    select 1
    from pago p
    where p.codigo_cliente = c.codigo_cliente
);

-- 19. Devuelve un listado que muestre solamente los clientes que sí han realizado algún pago.
select c.*
from cliente c
where exists (
    select 1
    from pago p
    where p.codigo_cliente = c.codigo_cliente
);

-- 20. Devuelve un listado de los productos que nunca han aparecido en un pedido.
select p.*
from producto p
where not exists (
    select 1
    from detalle_pedido dp
    where dp.codigo_producto = p.codigo_producto
);

-- 21. Devuelve un listado de los productos que han aparecido en un pedido alguna vez.
select p.*
from producto p
where exists (
    select 1
    from detalle_pedido dp
    where dp.codigo_producto = p.codigo_producto
);


-- ---------------------------
-- -    Consultas variadas   -
-- ---------------------------


-- 1. Devuelve el listado de clientes indicando el nombre del cliente y cuántos pedidos ha realizado. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido.
select c.nombre, count(pd.codigo_pedido) as numero_pedidos
from cliente c
left join pedido pd on c.codigo_cliente = pd.codigo_cliente
group by c.nombre;

-- 2. Devuelve un listado con los nombres de los clientes y el total pagado por cada uno de ellos. Tenga en cuenta que pueden existir clientes que no han realizado ningún pago.
select c.nombre, coalesce(sum(p.monto), 0) as total_pagado
from cliente c
left join pago p on c.codigo_cliente = p.codigo_cliente
group by c.nombre;

-- 3. Devuelve el nombre de los clientes que hayan hecho pedidos en 2008 ordenados alfabéticamente de menor a mayor.
select distinct c.nombre
from cliente c
join pedido p on c.codigo_cliente = p.codigo_cliente
where extract(year from p.fecha_pedido) = 2008
order by c.nombre;

-- 4. Devuelve el nombre del cliente, el nombre y primer apellido de su representante de ventas y el número de teléfono de la oficina del representante de ventas, de aquellos clientes que no hayan realizado ningún pago.
select c.nombre as nombre_cliente, e.nombre as nombre_rep_ventas, e.apellido1 as apellido1_rep_ventas, o.telefono as telefono_oficina
from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina
left join pago p on c.codigo_cliente = p.codigo_cliente
where p.codigo_cliente is null;

-- 5. Devuelve el listado de clientes donde aparezca el nombre del cliente, el nombre y primer apellido de su representante de ventas y la ciudad donde está su oficina.
select c.nombre as nombre_cliente, e.nombre as nombre_rep_ventas, e.apellido1 as apellido1_rep_ventas, o.ciudad as ciudad_oficina
from cliente c
join empleado e on c.codigo_empleado_rep_ventas = e.codigo_empleado
join oficina o on e.codigo_oficina = o.codigo_oficina;

-- 6. Devuelve el nombre, apellidos, puesto y teléfono de la oficina de aquellos empleados que no sean representante de ventas de ningún cliente.
select e.nombre, e.apellido1, e.apellido2, o.telefono
from empleado e
join oficina o on e.codigo_oficina = o.codigo_oficina
where e.codigo_empleado not in (
    select codigo_empleado_rep_ventas
    from cliente
);

-- 7. Devuelve un listado indicando todas las ciudades donde hay oficinas y el número de empleados que tiene.
select o.ciudad, count(e.codigo_empleado) as numero_empleados
from oficina o
left join empleado e on o.codigo_oficina = e.codigo_oficina
group by o.ciudad;














