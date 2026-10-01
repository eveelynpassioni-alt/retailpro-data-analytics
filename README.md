# RetailPro - Data Analytics

Proyecto desarrollado durante el curso de Data Analytics de Coderhouse.

## Objetivo del proyecto

RetailPro es una empresa distribuidora de tecnología. El objetivo del proyecto es organizar sus datos comerciales en una base de datos relacional y utilizar SQL para obtener información que ayude a analizar las ventas, los productos y los clientes.

A lo largo de los distintos módulos se va construyendo el proyecto de forma progresiva, desde la creación de la base de datos hasta las consultas de negocio.

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

## Cómo ejecutar los archivos

Los scripts fueron trabajados en Microsoft SQL Server Management Studio (SSMS).

Para ejecutarlos:

1. Abrir SQL Server Management Studio.
2. Conectarse al servidor.
3. Ejecutar primero `ventas_tech_db.sql` para crear la base de datos y cargar la información.
4. Una vez creada `Ventas_Tech_DB`, ejecutar `m4_consultas_negocio.sql` para obtener las métricas y consultas de negocio.

## Herramientas utilizadas

- SQL Server
- SQL Server Management Studio (SSMS)
- GitHub
