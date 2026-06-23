# RedNorte - Guía de Defensa Oral (15 minutos)
**Evaluación Parcial 3: Arquitectura de Microservicios**

---

## ✅ REQUISITOS CUMPLIDOS

### 1. **Propuesta de Arquitectura de Microservicios**
- ✅ **Diagrama**: `entregables/arquitectura_microservicios.pdf`
- ✅ **4 Servicios independientes**:
  - **Eureka Server** (8761): Service Discovery & Registry
  - **API Gateway/BFF** (8080): Punto de entrada único, orquesta ms-pacientes y ms-citas
  - **ms-pacientes** (8081): CRUD de pacientes
  - **ms-citas** (8082): CRUD de citas médicas

### 2. **Integración Frontend + Backend**
- ✅ **Frontend**: React 19.2.6 + Vite 8.0.14
  - Ubicación: `rednorte-frontend/src/PacientesContainer.jsx`
  - UI responsiva con 2 columnas (Pacientes | Citas)
  - CRUD completo con modales y validaciones
  - Notificaciones (toast)
  - Búsqueda/filtrado en tiempo real
  
- ✅ **Backend**: Spring Boot 4.0.7 (Java 17)
  - 10 endpoints REST documentados
  - GET/POST/PUT/DELETE para pacientes y citas
  - Comunicación inter-servicios vía RestTemplate

### 3. **API REST para Persistencia de Datos**
- ✅ **10 Endpoints implementados**:
  ```
  GET    /api/pacientes              → Listar todos
  POST   /api/pacientes              → Crear
  PUT    /api/pacientes/{id}         → Actualizar
  DELETE /api/pacientes/{id}         → Eliminar
  GET    /api/citas                  → Listar todas
  POST   /api/citas                  → Crear
  PUT    /api/citas/{id}             → Actualizar
  DELETE /api/citas/{id}             → Eliminar
  GET    /api/pacientes/{id}/citas   → Citas por paciente
  GET    /api/citas/{id}/paciente    → Paciente de una cita
  ```

- ✅ **Documentación API**:
  - Postman: `entregables/api-rednorte.postman_collection.json`
  - OpenAPI 3.0.3: `entregables/openapi-rednorte.yaml`

### 4. **Persistencia de Datos**
- ✅ **Tecnología**: JPA/Hibernate
- ✅ **Base de Datos**:
  - Desarrollo: H2 (en memoria)
  - Producción: PostgreSQL (driver incluido)
- ✅ **Entidades**:
  - `Paciente`: id, nombre, email, teléfono, fecha_registro
  - `Cita`: id, fecha, hora, descripción, paciente_id
- ✅ **Documentación**: `entregables/descripcion_persistencia.pdf`

### 5. **Pruebas Unitarias con Cobertura**
- ✅ **Herramienta**: JaCoCo 0.8.12
- ✅ **Cobertura por módulo**:
  - **ms-pacientes**: 94.20% ✅
  - **ms-citas**: 94.63% ✅
  - **bff**: 63.27% ✅
- ✅ **Informe**: `entregables/informe_pruebas_unitarias.pdf`
- ✅ **Configuración**: Todos los `pom.xml` con plugin JaCoCo

### 6. **Versionado en GitHub**
- ✅ **6 Repositorios públicos**:
  1. `https://github.com/marcelodsmu/rednorte-eureka`
  2. `https://github.com/marcelodsmu/rednorte-bff`
  3. `https://github.com/marcelodsmu/rednorte-ms-pacientes`
  4. `https://github.com/marcelodsmu/rednorte-ms-citas`
  5. `https://github.com/marcelodsmu/rednorte-frontend`
  6. `https://github.com/marcelodsmu/proyecto-rednorte` (root + documentación)

### 7. **Encargo Completo**
- ✅ Diagramas de arquitectura
- ✅ Integración backend/frontend
- ✅ Persistencia documentada
- ✅ Pruebas unitarias respaldadas
- ✅ Postman collection
- ✅ OpenAPI specification
- ✅ Repositorios Github versionados

---

## 🎯 PREGUNTAS PROBABLES EN LA DEFENSA ORAL

### **Arquitectura & Diseño**
**P: ¿Por qué eligieron arquitectura de microservicios en lugar de monolítica?**
- R: Escalabilidad independiente, despliegue aislado, equipos pueden trabajar en paralelo, fallos aislados no derriban toda la app

**P: ¿Qué rol juega Eureka en esta arquitectura?**
- R: Service Discovery: permite que los servicios se registren y descubran dinámicamente sin hardcodear URLs

**P: ¿Por qué un API Gateway/BFF?**
- R: Punto de entrada único, orquestación, autenticación centralizada, reduce acoplamiento entre frontend y múltiples servicios

**P: ¿Cómo se comunican los microservicios entre sí?**
- R: vía HTTP REST con RestTemplate, de forma síncrona. El BFF coordina las llamadas.

---

### **Frontend**
**P: ¿Cómo se integra el frontend con los microservicios?**
- R: React consume el BFF en `http://localhost:8080`, que internamente orquesta ms-pacientes y ms-citas

**P: ¿Qué manejo de errores implementaron?**
- R: Toast notifications, try-catch en fetch, fallback en RestTemplate con SERVICE_UNAVAILABLE

---

### **Persistencia**
**P: ¿Cómo aseguran consistencia de datos entre servicios?**
- R: Cada servicio tiene su propia BD, se comunican vía REST. Pacientes y Citas están en servicios diferentes pero vinculados por ID.

**P: ¿Podrían cambiar de H2 a PostgreSQL?**
- R: Sí, es solo cambiar el profile y la URL de conexión, ya que usamos JPA/Hibernate (agnóstico de BD)

---

### **Pruebas**
**P: ¿Cómo lograron 94% de cobertura?**
- R: Creamos tests para todos los endpoints: casos exitosos + errores, mocking de RestTemplate para aislar servicios

**P: ¿Por qué el BFF tiene 63% y los otros 94%?**
- R: El BFF orquesta múltiples servicios, algunas rutas pasan por diferentes flujos; es más difícil cubrir todos los paths.

**P: ¿Qué framework de testing usaron?**
- R: JUnit 5 + Mockito para mocking, JaCoCo para generación de reportes de cobertura

---

### **GitHub & Versionado**
**P: ¿Por qué tienen 6 repositorios en lugar de uno?**
- R: Cada microservicio es independiente: puede deployarse, versionarse y desarrollarse por separado

**P: ¿Cómo coordinan cambios entre repos?**
- R: El proyecto-rednorte (root) documenta los links y versiones; en producción usaríamos CI/CD para sincronización

---

## 📝 HITOS CLAVE A MENCIONAR EN LA EXPOSICIÓN

### **Minuto 1-3: Intro & Contexto**
- Caso: Sistema de citas médicas (RedNorte)
- Objetivo: Arquitectura escalable con microservicios
- Equipo: [Mencionar integrantes]

### **Minuto 3-7: Arquitectura**
- Mostrar diagrama de microservicios
- Explicar cada servicio: qué hace, puerto, responsabilidad
- Flujo: Frontend → BFF → ms-pacientes/ms-citas

### **Minuto 7-10: Implementación**
- Frontend: React CRUD con búsqueda
- Backend: Spring Boot, endpoints REST
- BD: JPA/Hibernate con H2/PostgreSQL

### **Minuto 10-13: Pruebas & Calidad**
- Cobertura JaCoCo: 94%+ en 2 módulos
- Estrategia de testing: unitarias + mocking
- Herramientas: JUnit 5, Mockito

### **Minuto 13-15: GitHub & Entrega**
- 6 repos públicos versionados
- Entregables: Postman + OpenAPI + Diagramas
- Links: [Compartir URLs]

---

## 🚀 DEMO EN VIVO (OPCIONAL)

Si el profesor lo pide, puedes ejecutar:

```bash
# Terminal 1: Start Eureka
cd rednorte-eureka
mvn spring-boot:run

# Terminal 2: Start ms-pacientes
cd rednorte-ms-pacientes
mvn spring-boot:run

# Terminal 3: Start ms-citas
cd rednorte-ms-citas
mvn spring-boot:run

# Terminal 4: Start BFF
cd rednorte-bff
mvn spring-boot:run

# Terminal 5: Start Frontend
cd rednorte-frontend
npm run dev

# Luego: Abrir http://localhost:5173 y hacer CRUD en vivo
```

---

## 📊 ESTADÍSTICAS FINALES

| Métrica | Valor |
|---------|-------|
| **Servicios** | 4 (+ Eureka) |
| **Endpoints REST** | 10 |
| **Cobertura Promedio** | 83.7% |
| **Líneas de código (Backend)** | ~2,500 |
| **Componentes React** | 5+ |
| **Repositorios GitHub** | 6 |
| **Documentación** | 9 entregables |

---

## 💡 PUNTOS FUERTES A RESALTAR

✅ Arquitectura profesional (microservicios reales)
✅ Cobertura de pruebas excepcional (94%+ en 2 módulos)
✅ Frontend + Backend totalmente integrados
✅ Documentación completa (Postman + OpenAPI)
✅ Versionado correcto en GitHub
✅ Patrón API Gateway implementado
✅ Service Discovery (Eureka) funcional
✅ JPA/Hibernate con soporte para múltiples BD

---

**¡Listos para la presentación! 🎯**
