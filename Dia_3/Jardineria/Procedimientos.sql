-- 1. Procedimiento para agregar una nueva oficina
create or replace procedure agregar_oficina (
    p_ciudad varchar(50), 
    p_pais varchar(50), 
    p_region varchar(50), 
    p_codigo_postal varchar(10), 
    p_telefono varchar(20), 
    p_linea_direccion1 varchar(100), 
    p_linea_direccion2 varchar(100)
)
language plpgsql
as $$
begin
    insert into oficina (ciudad, pais, region, codigo_postal, telefono, linea_direccion1, linea_direccion2)
    values (p_ciudad, p_pais, p_region, p_codigo_postal, p_telefono, p_linea_direccion1, p_linea_direccion2);
end;
$$;



-- 2. procedimiento para actualizar el teléfono de una oficina
create or replace procedure actualizar_telefono_oficina (
    p_codigo_oficina int, 
    p_nuevo_telefono varchar(20)
)
language plpgsql
as $$
begin
    update oficina
    set telefono = p_nuevo_telefono
    where codigo_oficina = p_codigo_oficina;
end;
$$;

-- 3. procedimiento para eliminar una oficina por su código
create or replace procedure eliminar_oficina (
    p_codigo_oficina int
)
language plpgsql
as $$
begin
    delete from oficina
    where codigo_oficina = p_codigo_oficina;
end;
$$;

-- 4. procedimiento para buscar clientes por país
create or replace procedure buscar_clientes_por_pais (
    p_pais varchar(50)
)
language plpgsql
as $$
begin
    select * from cliente
    where pais = p_pais;
end;
$$;



-- 5. Procedimiento para crear un nuevo cliente
create or replace procedure crear_cliente (
    p_nombre_cliente varchar(100), 
    p_telefono varchar(20), 
    p_direccion varchar(150), 
    p_pais varchar(50)
)
language plpgsql
as $$
begin
    insert into cliente (nombre_cliente, telefono, linea_direccion1, pais)
    values (p_nombre_cliente, p_telefono, p_direccion, p_pais);
end;
$$;

-- 6. Procedimiento para actualizar la dirección de un cliente
create or replace procedure actualizar_direccion_cliente (
    p_id_cliente int, 
    p_nueva_direccion varchar(150)
)
language plpgsql
as $$
begin
    update cliente
    set linea_direccion1 = p_nueva_direccion
    where codigo_cliente = p_id_cliente;
end;
$$;

-- 7. Procedimiento para eliminar un cliente
create or replace procedure eliminar_cliente (
    p_id_cliente int
)
language plpgsql
as $$
begin
    delete from cliente
    where codigo_cliente = p_id_cliente;
end;
$$;

-- 8. Procedimiento para buscar productos por nombre
create or replace procedure buscar_producto_por_nombre (
    p_nombre_producto varchar(100)
)
language plpgsql
as $$
begin
    select * from producto
    where nombre like concat('%', p_nombre_producto, '%');
end;
$$;

-- 9. Procedimiento para crear un nuevo producto
create or replace procedure crear_producto (
    p_nombre_producto varchar(100), 
    p_precio decimal(10,2), 
    p_gama varchar(50), 
    p_existencia int
)
language plpgsql
as $$
begin
    insert into producto (nombre, precio_venta, gama, cantidad_en_stock)
    values (p_nombre_producto, p_precio, p_gama, p_existencia);
end;
$$;

-- 10. Procedimiento para actualizar el precio de un producto
create or replace procedure actualizar_precio_producto (
    p_id_producto varchar(15), 
    p_nuevo_precio decimal(10,2)
)
language plpgsql
as $$
begin
    update producto
    set precio_venta = p_nuevo_precio
    where codigo_producto = p_id_producto;
end;
$$;

