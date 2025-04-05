# Usa una imagen oficial de PostgreSQL como base
FROM postgres:15

# Copia los archivos necesarios para la base de datos
COPY ./sql/ddl.sql /docker-entrypoint-initdb.d/

