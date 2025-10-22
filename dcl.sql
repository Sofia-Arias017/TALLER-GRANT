--USUARIO ADMIN
CREATE USER 'admin'@'%' IDENTIFIED BY '4dmin123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
ALTER USER 'admin'@'%' WITH MAX_QUERIES_PER_HOUR 50;


--USUARIO CAJERO
CREATE USER 'cajero'@'%' IDENTIFIED BY 'c4jer@123';
GRANT SELECT, INSERT, UPDATE ON ecommerce_zapatos.pedido TO 'cajero'@'%';
GRANT SELECT, INSERT, UPDATE ON ecommerce_zapatos.detalle_pedido TO 'cajero'@'%';
GRANT SELECT, INSERT, UPDATE ON ecommerce_zapatos.factura TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.cliente TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.producto TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.presentacion TO 'cajero'@'%';
GRANT SELECT ON ecommerce_zapatos.combo TO 'cajero'@'%';
ALTER USER 'cajero'@'%' WITH MAX_QUERIES_PER_HOUR 50;


--USUARIO ANALISTA
CREATE USER 'analista'@'%' IDENTIFIED BY '4n4list4123';
GRANT SELECT, SHOW VIEW, SHOW TABLES ON ecommerce_zapatos.* TO 'analista'@'%';
GRANT EXECUTE ON FUNCTION ecommerce_zapatos.* TO 'analista'@'%';
ALTER USER 'analista'@'%' WITH MAX_QUERIES_PER_HOUR 50;


--USUARIO DESARROLLADOR
CREATE USER 'desarrollador'@'%' IDENTIFIED BY 'd3v123';
GRANT CREATE TEMPORARY TABLES, LOCK TABLES, ALTER, DROP, INDEX ON ecommerce_zapatos.* TO 'desarrollador'@'%';
ALTER USER 'desarrollador'@'%' WITH MAX_QUERIES_PER_HOUR 0;


--Limitar sus consultas a un `MAX_QUERIES_PER_HOUR` de 50 exceptuando al usuario `Desarrollador`.
ALTER USER 'admin'@'%' WITH MAX_QUERIES_PER_HOUR 50;
ALTER USER 'cajero'@'%' WITH MAX_QUERIES_PER_HOUR 50;
ALTER USER 'analista'@'%' WITH MAX_QUERIES_PER_HOUR 50;
ALTER USER 'desarrollador'@'%' WITH MAX_QUERIES_PER_HOUR 0;


--Asignar persmisos al usuario en donde permita: Ver sus pedidos (usando procedimiento)
DELIMITER //
CREATE PROCEDURE VerMisPedidos(IN p_id_cliente INT)
BEGIN
  SELECT * FROM pedido WHERE id_cliente = p_id_cliente;
END //
DELIMITER ;

GRANT EXECUTE ON PROCEDURE ecommerce_zapatos.VerMisPedidos TO 'cajero'@'%', 'analista'@'%';


--Asignar persmisos al usuario en donde permita: Calcular total mensual (usando funciones)
DELIMITER //
CREATE FUNCTION CalcularTotalMensual(p_mes INT, p_anio INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    DECLARE total_mes DECIMAL(10,2);
    SELECT SUM(total) INTO total_mes
    FROM factura
    WHERE MONTH(fecha) = p_mes AND YEAR(fecha) = p_anio;
    RETURN IFNULL(total_mes, 0);
END //
DELIMITER ;

GRANT EXECUTE ON FUNCTION ecommerce_zapatos.CalcularTotalMensual TO 'analista'@'%', 'cajero'@'%';

-- Aplicar los cambios
FLUSH PRIVILEGES;
