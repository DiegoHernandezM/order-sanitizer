# Order Sanitizer

Herramienta para el análisis, saneamiento y generación de scripts de actualización de pedidos para los marketplaces **Sanborns** y **Sears**.

## Tecnologías

- PHP 8.3
- Laravel 12
- MariaDB
- Docker & Docker Compose

---

# Requisitos

Antes de comenzar asegúrate de tener instalado:

- Docker
- Docker Compose
- Git

---

# Clonar el proyecto

```bash
git clone <repositorio>
cd order-sanitizer
```

---

# Configuración

## 1. Crear archivo de entorno

Copiar el archivo de ejemplo.

```bash
cp .env.example .env
```

Configurar las credenciales correspondientes.

### Base de datos local

```env
DB_HOST=mariadb_db
DB_PORT=3306
DB_DATABASE=saneador
DB_USERNAME=root
DB_PASSWORD=tu_password
```

### Bases de datos locales

```env
DB_SANBORNS_DATABASE=sanborns_store
DB_SEARS_DATABASE=sears_store
```

### Bases de datos Productivas

Completar las credenciales de acceso a las bases productivas.

```env
DB_PROD_SANBORNS_HOST=
DB_PROD_SANBORNS_PORT=3306
DB_PROD_SANBORNS_DATABASE=tienda
DB_PROD_SANBORNS_USERNAME=
DB_PROD_SANBORNS_PASSWORD=

DB_PROD_SEARS_HOST=
DB_PROD_SEARS_PORT=3308
DB_PROD_SEARS_DATABASE=tienda
DB_PROD_SEARS_USERNAME=
DB_PROD_SEARS_PASSWORD=
```

---

## 2. Levantar Docker

```bash
docker compose up -d --build
```

---

## 3. Instalar dependencias

```bash
docker exec -it order_sanitizer_app composer install
```

---

## 4. Generar APP_KEY

```bash
docker exec -it order_sanitizer_app php artisan key:generate
```

---

# Configuración de Base de Datos

El proyecto utiliza tres bases de datos locales:

| Base | Descripción |
|-------|-------------|
| saneador | Base principal de la aplicación |
| sanborns_store | Información local de Sanborns |
| sears_store | Información local de Sears |

## Crear las bases

```sql
CREATE DATABASE saneador;
CREATE DATABASE sanborns_store;
CREATE DATABASE sears_store;
```

---

## Restaurar dumps

Dentro del directorio raíz del proyecto se encuentran los respaldos:

```
    sanborns_store.sql
    sears_store.sql
```

Importar cada uno en su base correspondiente.

Ejemplo:

```bash
docker exec -i mariadb_db mysql -u root -p sanborns_store < database/dumps/sanborns_store.sql
```

y

```bash
docker exec -i mariadb_db mysql -u root -p sears_store < database/dumps/sears_store.sql
```

---

## Ejecutar migraciones

La base principal (**saneador**) utiliza migraciones de Laravel.

```bash
docker exec -it order_sanitizer_app php artisan migrate
```

---

# Limpiar cachés

Si se modifica el archivo `.env`

```bash
docker exec -it order_sanitizer_app php artisan optimize:clear
```

---

# Acceso

La aplicación estará disponible en

```
http://localhost
```

---

# Estructura de conexiones

La aplicación trabaja con cinco conexiones de base de datos.

| Conexión | Uso |
|----------|-----|
| mysql | Base principal del saneador |
| sanborns | Base local Sanborns |
| sears | Base local Sears |
| prod | Base productiva Sanborns |
| prod-se | Base productiva Sears |

---

# Flujo de trabajo

El flujo esperado es el siguiente:

1. Importar pedidos desde producción.
2. Analizar inconsistencias.
3. Generar script SQL.
4. Ejecutar el script en la base correspondiente.

---

# Comandos útiles

Levantar contenedores

```bash
docker compose up -d
```

Detener contenedores

```bash
docker compose down
```

Ver logs

```bash
docker compose logs -f
```

Entrar al contenedor

```bash
docker exec -it order_sanitizer_app bash
```

Limpiar caché

```bash
php artisan optimize:clear
```

Migraciones

```bash
php artisan migrate
```

---
