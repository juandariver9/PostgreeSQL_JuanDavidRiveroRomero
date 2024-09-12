-- 1. Oficinas en España
create view vista_oficinas_espana as
select ciudad, telefono
from oficina
where pais = 'España';

-- 2. Oficinas por región en EEUU
create view vista_oficinas_eeuu as
select ciudad, region, telefono
from oficina
where pais = 'EEUU';

-- 3. Empleados por oficina
create view vista_empleados_por_oficina as
select o.ciudad, count(e.id_empleado) as numero_empleados
from empleado e
join oficina o on e.id_oficina = o.id_oficina
group by o.ciudad;

-- 4. Detalles de pedidos por cliente
create view vista_pedidos_cliente as
select c.nombre_cliente, p.fecha_pedido, sum(dp.precio_unidad * dp.cantidad) as total
from pedido p
join cliente c on p.codigo_cliente = c.codigo_cliente
join detalle_pedido dp on p.codigo_pedido = dp.codigo_pedido
group by c.nombre_cliente, p.fecha_pedido;


-- 5. Productos más vendidos
create view vista_productos_mas_vendidos as
select dp.codigo_producto, sum(dp.cantidad) as total_vendido
from detalle_pedido dp
group by dp.codigo_producto
group by total_vendido desc;


-- 6. Pagos realizados por cliente
create view vista_pagos_cliente as
select c.nombre_cliente, SUM(p.total) as total_pagado
from pago p
join cliente c on p.codigo_cliente = c.codigo_cliente
group by c.nombre_cliente;


-- 7. Clientes sin pedidos recientes (últimos 6 meses)
create view vista_clientes_sin_pedidos_recientes as
select c.nombre_cliente, max(p.fecha_pedido) as ultimo_pedido
from cliente c
left join pedido p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente
having max(p.fecha_pedido) < now() - INTERVAL '6 months' or max(p.fecha_pedido) is null;

-- 8. Productos que tienen menos de 10 unidades en stock
create view vista_productos_bajo_stock as
select p.codigo_producto, p.nombre, p.cantidad_en_stock
from producto p
where p.cantidad_en_stock < 10;

-- 9. Empleados que no tienen jefe asignado
create view vista_empleados_sin_jefe as
select e.codigo_empleado, e.nombre, e.apellido1, e.apellido2
from empleado e
left join empleado j on e.codigo_jefe = j.codigo_empleado
where j.codigo_empleado is null;

-- 10. Clientes que han hecho más de 5 pedidos
create view vista_clientes_mas_de_5_pedidos as
select c.nombre_cliente, count(p.codigo_pedido) as numero_pedidos
from cliente c
join pedido p on c.codigo_cliente = p.codigo_cliente
group by c.nombre_cliente
having count(p.codigo_pedido) > 5;
