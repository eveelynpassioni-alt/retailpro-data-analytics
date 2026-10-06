## Estructura del repositorio

### Módulo 3 - Creación de la base de datos

Carpeta: `modulo_3`

Archivo: `ventas_tech_db.sql`

En este módulo se creó la base de datos `Ventas_Tech_DB` y las tablas necesarias para trabajar con la información del proyecto.

El script incluye:

- creación de la base de datos;
- creación de las tablas `categorias`, `clientes`, `productos` y `ventas`;
- definición de claves primarias y relaciones entre las tablas;
- carga de los registros iniciales;
- consultas de validación para comprobar que los datos fueron cargados correctamente.

### Módulo 4 - Consultas de negocio

Carpeta: `modulo_4`

Archivo: `m4_consultas_negocio.sql`

En este módulo se comenzaron a utilizar consultas SQL para responder preguntas de negocio a partir de la información almacenada en la tabla de ventas.

Se trabajó sobre:

- total facturado por mes;
- cantidad de pedidos;
- ticket promedio;
- ranking de productos según facturación;
- clientes recurrentes;
- comparación de las ventas mensuales con el promedio general.

Al final del archivo también se incluyen algunos hallazgos obtenidos a partir de los resultados.

### Módulo 5 - Consultas con JOIN y UNION ALL

Carpeta: `modulo_5`

Archivo: `m5_consultas_joins.sql`

En este módulo se trabajó con relaciones entre tablas para obtener información más completa a partir de la base de datos.

Se utilizaron consultas con:

- `INNER JOIN` para combinar ventas con clientes, productos y categorías;
- `LEFT JOIN` para identificar clientes sin ventas;
- `LEFT JOIN` para identificar productos sin ventas;
- `UNION ALL` para consolidar resultados de dos grupos de ventas.

Estas consultas permiten ampliar el análisis incorporando información descriptiva y combinando datos provenientes de distintas tablas.

## Cómo ejecutar los archivos

Los scripts fueron trabajados en Microsoft SQL Server Management Studio (SSMS).

Para ejecutarlos:

1. Abrir SQL Server Management Studio.
2. Conectarse al servidor.
3. Ejecutar primero `ventas_tech_db.sql` para crear la base de datos y cargar la información.
4. Una vez creada `Ventas_Tech_DB`, ejecutar `m4_consultas_negocio.sql` para obtener las métricas y consultas de negocio.
5. Ejecutar `m5_consultas_joins.sql` para obtener las consultas con JOIN y UNION ALL.

## Herramientas utilizadas

- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub
