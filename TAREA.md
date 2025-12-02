# TRABAJO PRÁCTICO: User, Product y Order Service

## Arquitectura de Microservicios

---

## OBJETIVO GENERAL

Desarrollar una arquitectura de microservicios completa que incluya pruebas automatizadas, configuración de entornos, integración continua y despliegue con contenedores.

---

## REQUISITOS

### 1. Pruebas Automatizadas
- Crear pruebas **unitarias** para los 3 microservicios
- Crear pruebas de **integración** para los 3 microservicios

### 2. Configuración de Perfiles
Cada microservicio debe tener los siguientes perfiles de entorno:
- **local** → Base de datos H2 (en memoria)
- **dev** → Base de datos PostgreSQL

### 3. Integración Continua
- Cada microservicio debe tener su propio **Pipeline en Jenkins**

### 4. Dockerización
Dockerizar los siguientes microservicios:
- Micro **User Service**
- Micro **Product Service**
- Micro **Order Service**

### 5. Publicación en Docker Hub
- Crear y publicar cada microservicio en **Docker Hub**

### 6. Orquestación
- Crear un **Docker Compose** para orquestar:
    - Los tres microservicios
    - Una base de datos PostgreSQL para cada microservicio


## ENTREGABLES

1. ✅ Código fuente de los 3 microservicios
2. ✅ Pruebas unitarias y de integración
3. ✅ Archivos de configuración de perfiles (`application-local.yml`, `application-dev.yml`)
4. ✅ Jenkinsfile para cada microservicio
5. ✅ Dockerfile para cada microservicio
6. ✅ `docker-compose.yml`
7. ✅ README.md documentando el proyecto
8. ✅ Enlaces a los repositorios de Docker Hub

---

## CRITERIOS DE EVALUACIÓN

- Correcta implementación de pruebas unitarias y de integración
- Funcionamiento de los perfiles local y dev
- Pipeline de Jenkins ejecutándose correctamente
- Imágenes Docker construidas y publicadas en Docker Hub
- Docker Compose orquestando todos los servicios
