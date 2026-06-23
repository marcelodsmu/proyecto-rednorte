# GUIÓN VIDEO PRESENTACIÓN - REDNORTE HEALTHCARE SYSTEM
## Duración: 15 minutos | Formato: Grabación de Pantalla + Voice-Over

---

## 👥 DISTRIBUCIÓN DE ROLES

| Integrante | Rol | Duración | Partes |
|------------|-----|----------|--------|
| **Marcelo** | Presentador Visual (Screencast) | 15 min | Toda la demostración en pantalla |
| **Alejandro** | Voice-Over Introducción & Arquitectura | 2.5 min | Minutos 0:00-2:30 |
| **Manuel** | Voice-Over Frontend & UX | 3 min | Minutos 2:30-5:30 |
| **Andrés** | Voice-Over APIs & Backend | 5 min | Minutos 5:30-10:30 |
| **Marcelo** | Voice-Over Pruebas & Conclusión | 4.5 min | Minutos 10:30-15:00 |

---

# 🎬 GUIÓN DETALLADO POR MINUTO

---

## **SEGMENTO 1: INTRODUCCIÓN & ARQUITECTURA** (0:00 - 2:30)
**Voice-Over:** ALEJANDRO
**En Pantalla:** Diapositiva intro + Diagrama arquitectura

### ⏱️ 0:00 - 0:15 (Intro)
**ALEJANDRO DICE:**
```
"Hola, somos el equipo de RedNorte, una plataforma de salud para gestión 
de pacientes y citas médicas. Este video presenta nuestro sistema completo, 
su arquitectura y funcionalidad."
```

**PANTALLA MUESTRA:**
- Logo o título: "REDNORTE - HEALTHCARE SYSTEM"
- Nombres del equipo (Marcelo, Alejandro, Manuel, Andrés)
- Fecha de entrega

**INSTRUCCIONES PARA MARCELO:**
1. Abrir presentación o imagen con title slide
2. Mostrar durante 15 segundos
3. Prepararse para siguiente elemento

---

### ⏱️ 0:15 - 0:45 (Arquitectura General)
**ALEJANDRO DICE:**
```
"Nuestro sistema está basado en una arquitectura de microservicios 
con cuatro componentes principales. Primero, tenemos el frontend en React 
con Vite, que es nuestra interfaz de usuario. Segundo, un API Gateway 
que actúa como Backend for Frontend (BFF) para orquestar las peticiones."
```

**PANTALLA MUESTRA:**
- Abrir archivo: `entregables/arquitectura_microservicios.pdf`
- Mostrar diagrama completo durante 15 segundos

**INSTRUCCIONES PARA MARCELO:**
1. Ejecutar: `start "c:\Users\marce\proyecto-rednorte\entregables\arquitectura_microservicios.pdf"`
2. Ampliar/maximizar ventana
3. Señalar con mouse cada componente (opcional)
4. Mantener visible durante toda la explicación

---

### ⏱️ 0:45 - 1:30 (Microservicios)
**ALEJANDRO DICE:**
```
"Tercero, dos microservicios especializados: uno para gestión de pacientes 
(ms-pacientes) y otro para gestión de citas médicas (ms-citas). Finalmente, 
un servidor Eureka que actúa como registro de servicios para que todos los 
componentes se descubran automáticamente. Todo está desarrollado en Java 17 
con Spring Boot 4.0.7."
```

**PANTALLA MUESTRA:**
- Seguir mostrando el diagrama
- Señalar cada microservicio cuando se mencione

**INSTRUCCIONES PARA MARCELO:**
1. Mantener PDF visible
2. Hacer zoom en cada sección si es posible
3. Señalar visualmente con el mouse/puntero cuando Alejandro mencione cada componente

---

### ⏱️ 1:30 - 2:00 (Flujo de Datos)
**ALEJANDRO DICE:**
```
"El flujo es simple: el usuario interactúa con el frontend, que envía 
peticiones HTTP al BFF en el puerto 8080. El BFF recibe estas peticiones 
y las orquesta hacia los microservicios correspondientes en los puertos 8081 
(pacientes) y 8082 (citas). Los datos se persisten en bases de datos 
H2 en memoria para desarrollo."
```

**PANTALLA MUESTRA:**
- Mantener diagrama visible
- Señalar flechas de comunicación

**INSTRUCCIONES PARA MARCELO:**
1. Seguir en PDF
2. Hacer zoom en la sección de flechas/comunicación si es visible
3. Prepararse para cerrar y abrir el navegador

---

### ⏱️ 2:00 - 2:30 (Tecnologías Stack)
**ALEJANDRO DICE:**
```
"Utilizamos tecnologías modernas y ampliamente adoptadas en la industria: 
Frontend con React 19.2.6 y Vite 8.0.14 para desarrollo rápido. Backend 
con Spring Boot, Spring Data JPA, y Hibernate para ORM. Para pruebas, 
JUnit 5, Mockito, y JaCoCo para reporte de cobertura. Todo versionado 
en Git y publicado en GitHub."
```

**PANTALLA MUESTRA:**
- Cerrar PDF
- Mostrar lista de tecnologías (puede ser otra imagen o diapositiva)

**INSTRUCCIONES PARA MARCELO:**
1. Cerrar PDF (Alt+F4 o botón cerrar)
2. Abrir navegador con Google Chrome o Firefox
3. Listo para siguiente segmento (Frontend Demo)

---

## **SEGMENTO 2: DEMOSTRACIÓN FRONTEND** (2:30 - 5:30)
**Voice-Over:** MANUEL
**En Pantalla:** Aplicación web en navegador

### ⏱️ 2:30 - 2:45 (Startup Frontend)
**MANUEL DICE:**
```
"Ahora vamos a ver la interfaz de usuario. Nuestro frontend es una 
aplicación de una sola página desarrollada en React."
```

**PANTALLA MUESTRA:**
- Abrir URL: http://localhost:5173

**INSTRUCCIONES PARA MARCELO:**
1. Abrir terminal PowerShell (si no está abierta)
2. Navegar a: `cd C:\Users\marce\proyecto-rednorte\rednorte-frontend`
3. Ejecutar: `npm run dev` (si no está ejecutándose)
4. Esperar mensaje: "VITE v8.x.x ready in X ms"
5. Abrir navegador: http://localhost:5173
6. Esperar carga completa

---

### ⏱️ 2:45 - 3:30 (UI Pacientes - Lectura)
**MANUEL DICE:**
```
"La pantalla está dividida en dos columnas. La izquierda es para pacientes 
y la derecha para citas. Aquí vemos una lista de pacientes con información 
como ID, nombre, email y teléfono. Cada fila tiene botones para editar 
o eliminar el registro. Arriba hay un buscador en tiempo real que filtra 
los resultados mientras escribes."
```

**PANTALLA MUESTRA:**
- Mostrar tabla de Pacientes llena (scroll si es necesario)
- Mostrar columnas: ID, Nombre, Email, Teléfono, Botones

**INSTRUCCIONES PARA MARCELO:**
1. Navegar a http://localhost:5173 en navegador
2. Esperar carga de datos
3. Maximizar ventana del navegador
4. Scroll horizontal si es necesario para ver todas las columnas
5. NO hacer clic aún

---

### ⏱️ 3:30 - 4:00 (Crear Paciente)
**MANUEL DICE:**
```
"Para crear un nuevo paciente, hacemos clic en el botón 'Nuevo Paciente'. 
Esto abre un modal con un formulario donde ingresamos el nombre, email, 
teléfono y síntomas iniciales. Luego hacemos clic en 'Guardar' para 
persistir los datos en la base de datos."
```

**PANTALLA MUESTRA:**
- Botón "Nuevo Paciente" → Click
- Modal formulario se abre
- Mostrar campos vacíos

**INSTRUCCIONES PARA MARCELO:**
1. Buscar en pantalla botón "Nuevo Paciente" (probablemente arriba de la tabla)
2. Hacer clic
3. Esperar a que modal se cargue
4. NO completar formulario aún (solo mostrar la estructura)
5. Screenshot mental: modal con campos vacíos

---

### ⏱️ 4:00 - 4:30 (Editar & Eliminar)
**MANUEL DICE:**
```
"Si hacemos clic en el botón editar de un paciente existente, se abre 
el mismo modal pero con los datos precargados. Podemos modificar cualquier 
campo y guardar los cambios. El botón eliminar simplemente borra el registro 
tras una confirmación."
```

**PANTALLA MUESTRA:**
- Cerrar modal (ESC o botón Cancelar)
- Hacer clic en botón Editar de un paciente existente
- Mostrar modal con datos precargados

**INSTRUCCIONES PARA MARCELO:**
1. Si modal está abierto, presionar ESC para cerrar
2. En tabla de pacientes, encontrar un botón "Editar" o ícono de lápiz
3. Hacer clic
4. Esperar modal con datos
5. Mostrar durante 10 segundos
6. NO guardar cambios

---

### ⏱️ 4:30 - 5:15 (Vista Citas)
**MANUEL DICE:**
```
"En la columna derecha tenemos la gestión de citas. Funciona de forma similar 
a los pacientes. Vemos una lista de citas con fecha, hora, especialidad, 
estado y botones de acción. El buscador también filtra citas en tiempo real."
```

**PANTALLA MUESTRA:**
- Cerrar modal si está abierto
- Scroll derecho o cambiar vista a mostrar tabla de Citas
- Mostrar columnas de Citas

**INSTRUCCIONES PARA MARCELO:**
1. Presionar ESC si modal está visible
2. Buscar tabla de Citas (probablemente a la derecha)
3. Si no es visible, scroll horizontal o hacer zoom out
4. Mostrar tabla con múltiples citas
5. Asegurar que se ven: Fecha, Hora, Especialidad, Estado

---

### ⏱️ 5:15 - 5:30 (Notificaciones & UX)
**MANUEL DICE:**
```
"La interfaz también tiene notificaciones visuales. Cuando guardamos 
una operación exitosa, vemos un toast verde confirmando la acción. 
Si hay un error, mostramos un toast rojo con el mensaje. Esto da 
una experiencia de usuario clara y responsiva."
```

**PANTALLA MUESTRA:**
- Hacer clic en "Nuevo Paciente" nuevamente
- Llenar formulario rápidamente
- Hacer clic en "Guardar"
- Esperar toast de confirmación verde

**INSTRUCCIONES PARA MARCELO:**
1. Hacer clic en "Nuevo Paciente"
2. Completar campos RÁPIDO (nombres aleatorios):
   - Nombre: "Test Patient"
   - Email: "test@example.com"
   - Teléfono: "+1234567890"
   - Síntomas: "Tos"
3. Hacer clic en "Guardar"
4. Esperar y mostrar notificación verde (2-3 segundos)
5. Si no aparece, está OK - continuar

---

## **SEGMENTO 3: APIs & BACKEND ENDPOINTS** (5:30 - 10:30)
**Voice-Over:** ANDRÉS
**En Pantalla:** Postman + Código fuente

### ⏱️ 5:30 - 6:00 (Colección Postman)
**ANDRÉS DICE:**
```
"Ahora vamos a ver los endpoints REST que alimentan la aplicación. 
Tenemos 10 endpoints principales divididos en dos recursos: pacientes 
y citas. Cada endpoint sigue el estándar RESTful con métodos HTTP 
apropiados: GET para lectura, POST para creación, PUT para actualización, 
y DELETE para eliminación."
```

**PANTALLA MUESTRA:**
- Abrir Postman o cliente REST similar
- Mostrar carpeta/colección: "RedNorte API"

**INSTRUCCIONES PARA MARCELO:**
1. Minimizar navegador (Windows Key + M) o cambiar ventana
2. Abrir Postman (si está instalado): `postman` en terminal o acceso directo
3. Importar colección: `entregables/api-rednorte.postman_collection.json`
   - File → Import → Seleccionar archivo
4. Esperar carga
5. Mostrar estructura de carpetas

---

### ⏱️ 6:00 - 6:45 (GET Pacientes)
**ANDRÉS DICE:**
```
"El primer endpoint es GET /api/pacientes. Esto devuelve la lista completa 
de pacientes. La respuesta es un JSON array con todos los registros. 
Vemos que cada paciente tiene id, nombre, email, teléfono y síntomas."
```

**PANTALLA MUESTRA:**
- En Postman, expandir carpeta "Pacientes"
- Seleccionar request: "GET - List Pacientes"
- Mostrar URL: http://localhost:8080/api/pacientes
- Hacer clic en "Send"
- Esperar respuesta JSON

**INSTRUCCIONES PARA MARCELO:**
1. En Postman, buscar carpeta "Pacientes" (si existe estructura de carpetas)
2. Dentro, buscar request llamado "GET" o "List Pacientes"
3. Verificar que URL dice: http://localhost:8080/api/pacientes
4. Hacer clic en botón "Send" (azul)
5. Esperar 1-2 segundos a respuesta
6. Respuesta debe ser 200 OK con JSON array
7. Mostrar durante 15 segundos

---

### ⏱️ 6:45 - 7:15 (POST Crear Paciente)
**ANDRÉS DICE:**
```
"El segundo endpoint es POST /api/pacientes. Esto crea un nuevo paciente. 
Enviamos un JSON con los datos del paciente en el body. El servidor 
devuelve 201 Created con el paciente creado, incluyendo el id asignado 
por la base de datos."
```

**PANTALLA MUESTRA:**
- Seleccionar request: "POST - Create Paciente"
- Mostrar URL: http://localhost:8080/api/pacientes
- Mostrar Body con JSON de ejemplo
- Hacer clic en "Send"

**INSTRUCCIONES PARA MARCELO:**
1. En Postman, seleccionar "POST - Create Paciente" (o similar)
2. Verificar URL: http://localhost:8080/api/pacientes
3. Hacer clic en tab "Body"
4. Mostrar JSON de ejemplo (campos: nombre, email, teléfono, síntomas)
5. Hacer clic en "Send"
6. Mostrar respuesta 201 CREATED con datos del paciente nuevo

---

### ⏱️ 7:15 - 7:45 (PUT Actualizar)
**ANDRÉS DICE:**
```
"El tercer endpoint es PUT /api/pacientes/{id}. Esto actualiza un paciente 
existente. Especificamos el id en la URL y los datos nuevos en el body. 
El servidor devuelve 200 OK con el paciente actualizado."
```

**PANTALLA MUESTRA:**
- Seleccionar request: "PUT - Update Paciente"
- Mostrar URL: http://localhost:8080/api/pacientes/1
- Mostrar Body con JSON actualizado
- Hacer clic en "Send"

**INSTRUCCIONES PARA MARCELO:**
1. Seleccionar "PUT - Update Paciente"
2. Verificar URL con id: http://localhost:8080/api/pacientes/1 (o similar)
3. Mostrar Body con datos modificados
4. Hacer clic en "Send"
5. Mostrar respuesta 200 OK

---

### ⏱️ 7:45 - 8:15 (DELETE Eliminar)
**ANDRÉS DICE:**
```
"El cuarto endpoint es DELETE /api/pacientes/{id}. Esto elimina un paciente. 
Solo especificamos el id en la URL, sin body. El servidor devuelve 204 No Content 
indicando que la eliminación fue exitosa."
```

**PANTALLA MUESTRA:**
- Seleccionar request: "DELETE - Delete Paciente"
- Mostrar URL: http://localhost:8080/api/pacientes/1
- NO hay Body
- Hacer clic en "Send"

**INSTRUCCIONES PARA MARCELO:**
1. Seleccionar "DELETE - Delete Paciente"
2. Verificar URL con id
3. Verificar que tab "Body" está vacío o dice "None"
4. Hacer clic en "Send"
5. Mostrar respuesta 204 NO CONTENT

---

### ⏱️ 8:15 - 8:45 (Endpoints Citas)
**ANDRÉS DICE:**
```
"Los mismos cuatro endpoints existen para citas: GET /api/citas, 
POST /api/citas, PUT /api/citas/{id}, y DELETE /api/citas/{id}. 
La estructura es idéntica pero con los campos de cita: fecha, hora, 
especialidad, estado, y referencia al paciente."
```

**PANTALLA MUESTRA:**
- Expandir carpeta "Citas"
- Mostrar los 4 requests GET, POST, PUT, DELETE

**INSTRUCCIONES PARA MARCELO:**
1. En Postman, buscar carpeta "Citas"
2. Expandir para mostrar los 4 requests dentro
3. No es necesario ejecutar todos, solo mostrar la estructura
4. Aclarar que funcionan igual a pacientes

---

### ⏱️ 8:45 - 9:30 (Endpoints Relacionales)
**ANDRÉS DICE:**
```
"También tenemos dos endpoints especiales para relaciones. 
GET /api/pacientes/{id}/citas devuelve todas las citas de un paciente específico. 
Y GET /api/citas/{id}/paciente devuelve los datos del paciente asociado a una cita. 
Esto permite consultas cruzadas entre los dos microservicios."
```

**PANTALLA MUESTRA:**
- Buscar requests: "GET - Citas por Paciente" y "GET - Paciente de Cita"
- Mostrar URLs con id

**INSTRUCCIONES PARA MARCELO:**
1. Buscar en Postman los endpoints relacionales
2. Mostrar URL de ejemplo: http://localhost:8080/api/pacientes/1/citas
3. Ejecutar uno (opcional)
4. Mostrar respuesta con relación

---

### ⏱️ 9:30 - 10:00 (Código Backend - GatewayController)
**ANDRÉS DICE:**
```
"El código backend que implementa estos endpoints está en el módulo BFF 
(Backend for Frontend). El GatewayController orquesta las peticiones 
hacia los microservicios. Cada endpoint hace RestTemplate calls a 
ms-pacientes en puerto 8081 o ms-citas en puerto 8082."
```

**PANTALLA MUESTRA:**
- Abrir VS Code con proyecto
- Navegar a: rednorte-bff/src/main/java/.../GatewayController.java
- Mostrar el archivo

**INSTRUCCIONES PARA MARCELO:**
1. Minimizar Postman
2. Abrir VS Code (si no está abierto)
3. En VS Code, abrir carpeta: c:\Users\marce\proyecto-rednorte
4. Navegar a: rednorte-bff → src → main → java → com → rednorte → bff_rednorte → GatewayController.java
5. Mostrar el archivo
6. Scroll para mostrar múltiples endpoints

---

### ⏱️ 10:00 - 10:30 (Código Microservicios)
**ANDRÉS DICE:**
```
"Cada microservicio tiene su propio controller. Por ejemplo, ms-pacientes 
tiene PacienteController que implementa GET, POST, PUT, DELETE para pacientes. 
Detrás del controller hay PacienteService con la lógica de negocio, 
y PacienteRepository que maneja la persistencia en la base de datos 
usando Spring Data JPA."
```

**PANTALLA MUESTRA:**
- Navegación rápida mostrando estructura de ms-pacientes
- Mostrar: PacienteController.java
- Mostrar: PacienteService.java
- Mostrar: Paciente.java (entity)

**INSTRUCCIONES PARA MARCELO:**
1. En VS Code, cambiar a carpeta: rednorte-ms-pacientes
2. Navegar a: PacienteController.java → Mostrar 10 segundos
3. Navegar a: PacienteService.java → Mostrar 10 segundos
4. Navegar a: Paciente.java (entity) → Mostrar 10 segundos

---

## **SEGMENTO 4: PRUEBAS UNITARIAS & COBERTURA** (10:30 - 14:30)
**Voice-Over:** MARCELO
**En Pantalla:** Código tests + JaCoCo reports

### ⏱️ 10:30 - 11:00 (Importancia Tests)
**MARCELO DICE:**
```
"La calidad de software no es solo sobre funcionalidad, es también sobre 
confiabilidad. Por eso, implementamos pruebas unitarias exhaustivas para 
validar que cada componente funciona correctamente. Usamos JUnit 5 como 
framework de testing y Mockito para simular dependencias."
```

**PANTALLA MUESTRA:**
- Navegar a: rednorte-bff/src/test/java/.../GatewayControllerTest.java
- Mostrar el archivo

**INSTRUCCIONES PARA MARCELO:**
1. En VS Code, navegar a rednorte-bff
2. Ir a: src/test/java/com/rednorte/bff_rednorte/GatewayControllerTest.java
3. Mostrar archivo
4. Scroll para ver múltiples métodos de test

---

### ⏱️ 11:00 - 11:45 (Estructura de un Test)
**MARCELO DICE:**
```
"Aquí vemos un test típico. Usamos la anotación @Test de JUnit 5. 
La estructura sigue el patrón Given-When-Then: primero preparamos 
el estado inicial (Given), luego ejecutamos la acción (When), 
y finalmente validamos el resultado (Then). Usamos Mockito para 
simular las dependencias como RestTemplate."
```

**PANTALLA MUESTRA:**
- Mostrar método: getPacientesSuccess()
- Resaltar: @Mock, @InjectMocks, @Test
- Resaltar: when(...).thenReturn(...)
- Resaltar: assertions/expect

**INSTRUCCIONES PARA MARCELO:**
1. En GatewayControllerTest.java, encontrar método: getPacientesSuccess()
2. Hacer zoom si es necesario (Ctrl + Scroll)
3. Mostrar desde anotación @Test hasta el cierre del método
4. Mantener visible 20 segundos para que vean la estructura

---

### ⏱️ 11:45 - 12:15 (Ejecución de Tests)
**MARCELO DICE:**
```
"Para ejecutar las pruebas, usamos Maven. El comando 'mvn clean test' 
limpia el proyecto, compila el código, ejecuta todas las pruebas unitarias, 
y genera reportes de cobertura. Todos nuestros tests pasan exitosamente."
```

**PANTALLA MUESTRA:**
- Abrir terminal en VS Code (Terminal → New Terminal)
- Ejecutar: cd rednorte-bff
- Ejecutar: mvn clean test -q
- Mostrar output (BUILD SUCCESS)

**INSTRUCCIONES PARA MARCELO:**
1. En VS Code, abrir terminal (Ctrl + `)
2. Ejecutar: `cd c:\Users\marce\proyecto-rednorte\rednorte-bff`
3. Ejecutar: `mvn clean test -q`
4. Esperar ejecución (puede tomar 30-60 segundos)
5. Mostrar: "BUILD SUCCESS" al final
6. Mantener visible para verificación

---

### ⏱️ 12:15 - 12:45 (Reporte JaCoCo)
**MARCELO DICE:**
```
"Después de ejecutar los tests, Maven genera un reporte JaCoCo en HTML. 
Este reporte muestra la cobertura de código línea por línea. Vemos qué 
código fue ejecutado durante las pruebas (líneas verdes) y cuál no (líneas rojas)."
```

**PANTALLA MUESTRA:**
- Abrir navegador
- Ir a: file:///C:/Users/marce/proyecto-rednorte/rednorte-bff/target/site/jacoco/index.html
- Mostrar reporte general

**INSTRUCCIONES PARA MARCELO:**
1. Ejecutar en terminal: `start "c:\Users\marce\proyecto-rednorte\rednorte-bff\target\site\jacoco\index.html"`
2. Esperar a que se abra en navegador
3. Mostrar tabla con estadísticas
4. Mostrar: Instruction Coverage, Branch Coverage, Line Coverage

---

### ⏱️ 12:45 - 13:30 (Análisis de Cobertura)
**MARCELO DICE:**
```
"Nuestro reporte muestra que el BFF tiene 63.27% de cobertura de código, 
lo que cumple y supera el mínimo requerido de 60%. Para ms-pacientes, 
tenemos 94.20% de cobertura, y para ms-citas, 94.63%. Esto demuestra 
un compromiso serio con la calidad."
```

**PANTALLA MUESTRA:**
- Mostrar tabla de cobertura general del BFF
- Hacer clic en: rednorte.bff_rednorte/GatewayController
- Mostrar cobertura por clase

**INSTRUCCIONES PARA MARCELO:**
1. En reporte JaCoCo del BFF, señalar la fila "bff_rednorte" o "GatewayController"
2. Mostrar porcentaje: 63.27%
3. Hacer clic en GatewayController.java.html
4. Mostrar el código con colores (verde = cubierto, rojo = no cubierto)
5. Mantener 20 segundos
6. Navegar a ms-pacientes JaCoCo (en nueva pestaña o ventana)
7. Mostrar: 94.20%
8. Navegar a ms-citas JaCoCo
9. Mostrar: 94.63%

---

### ⏱️ 13:30 - 14:00 (Conclusión Pruebas)
**MARCELO DICE:**
```
"En total, implementamos 14+ métodos de prueba que cubren todos los 
casos exitosos y de error para los 10 endpoints REST. La cobertura 
promedio es de 83.70%, demostrando que prácticamente todo el código 
crítico está validado por pruebas automatizadas. Esto nos da confianza 
en la calidad y estabilidad del sistema."
```

**PANTALLA MUESTRA:**
- Volver a mostrar tabla resumen de cobertura
- Hacer screenshot mental: ms-pacientes 94%, ms-citas 95%, bff 63%

**INSTRUCCIONES PARA MARCELO:**
1. Navegar a ventana/pestaña con resumen (o abrir nuevamente)
2. Mostrar los 3 porcentajes: 94.20%, 94.63%, 63.27%
3. Mantener visible 15 segundos

---

## **SEGMENTO 5: CONCLUSIÓN & RESUMEN** (14:00 - 15:00)
**Voice-Over:** MARCELO
**En Pantalla:** Resumen / Slide final

### ⏱️ 14:00 - 14:30 (Logros)
**MARCELO DICE:**
```
"RedNorte es un sistema completo de gestión de pacientes y citas 
implementado con las mejores prácticas de ingeniería de software. 
Hemos construido una arquitectura de microservicios escalable, un frontend 
responsivo, APIs RESTful bien documentadas, pruebas unitarias exhaustivas, 
y cobertura de código excepcional."
```

**PANTALLA MUESTRA:**
- Mostrar diapositiva con logo de RedNorte y listaLogros
- O pantalla de resumen

**INSTRUCCIONES PARA MARCELO:**
1. Minimizar ventanas anteriores
2. Abrir imagen/PDF con slide de conclusión
3. Mostrar durante 20 segundos

---

### ⏱️ 14:30 - 15:00 (Despedida)
**MARCELO DICE:**
```
"Gracias por ver esta presentación. Todo el código está disponible 
en nuestro repositorio de GitHub. Hemos documentado ampliamente cada 
componente, incluida la documentación de APIs con OpenAPI/Swagger, 
diagramas de arquitectura, y reportes de pruebas. El sistema está listo 
para producción y puede ser fácilmente extendido y mantenido."
```

**PANTALLA MUESTRA:**
- Mostrar URLs de GitHub repositories en texto/imagen
- Mostrar códigos QR (si tienes)
- Despedida

**INSTRUCCIONES PARA MARCELO:**
1. Mostrar diapositiva con URLs de GitHub:
   - https://github.com/marcelodsmu/rednorte-frontend
   - https://github.com/marcelodsmu/rednorte-bff
   - https://github.com/marcelodsmu/rednorte-ms-pacientes
   - https://github.com/marcelodsmu/rednorte-ms-citas
   - https://github.com/marcelodsmu/rednorte-eureka
   - https://github.com/marcelodsmu/proyecto-rednorte
2. Mantener visible hasta final del video (30 segundos)
3. Fin de grabación

---

# 📝 GUÍA TÉCNICA PARA GRABACIÓN

## Antes de Grabar (Checklist):

- [ ] Terminal PowerShell lista en: c:\Users\marce\proyecto-rednorte
- [ ] Frontend iniciado: `npm run dev` en rednorte-frontend → http://localhost:5173
- [ ] Backend iniciado: `mvn spring-boot:run` en rednorte-bff/rednorte-ms-pacientes/rednorte-ms-citas
- [ ] Postman abierto con colección importada
- [ ] VS Code abierto con proyecto
- [ ] Navegador preparado para reportes JaCoCo
- [ ] OBS Studio o similar para screencast (opcional pero recomendado)
- [ ] Micrófono probado para voice-over
- [ ] Resolución de pantalla: 1920x1080 o similar (16:9)

## Durante la Grabación:

1. **Grabación de Pantalla:**
   - Usar OBS Studio o Camtasia para capturar pantalla
   - Configurar resolución 1920x1080, FPS 30
   - Grabar sin audio (agregar voice-over después)
   - Captura: TODA la pantalla (permiten ver dock, barra de tareas)

2. **Timing:**
   - Seguir tiempos del guión exactamente
   - Hacer pausas donde se especifica
   - Mantener elementos visibles el tiempo indicado
   - Si algo falla, repetir desde inicio del segmento

3. **Navegación:**
   - Usar atajos: Ctrl+Tab (cambiar ventanas), Alt+Tab (entre apps)
   - Zoom si es necesario (Ctrl+Scroll)
   - Mostrar mouse lentamente para claridad

## Después de Grabar:

1. Exportar video sin audio: archivo.mp4
2. Compartir con Alejandro, Manuel, Andrés
3. Cada uno graba su voz por separado (ver tiempos)
4. Usar audacity/Adobe Audition para sincronizar voces
5. Video final: multitrack audio (uno por persona) o mezcla

---

# 🎙️ GUÍA DE VOICE-OVER PARA CADA INTEGRANTE

## ALEJANDRO (0:00 - 2:30)

**Partes a grabar:**
1. Introducción (0:00-0:15)
2. Arquitectura General (0:15-0:45)
3. Microservicios (0:45-1:30)
4. Flujo de Datos (1:30-2:00)
5. Stack de Tecnologías (2:00-2:30)

**Tono sugerido:** Profesional, claro, pausado
**Instrucciones para grabación:**
- Graba en archivo: `ALEJANDRO_0-2-30.mp3`
- Velocidad de habla: 120-130 palabras por minuto
- Sin ruido de fondo
- Si cometes error, sigue grabando y edita después

---

## MANUEL (2:30 - 5:30)

**Partes a grabar:**
1. Startup Frontend (2:30-2:45)
2. UI Pacientes (2:45-3:30)
3. Crear Paciente (3:30-4:00)
4. Editar & Eliminar (4:00-4:30)
5. Vista Citas (4:30-5:15)
6. Notificaciones (5:15-5:30)

**Tono sugerido:** Entusiasta, descriptivo
**Instrucciones para grabación:**
- Graba en archivo: `MANUEL_2-30-5-30.mp3`
- Enfatiza en features, no en código
- Habla como si explicaras a un usuario final

---

## ANDRÉS (5:30 - 10:30)

**Partes a grabar:**
1. Colección Postman (5:30-6:00)
2. GET Pacientes (6:00-6:45)
3. POST Crear (6:45-7:15)
4. PUT Actualizar (7:15-7:45)
5. DELETE Eliminar (7:45-8:15)
6. Endpoints Citas (8:15-8:45)
7. Endpoints Relacionales (8:45-9:30)
8. Código GatewayController (9:30-10:00)
9. Código Microservicios (10:00-10:30)

**Tono sugerido:** Técnico, detallado, pedagógico
**Instrucciones para grabación:**
- Graba en archivo: `ANDRES_5-30-10-30.mp3`
- Asume que la audiencia sabe de APIs REST
- Sé específico con URLs, métodos HTTP, códigos de status
- Menciona JSON y estructura de datos

---

## MARCELO (10:30 - 15:00)

**Partes a grabar:**
1. Importancia Tests (10:30-11:00)
2. Estructura de un Test (11:00-11:45)
3. Ejecución de Tests (11:45-12:15)
4. Reporte JaCoCo (12:15-12:45)
5. Análisis de Cobertura (12:45-13:30)
6. Conclusión Pruebas (13:30-14:00)
7. Logros (14:00-14:30)
8. Despedida (14:30-15:00)

**Tono sugerido:** Confiado, profesional, amigable
**Instrucciones para grabación:**
- Graba en archivo: `MARCELO_10-30-15-00.mp3`
- Como presentador visual, sé coherente con lo que se ve
- Cierra bien el proyecto con énfasis en calidad y producción

---

# 🎬 PROCESO DE POSTPRODUCCIÓN

## Paso 1: Sincronización de Audio

```bash
# Nombre del video: rednorte-presentation-15min.mp4
# Voces grabadas:
# - ALEJANDRO_0-2-30.mp3 (inicia en 0:00)
# - MANUEL_2-30-5-30.mp3 (inicia en 2:30)
# - ANDRES_5-30-10-30.mp3 (inicia en 5:30)
# - MARCELO_10-30-15-00.mp3 (inicia en 10:30)

# Usar Audacity:
# 1. File → Open → rednorte-presentation-15min.mp4
# 2. Tracks → New → Stereo Track (x4)
# 3. File → Import → Audio → ALEJANDRO_0-2-30.mp3 → Nueva pista
# 4. File → Import → Audio → MANUEL_2-30-5-30.mp3 → Nueva pista
# 5. Etc...
# 6. Alinear cada track al tiempo indicado usando timeshifts
# 7. Ajustar volumen de cada track
# 8. Export → MP4
```

## Paso 2: Exportación Final

- Formato: MP4 o WebM
- Resolución: 1920x1080
- Audio: AAC, 128 kbps, 44.1 kHz
- Frames: 30 FPS
- Duración: ~15:00

## Paso 3: Upload a Blackboard

1. Ir a Blackboard → Asignación → Entrega
2. Subir video final + ZIP de entregables
3. Descripción: "Presentación RedNorte Healthcare System - 15 minutos"

---

# 📊 CHECKLIST FINAL ANTES DE ENTREGAR

- [ ] Video de 15 minutos capturado
- [ ] Voces grabadas por Alejandro, Manuel, Andrés, Marcelo
- [ ] Audio sincronizado y mezclado
- [ ] Video exportado en formato MP4
- [ ] ZIP rednorte-entregables.zip verificado
- [ ] GitHub repos públicos y accesibles
- [ ] DEFENSA_ORAL_GUIA.md actualizado con tiempos
- [ ] EVIDENCIA_COMPLETA_PRUEBAS.md incluido
- [ ] Urls de GitHub en diapositiva final
- [ ] Subtítulos (opcional pero recomendado)
- [ ] Video probado en navegador antes de entregar

---

**¡LISTO PARA PRODUCCIÓN!** 🚀

Cualquier duda durante la grabación, coordina rápidamente con tu equipo.
El guión es flexible: si algo en pantalla falla, sigue adelante manteniendo los tiempos.

