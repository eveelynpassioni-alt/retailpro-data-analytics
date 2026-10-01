-- ============================================================
-- MÓDULO 4 - PRE-ENTREGA
-- Consultas SQL de negocio
-- Base: Ventas_Tech_DB
-- Motor utilizado: SQL Server (SSMS)
-- ============================================================

USE Ventas_Tech_DB;
GO

-- Nota:
-- La consigna menciona EXTRACT(MONTH FROM fecha_venta) y LIMIT.
-- Como este proyecto se está trabajando en SQL Server, se utiliza
-- MONTH(fecha_venta) para obtener el mes y TOP 5 para limitar filas.


-- ============================================================
-- CONSULTA 1 - RESUMEN EJECUTIVO MENSUAL
-- Total facturado, cantidad de pedidos y ticket promedio por mes.
-- ============================================================

SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    COUNT(DISTINCT id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) / COUNT(DISTINCT id_venta) AS ticket_promedio
FROM ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;
GO


-- ============================================================
-- CONSULTA 2 - RANKING DE PRODUCTOS
-- Top 5 de productos según el total facturado.
-- ============================================================

SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM ventas
GROUP BY id_producto
ORDER BY total_generado DESC;
GO


-- ============================================================
-- CONSULTA 3 - CLIENTES RECURRENTES
-- Clientes con más de un pedido.
-- ============================================================

SELECT
    id_cliente,
    COUNT(DISTINCT id_venta) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM ventas
GROUP BY id_cliente
HAVING COUNT(DISTINCT id_venta) > 1
ORDER BY total_gastado DESC;
GO


-- ============================================================
-- CONSULTA 4 - MESES POR ENCIMA / POR DEBAJO DEL PROMEDIO
-- Se calcula primero el total de cada mes y luego se compara
-- contra el promedio general de los totales mensuales.
-- ============================================================

WITH ventas_por_mes AS (
    SELECT
        MONTH(fecha_venta) AS mes,
        SUM(cantidad * precio_unitario) AS total_facturado
    FROM ventas
    GROUP BY MONTH(fecha_venta)
),
promedio_mensual AS (
    SELECT
        AVG(total_facturado) AS promedio_general
    FROM ventas_por_mes
)
SELECT
    v.mes,
    v.total_facturado,
    p.promedio_general AS promedio_mensual_general,
    CASE
        WHEN v.total_facturado >= p.promedio_general THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM ventas_por_mes AS v
CROSS JOIN promedio_mensual AS p
ORDER BY v.mes;
GO


-- ============================================================
-- HALLAZGOS
-- ============================================================
-- 1. El mes 3 registra una facturación total de $6.444,00,
--    con 10 pedidos y un ticket promedio de $644,40.
--
-- 2. El producto con id_producto = 1 es el que más factura:
--    genera $3.600,00, aproximadamente el 55,9% del total.
--
-- 3. Los cinco clientes de la base realizaron más de un pedido.
--    El cliente 1 es el de mayor gasto total, con $2.640,00.
-- ============================================================
