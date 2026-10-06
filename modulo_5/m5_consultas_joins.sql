-- ============================================================
-- MÓDULO 5 - PRE-ENTREGA
-- Consultas con JOIN y UNION ALL
-- Proyecto RetailPro
-- Base: Ventas_Tech_DB
-- Motor utilizado: SQL Server (SSMS)
-- ============================================================

USE Ventas_Tech_DB;
GO


-- ============================================================
-- CONSULTA 1 - VISTA BASE DEL PROYECTO (INNER JOIN)
-- Se cruzan ventas, clientes, productos y categorías para
-- obtener una vista más completa de cada operación.
-- ============================================================

SELECT
    v.fecha_venta,
    v.id_cliente,
    c.nombre AS cliente,
    c.ciudad,
    v.id_producto,
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    v.cantidad,
    v.precio_unitario,
    v.cantidad * v.precio_unitario AS total_venta
FROM ventas AS v
INNER JOIN clientes AS c
    ON v.id_cliente = c.id_cliente
INNER JOIN productos AS p
    ON v.id_producto = p.id_producto
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta, v.id_venta;
GO


-- ============================================================
-- CONSULTA 2 - CLIENTES SIN VENTAS (LEFT JOIN)
-- Se buscan clientes registrados que no tengan ninguna venta.
-- ============================================================

SELECT
    c.nombre,
    c.email,
    c.fecha_registro
FROM clientes AS c
LEFT JOIN ventas AS v
    ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL
ORDER BY c.nombre;
GO


-- ============================================================
-- CONSULTA 3 - PRODUCTOS SIN VENTAS (LEFT JOIN)
-- Se buscan productos del catálogo que no tengan ventas.
-- ============================================================

SELECT
    p.nombre_producto,
    cat.nombre_categoria AS categoria,
    p.precio
FROM productos AS p
INNER JOIN categorias AS cat
    ON p.id_categoria = cat.id_categoria
LEFT JOIN ventas AS v
    ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL
ORDER BY p.nombre_producto;
GO


-- ============================================================
-- CONSULTA 4 - CONSOLIDADO POR CANAL / ORIGEN (UNION ALL)
-- La base no tiene una columna "canal", por eso se crea como
-- texto fijo en cada SELECT.
-- Para este ejercicio se separan las ventas en dos períodos.
-- ============================================================

SELECT
    canal,
    SUM(total_venta) AS total_canal
FROM (
    SELECT
        'Ventas del 05 al 10 de marzo' AS canal,
        cantidad * precio_unitario AS total_venta
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-05' AND '2024-03-10'

    UNION ALL

    SELECT
        'Ventas del 11 al 15 de marzo' AS canal,
        cantidad * precio_unitario AS total_venta
    FROM ventas
    WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-15'
) AS ventas_por_canal
GROUP BY canal
ORDER BY total_canal DESC;
GO
