# TARJETAS DE REFERENCIA RÁPIDA - VOICE-OVER
## Use mientras graban para no olvidar puntos clave

---

## 🎙️ ALEJANDRO - Minutos 0:00 a 2:30

### Tarjeta 1: Introducción (0:00-0:15)
```
DICE:
"Hola, somos el equipo de RedNorte, una plataforma de salud 
para gestión de pacientes y citas médicas. Este video presenta 
nuestro sistema completo, su arquitectura y funcionalidad."

PUNTOS CLAVE:
✓ Saludar
✓ Nombre del proyecto: RedNorte
✓ Propósito: Gestión de pacientes y citas
✓ Qué enseñaremos: Sistema completo + arquitectura
```

### Tarjeta 2: Arquitectura (0:15-0:45)
```
DICE:
"Nuestro sistema está basado en arquitectura de microservicios 
con cuatro componentes principales. Primero, frontend React con Vite 
para la interfaz. Segundo, un API Gateway que actúa como Backend 
for Frontend para orquestar peticiones."

PUNTOS CLAVE:
✓ Microservicios (menciona: 4 componentes)
✓ Frontend: React + Vite
✓ BFF/Gateway: orquestación
✓ Mantén ritmo pausado
```

### Tarjeta 3: Microservicios (0:45-1:30)
```
DICE:
"Tercero, dos microservicios: uno para pacientes (ms-pacientes) 
y otro para citas (ms-citas). Finalmente, servidor Eureka para 
registro de servicios. Todo en Java 17 con Spring Boot 4.0.7."

PUNTOS CLAVE:
✓ ms-pacientes (puerto 8081)
✓ ms-citas (puerto 8082)
✓ Eureka (descubrimiento)
✓ Java 17 + Spring Boot 4.0.7
```

### Tarjeta 4: Flujo de Datos (1:30-2:00)
```
DICE:
"El flujo es simple: usuario → frontend → BFF (8080) 
→ microservicios (8081, 8082). Datos persistidos en H2 
en memoria para desarrollo."

PUNTOS CLAVE:
✓ Usuario interactúa con frontend
✓ Peticiones van a BFF puerto 8080
✓ BFF orquesta a microservicios
✓ H2 para desarrollo
```

### Tarjeta 5: Stack Tecnologías (2:00-2:30)
```
DICE:
"Frontend React 19.2.6 + Vite. Backend Spring Boot + 
Spring Data JPA + Hibernate. Tests con JUnit 5 + Mockito. 
Cobertura con JaCoCo. Todo versionado en Git/GitHub."

PUNTOS CLAVE:
✓ Frontend: React 19.2.6, Vite 8.0.14
✓ Backend: Spring Boot, JPA, Hibernate
✓ Testing: JUnit 5, Mockito
✓ Coverage: JaCoCo
✓ Versionado: Git + GitHub
```

---

## 🎙️ MANUEL - Minutos 2:30 a 5:30

### Tarjeta 1: Startup (2:30-2:45)
```
DICE:
"Ahora vamos a ver la interfaz de usuario. 
Nuestra aplicación es una SPA desarrollada en React."

PUNTOS CLAVE:
✓ SPA: Single Page Application
✓ React (muestra pantalla)
✓ Tono: Emocionado
```

### Tarjeta 2: UI Pacientes (2:45-3:30)
```
DICE:
"Izquierda: lista de pacientes con ID, nombre, email, 
teléfono. Botones editar/eliminar por fila. Buscador 
en tiempo real arriba."

PUNTOS CLAVE:
✓ Dos columnas (pacientes | citas)
✓ Tabla con datos
✓ Botones de acción
✓ Buscador en tiempo real
```

### Tarjeta 3: Crear Paciente (3:30-4:00)
```
DICE:
"Click 'Nuevo Paciente' abre modal con formulario. 
Campos: nombre, email, teléfono, síntomas. 
Click 'Guardar' persiste en base de datos."

PUNTOS CLAVE:
✓ Botón "Nuevo Paciente"
✓ Modal con formulario
✓ Campos: nombre, email, teléfono, síntomas
✓ Guardar = persistencia
```

### Tarjeta 4: Editar & Eliminar (4:00-4:30)
```
DICE:
"Botón editar abre modal con datos precargados. 
Modificas y guardas cambios. Botón eliminar borra 
tras confirmación."

PUNTOS CLAVE:
✓ Editar: modal con datos previos
✓ Guardar cambios
✓ Eliminar: con confirmación
```

### Tarjeta 5: Vista Citas (4:30-5:15)
```
DICE:
"Derecha: gestión de citas similar a pacientes. 
Lista con fecha, hora, especialidad, estado. 
Mismo CRUD + buscador."

PUNTOS CLAVE:
✓ Columna derecha: citas
✓ Campos: fecha, hora, especialidad, estado
✓ Mismo sistema de CRUD
✓ Buscador funciona igual
```

### Tarjeta 6: Notificaciones (5:15-5:30)
```
DICE:
"Al guardar, aparece notificación verde (éxito). 
Si hay error, notificación roja. Feedback visual claro 
para el usuario."

PUNTOS CLAVE:
✓ Toast notifications
✓ Verde: éxito
✓ Rojo: error
✓ UX clara
```

---

## 🎙️ ANDRÉS - Minutos 5:30 a 10:30

### Tarjeta 1: APIs REST (5:30-6:00)
```
DICE:
"Ahora, los endpoints REST. Tenemos 10 endpoints en dos recursos: 
pacientes y citas. Cada uno sigue RESTful: GET (lectura), 
POST (creación), PUT (actualización), DELETE (eliminación)."

PUNTOS CLAVE:
✓ 10 endpoints totales
✓ 2 recursos: pacientes y citas
✓ RESTful: GET, POST, PUT, DELETE
✓ Estándar HTTP
```

### Tarjeta 2: GET Pacientes (6:00-6:45)
```
DICE:
"GET /api/pacientes devuelve array JSON con todos los pacientes. 
Cada registro tiene: id, nombre, email, teléfono, síntomas. 
Respuesta 200 OK."

PUNTOS CLAVE:
✓ GET /api/pacientes
✓ Respuesta: JSON array
✓ Campos: id, nombre, email, teléfono, síntomas
✓ Status: 200 OK
```

### Tarjeta 3: POST Crear (6:45-7:15)
```
DICE:
"POST /api/pacientes crea paciente. Enviamos JSON 
en body con datos. Servidor devuelve 201 Created 
con el paciente incluyendo id asignado."

PUNTOS CLAVE:
✓ POST /api/pacientes
✓ Body: JSON con datos
✓ Response: 201 CREATED
✓ Incluye: id asignado por BD
```

### Tarjeta 4: PUT Actualizar (7:15-7:45)
```
DICE:
"PUT /api/pacientes/{id} actualiza paciente. 
Especificamos id en URL, datos nuevos en body. 
Respuesta 200 OK con datos actualizados."

PUNTOS CLAVE:
✓ PUT /api/pacientes/{id}
✓ URL: id del paciente
✓ Body: datos nuevos
✓ Response: 200 OK
```

### Tarjeta 5: DELETE Eliminar (7:45-8:15)
```
DICE:
"DELETE /api/pacientes/{id} elimina paciente. 
Solo especificamos id en URL, sin body. 
Respuesta 204 No Content."

PUNTOS CLAVE:
✓ DELETE /api/pacientes/{id}
✓ URL: id del paciente
✓ Sin body
✓ Response: 204 NO_CONTENT
```

### Tarjeta 6: Endpoints Citas (8:15-8:45)
```
DICE:
"Mismos cuatro endpoints para citas: GET, POST, PUT, DELETE. 
Estructura idéntica pero con campos de cita: fecha, hora, 
especialidad, estado, referencia a paciente."

PUNTOS CLAVE:
✓ GET /api/citas
✓ POST /api/citas
✓ PUT /api/citas/{id}
✓ DELETE /api/citas/{id}
✓ Campos: fecha, hora, especialidad, estado
```

### Tarjeta 7: Endpoints Relacionales (8:45-9:30)
```
DICE:
"Dos endpoints especiales para relaciones. 
GET /api/pacientes/{id}/citas devuelve citas del paciente. 
GET /api/citas/{id}/paciente devuelve paciente de la cita. 
Consultas cruzadas entre microservicios."

PUNTOS CLAVE:
✓ GET /api/pacientes/{id}/citas
✓ GET /api/citas/{id}/paciente
✓ Relaciones entre recursos
✓ Consultas cruzadas
```

### Tarjeta 8: Código Gateway (9:30-10:00)
```
DICE:
"El código backend está en módulo BFF. GatewayController 
orquesta peticiones a ms-pacientes (8081) y ms-citas (8082). 
Usa RestTemplate para llamadas HTTP sincrónicas."

PUNTOS CLAVE:
✓ GatewayController en BFF
✓ RestTemplate para HTTP
✓ Orquestra a microservicios
✓ Puertos: 8081 (pacientes), 8082 (citas)
```

### Tarjeta 9: Código Microservicios (10:00-10:30)
```
DICE:
"Cada microservicio tiene su controller: PacienteController, 
CitaController. Detrás: service con lógica, repository para BD 
usando Spring Data JPA. Patrón de capas limpio."

PUNTOS CLAVE:
✓ Controller: endpoints
✓ Service: lógica de negocio
✓ Repository: acceso a BD
✓ Spring Data JPA
✓ Patrón de capas
```

---

## 🎙️ MARCELO - Minutos 10:30 a 15:00

### Tarjeta 1: Importancia Tests (10:30-11:00)
```
DICE:
"La calidad no es solo funcionalidad, es confiabilidad. 
Por eso, pruebas unitarias exhaustivas en cada componente. 
Usamos JUnit 5 y Mockito."

PUNTOS CLAVE:
✓ Calidad = funcionalidad + confiabilidad
✓ Pruebas unitarias
✓ JUnit 5
✓ Mockito para mocks
```

### Tarjeta 2: Estructura Test (11:00-11:45)
```
DICE:
"Test typical sigue patrón Given-When-Then. 
Preparamos estado (Given), ejecutamos acción (When), 
validamos resultado (Then). Mockito simula dependencias."

PUNTOS CLAVE:
✓ @Test anotación
✓ Given: preparar estado
✓ When: ejecutar acción
✓ Then: validar resultado
✓ @Mock, @InjectMocks
```

### Tarjeta 3: Ejecución Tests (11:45-12:15)
```
DICE:
"'mvn clean test' ejecuta pruebas. Limpia proyecto, 
compila, ejecuta tests, genera reportes. Todos pasan. 
BUILD SUCCESS al final."

PUNTOS CLAVE:
✓ mvn clean test
✓ Compila código
✓ Ejecuta tests
✓ Genera reportes
✓ BUILD SUCCESS
```

### Tarjeta 4: Reporte JaCoCo (12:15-12:45)
```
DICE:
"Maven genera reporte JaCoCo en HTML. Muestra cobertura 
línea por línea. Verde: ejecutado. Rojo: no ejecutado 
durante tests."

PUNTOS CLAVE:
✓ JaCoCo reporte HTML
✓ Cobertura línea por línea
✓ Verde: covered
✓ Rojo: missed
✓ target/site/jacoco/index.html
```

### Tarjeta 5: Análisis Cobertura (12:45-13:30)
```
DICE:
"BFF: 63.27% (cumple 60% mínimo). 
Ms-pacientes: 94.20% (excepcional). 
Ms-citas: 94.63% (excepcional). 
Promedio: 83.70% (sobresaliente)."

PUNTOS CLAVE:
✓ BFF: 63.27%
✓ Pacientes: 94.20%
✓ Citas: 94.63%
✓ Promedio: 83.70%
✓ Supera mínimo 60%
```

### Tarjeta 6: Conclusión Pruebas (13:30-14:00)
```
DICE:
"14+ métodos de prueba cubren todos los endpoints. 
Casos de éxito (200, 201) y error (404, 500, 503). 
Cobertura promedio 83.70% = código confiable."

PUNTOS CLAVE:
✓ 14+ test methods
✓ 10 endpoints cubiertos
✓ Casos éxito + error
✓ 83.70% cobertura
✓ Código confiable
```

### Tarjeta 7: Logros (14:00-14:30)
```
DICE:
"RedNorte es sistema completo: arquitectura escalable, 
frontend responsivo, APIs bien documentadas, 
pruebas exhaustivas, cobertura excepcional."

PUNTOS CLAVE:
✓ Arquitectura: escalable
✓ Frontend: responsivo
✓ APIs: bien documentadas
✓ Pruebas: exhaustivas
✓ Cobertura: excepcional
```

### Tarjeta 8: Despedida (14:30-15:00)
```
DICE:
"Código disponible en GitHub. Documentación completa: 
OpenAPI specs, arquitectura, diagramas, reportes de pruebas. 
Sistema listo para producción y fácil de extender."

PUNTOS CLAVE:
✓ GitHub repositories
✓ Documentación: OpenAPI, arquitectura, diagramas
✓ Reportes de pruebas
✓ Listo para producción
✓ Fácil de extender y mantener
```

---

## 📝 TIPS DE GRABACIÓN

### Para Todos:
- ✓ Habla claro y pausadamente
- ✓ No comas o bebas durante grabación
- ✓ Sin ruido de fondo (ventanas cerradas)
- ✓ Usa micrófono de buena calidad
- ✓ Haz una prueba antes de grabar todo

### Velocidad de Habla:
- ✓ Normal: 120-140 palabras por minuto
- ✓ No muy rápido (difícil entender)
- ✓ No muy lento (aburre)
- ✓ Haz pausas entre ideas

### Si Cometes Error:
- ✓ Sigue grabando
- ✓ Repite la oración desde el principio
- ✓ Edita después en Audacity
- ✓ No hagas click/stop

### Archivos a Guardar:
- ALEJANDRO_0-2-30.mp3
- MANUEL_2-30-5-30.mp3
- ANDRES_5-30-10-30.mp3
- MARCELO_10-30-15-00.mp3

---

**¡GRABAR CON CONFIANZA Y PROFESIONALISMO!** 🎤

