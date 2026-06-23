# CHECKLIST DE GRABACIÓN - REDNORTE HEALTHCARE SYSTEM
**Versión:** 2.0 (Actualizado con UI Profesional)  
**Fecha Checklist:** 2026-06-23  
**Duración Video:** 15 minutos  

---

## ✅ VERIFICACIÓN PREVIA A GRABACIÓN

### 1. HARDWARE & AMBIENTE
- [ ] Monitor conectado a resolución 1920x1080 o superior
- [ ] Micrófono probado y sin ruido de fondo
- [ ] Auriculares o parlantes para monitoreo de audio
- [ ] Grabadora de pantalla instalada (OBS, Camtasia, ScreenFlow)
- [ ] Grabadora configurada: 1920x1080 @ 30fps, H.264, sin audio
- [ ] Internet estable (para validar conectividad si es necesario)
- [ ] SSD con al menos 5GB de espacio libre

### 2. SOFTWARE COMPILADO
- [ ] BFF: `cd rednorte-bff && .\mvnw.cmd clean compile` ✓ (BUILD SUCCESS)
- [ ] ms-pacientes: `cd rednorte-ms-pacientes && .\mvnw.cmd clean compile` ✓ (BUILD SUCCESS)
- [ ] ms-citas: `cd rednorte-ms-citas && .\mvnw.cmd clean compile` ✓ (BUILD SUCCESS)
- [ ] Frontend: `cd rednorte-frontend && npm run build` ✓ (0 errors, bundles ready)

### 3. BASES DE DATOS
- [ ] H2 databases limpias o con datos seed consistentes
- [ ] No hay conflictos de puertos (8080, 8081, 8082)
- [ ] Puertos disponibles para verificar: `netstat -ano | findstr "8080\|8081\|8082"`

### 4. SERVICIOS INICIADOS (EN ORDEN)
1. **Eureka Service Registry** (opcional pero recomendado)
   ```bash
   cd rednorte-eureka
   .\mvnw.cmd spring-boot:run
   # Esperar: "Tomcat started on port(s): 8761"
   # Verificar: http://localhost:8761 (Eureka Dashboard)
   ```

2. **Microservicio Pacientes**
   ```bash
   cd rednorte-ms-pacientes
   .\mvnw.cmd spring-boot:run
   # Esperar: "Tomcat started on port(s): 8081"
   # Verificar: http://localhost:8081/api/pacientes (debería devolver [])
   ```

3. **Microservicio Citas**
   ```bash
   cd rednorte-ms-citas
   .\mvnw.cmd spring-boot:run
   # Esperar: "Tomcat started on port(s): 8082"
   # Verificar: http://localhost:8082/api/citas (debería devolver [])
   ```

4. **BFF (Backend for Frontend)**
   ```bash
   cd rednorte-bff
   .\mvnw.cmd spring-boot:run
   # Esperar: "Tomcat started on port(s): 8080"
   # Verificar: http://localhost:8080/api/pacientes (debería devolver [])
   ```

5. **Frontend (Vite Dev Server)**
   ```bash
   cd rednorte-frontend
   npm run dev
   # Esperar: "VITE v8.x.x ready in X ms"
   # Verificar: http://localhost:5173 (debería mostrar Centro de Operaciones)
   ```

### 5. VERIFICACIONES FUNCIONALES

#### 5.1 Frontend Appearance
- [ ] Encabezado "Centro de Operaciones Clínicas" visible
- [ ] Badge "Servicios conectados" en verde en esquina superior
- [ ] 4 tarjetas KPI con métricas (Pacientes, Citas, Citas con Paciente, Última Sync)
- [ ] Módulo Pacientes: formulario, buscador, lista
- [ ] Módulo Citas: formulario, buscador, lista
- [ ] Barra de estado al fondo con live-chip "Panel operativo"
- [ ] Paleta de colores coherente (teals, azules, grises)

#### 5.2 Funcionalidad CRUD - Pacientes
- [ ] Crear Paciente: `POST /api/pacientes` → Toast verde
- [ ] Listar Pacientes: tabla se actualiza
- [ ] Editar Paciente: campos se pre-cargan en modal
- [ ] Buscar Pacientes: filtro en tiempo real
- [ ] Eliminar Paciente: DELETE con confirmación

#### 5.3 Funcionalidad CRUD - Citas
- [ ] Crear Cita: `POST /api/citas` → Toast verde
- [ ] Listar Citas: tabla se actualiza
- [ ] Editar Cita: campos se pre-cargan
- [ ] Buscar Citas: filtro en tiempo real
- [ ] Eliminar Cita: DELETE con confirmación

#### 5.4 APIs en Postman
- [ ] GET /api/pacientes → 200 OK, array JSON
- [ ] POST /api/pacientes → 201 CREATED
- [ ] PUT /api/pacientes/{id} → 200 OK
- [ ] DELETE /api/pacientes/{id} → 204 NO CONTENT
- [ ] GET /api/citas → 200 OK, array JSON
- [ ] GET /api/pacientes/{id}/citas → 200 OK (relacional)

#### 5.5 Reportes JaCoCo Accesibles
- [ ] `file:///C:/Users/marce/proyecto-rednorte/rednorte-bff/target/site/jacoco/index.html` 
- [ ] `file:///C:/Users/marce/proyecto-rednorte/rednorte-ms-pacientes/target/site/jacoco/index.html`
- [ ] `file:///C:/Users/marce/proyecto-rednorte/rednorte-ms-citas/target/site/jacoco/index.html`

### 6. DOCUMENTACIÓN ACCESIBLE
- [ ] VS Code abierto con proyecto
- [ ] GatewayController.java visible
- [ ] PacienteController.java visible
- [ ] CitaController.java visible
- [ ] Paciente.java entity visible
- [ ] Cita.java entity visible

### 7. POSTMAN PREPARADO
- [ ] Postman abierto con colección importada
- [ ] Carpeta "Pacientes" expandida con 4 requests
- [ ] Carpeta "Citas" expandida con 4 requests
- [ ] Endpoints relacionales visibles
- [ ] Todas las URLs verificadas (puerto 8080)

---

## 🎬 GUÍA RÁPIDA DE GRABACIÓN POR SEGMENTO

### SEGMENTO 1 (0:00 - 2:30) - ALEJANDRO
**Voice-Over:** Introducción, arquitectura, microservicios, stack tech

**En Pantalla:**
1. Slide intro con título "REDNORTE - HEALTHCARE SYSTEM"
2. PDF: `entregables/arquitectura_microservicios.pdf`
3. Mostrar diagrama durante 2:30 minutos

**Instrucciones Marcelo:**
- Mostrar slide intro: 15 seg
- Abrir PDF arquitectura: 2:15 min (señalar componentes)
- Cerrar PDF al terminar

---

### SEGMENTO 2 (2:30 - 5:30) - MANUEL
**Voice-Over:** Demostración frontend - UI, modules, search, notifications

**En Pantalla:**
1. http://localhost:5173 - Frontend completo
2. Mostrar encabezado + métricas KPI: 30 seg
3. Módulo Pacientes: 35 seg (crear, buscar, listar)
4. Módulo Citas: 25 seg
5. Búsqueda + barra estado: 35 seg
6. Vista completa: 15 seg

**Instrucciones Marcelo:**
- [ ] Encabezado visible 5 seg
- [ ] Scroll a KPI metrics, mostrar 15 seg
- [ ] Scroll a Pacientes: formulario, buscador, lista
- [ ] Crear paciente: "Juan Perez" / RUT: "12345678-9" → Toast verde
- [ ] Scroll a Citas: formulario, buscador, lista
- [ ] Buscador: tipear "Juan" para filtrar, mostrar resultado
- [ ] Buscador: limpiar
- [ ] Scroll a barra status: live-chip verde, botón Refrescar
- [ ] Zoom out (Ctrl+Scroll) para vista completa
- [ ] Mostrar paleta de colores coherente

---

### SEGMENTO 3 (5:30 - 10:30) - ANDRÉS
**Voice-Over:** APIs REST, endpoints, código backend

**En Pantalla:**
1. Postman: colección RedNorte API
2. GET /api/pacientes → ejecutar
3. POST /api/pacientes → ejecutar
4. PUT /api/pacientes/1 → ejecutar
5. DELETE /api/pacientes/1 → ejecutar
6. Endpoints citas (mostrar estructura)
7. Endpoints relacionales
8. VS Code: GatewayController.java
9. VS Code: PacienteController.java

**Instrucciones Marcelo:**
- [ ] Postman: carpeta Pacientes expandida
- [ ] Ejecutar GET → mostrar respuesta 200 OK
- [ ] Ejecutar POST → mostrar respuesta 201 CREATED
- [ ] Ejecutar PUT → mostrar respuesta 200 OK
- [ ] Ejecutar DELETE → mostrar respuesta 204 NO CONTENT
- [ ] Mostrar carpeta Citas (sin ejecutar, solo estructura)
- [ ] Mostrar endpoints relacionales
- [ ] Cambiar a VS Code
- [ ] Abrir GatewayController → scroll mostrando múltiples endpoints
- [ ] Abrir PacienteController → scroll mostrando estructura
- [ ] Abrir Paciente.java entity

---

### SEGMENTO 4 (10:30 - 14:30) - MARCELO
**Voice-Over:** Pruebas unitarias, JaCoCo, cobertura

**En Pantalla:**
1. VS Code: GatewayControllerTest.java
2. Terminal: `mvn clean test` en rednorte-bff
3. Terminal: BUILD SUCCESS
4. Navegador: JaCoCo report rednorte-bff (63.27%)
5. Navegador: JaCoCo report rednorte-ms-pacientes (94.20%)
6. Navegador: JaCoCo report rednorte-ms-citas (94.63%)

**Instrucciones Marcelo:**
- [ ] Abrir GatewayControllerTest.java
- [ ] Zoom para ver estructura: @Test, @Mock, when(...).thenReturn(...)
- [ ] Scroll mostrando múltiples test methods
- [ ] Abrir terminal PowerShell
- [ ] cd rednorte-bff
- [ ] Ejecutar: `.\mvnw.cmd clean test -q`
- [ ] Esperar: "BUILD SUCCESS"
- [ ] Abrir: file:///C:/Users/marce/proyecto-rednorte/rednorte-bff/target/site/jacoco/index.html
- [ ] Mostrar tabla con 63.27%
- [ ] Click en GatewayController → mostrar cobertura por línea
- [ ] Volver a tabla
- [ ] Abrir ms-pacientes JaCoCo → mostrar 94.20%
- [ ] Abrir ms-citas JaCoCo → mostrar 94.63%
- [ ] Volver a mostrar tabla resumen (3 porcentajes)

---

### SEGMENTO 5 (14:00 - 15:00) - MARCELO
**Voice-Over:** Conclusión, logros, despedida

**En Pantalla:**
1. Slide con logo RedNorte y resumen de logros
2. URLs de GitHub repositories
3. Despedida

**Instrucciones Marcelo:**
- [ ] Mostrar slide conclusión: 30 seg
- [ ] Mostrar slide con URLs GitHub: 30 seg
- [ ] Mantener visible hasta final: 0 seg

---

## 📊 TIEMPOS CRÍTICOS

| Segmento | Duración | Hablante | Tiempo Acumulado |
|----------|----------|----------|------------------|
| 1. Intro & Arquitectura | 2:30 | Alejandro | 2:30 |
| 2. Frontend Demo | 3:00 | Manuel | 5:30 |
| 3. APIs & Backend | 5:00 | Andrés | 10:30 |
| 4. Pruebas & JaCoCo | 4:00 | Marcelo | 14:30 |
| 5. Conclusión | 0:30 | Marcelo | 15:00 |

---

## 🎙️ VOICE-OVER - INSTRUCCIONES GRABACIÓN

### ALEJANDRO (Grabación en archivo MP3)
**Duración Total:** 2:30  
**Archivo Output:** `ALEJANDRO_0-2-30.mp3`  
**Velocidad sugerida:** 120-130 palabras/minuto

1. **0:00-0:15** - Introducción (ver guión línea 24-27)
2. **0:15-0:45** - Arquitectura General (ver guión línea 42-49)
3. **0:45-1:30** - Microservicios (ver guión línea 61-68)
4. **1:30-2:00** - Flujo de Datos (ver guión línea 80-87)
5. **2:00-2:30** - Stack Tecnologías (ver guión línea 99-107)

**Notas:** Tono profesional, pausado, con énfasis en arquitectura.

---

### MANUEL (Grabación en archivo MP3)
**Duración Total:** 3:00  
**Archivo Output:** `MANUEL_2-30-5-30.mp3`  
**Velocidad sugerida:** 120-130 palabras/minuto

1. **2:30-2:45** - Startup Frontend (ver guión línea 135-151)
2. **2:45-3:15** - Encabezado & Métricas (ver guión línea 160-180)
3. **3:15-3:50** - Módulo Pacientes (ver guión línea 190-210)
4. **3:50-4:15** - Crear Paciente (ver guión línea 220-235)
5. **4:15-4:40** - Módulo Citas (ver guión línea 245-260)
6. **4:40-5:15** - Búsqueda & Estado (ver guión línea 270-295)
7. **5:15-5:30** - Resumen Frontend (ver guión línea 305-320)

**Notas:** Tono entusiasta, descriptivo para usuarios finales, enfatizar UX.

---

### ANDRÉS (Grabación en archivo MP3)
**Duración Total:** 5:00  
**Archivo Output:** `ANDRES_5-30-10-30.mp3`  
**Velocidad sugerida:** 120-130 palabras/minuto

1. **5:30-6:00** - Colección Postman
2. **6:00-6:45** - GET Pacientes
3. **6:45-7:15** - POST Crear Paciente
4. **7:15-7:45** - PUT Actualizar
5. **7:45-8:15** - DELETE Eliminar
6. **8:15-8:45** - Endpoints Citas
7. **8:45-9:30** - Endpoints Relacionales
8. **9:30-10:00** - Código GatewayController
9. **10:00-10:30** - Código Microservicios

**Notas:** Tono técnico, específico con URLs/métodos HTTP, para desarrolladores.

---

### MARCELO (Grabación en archivo MP3)
**Duración Total:** 4:30 (10:30-15:00)  
**Archivo Output:** `MARCELO_10-30-15-00.mp3`  
**Velocidad sugerida:** 120-130 palabras/minuto

1. **10:30-11:00** - Importancia Tests
2. **11:00-11:45** - Estructura de un Test
3. **11:45-12:15** - Ejecución de Tests
4. **12:15-12:45** - Reporte JaCoCo
5. **12:45-13:30** - Análisis de Cobertura
6. **13:30-14:00** - Conclusión Pruebas
7. **14:00-14:30** - Logros
8. **14:30-15:00** - Despedida

**Notas:** Tono confiado, profesional, amigable. Coherente con pantalla visible.

---

## 🎞️ POSTPRODUCCIÓN

### Paso 1: Exportar Video de Pantalla
```bash
# En OBS o Camtasia, exportar a:
# - Codec: H.264
# - Resolución: 1920x1080
# - FPS: 30
# - Audio: NONE (agregaremos voces después)
# Archivo: rednorte-presentation-15min-no-audio.mp4
```

### Paso 2: Sincronizar Audio Voces
```bash
# En Audacity o Adobe Audition:
# 1. Import video: rednorte-presentation-15min-no-audio.mp4
# 2. File → Import → Audio → ALEJANDRO_0-2-30.mp3 (comienza en 0:00)
# 3. File → Import → Audio → MANUEL_2-30-5-30.mp3 (comienza en 2:30)
# 4. File → Import → Audio → ANDRES_5-30-10-30.mp3 (comienza en 5:30)
# 5. File → Import → Audio → MARCELO_10-30-15-00.mp3 (comienza en 10:30)
# 6. Sincronizar pistas usando timeline
# 7. Ajustar volumen de cada track (equilibrio)
# 8. Export → MP4 (multiplexed video + audio)
```

### Paso 3: Verificación Final
- [ ] Duración total: 15:00 minutos
- [ ] Audio sincronizado con pantalla
- [ ] Sin silencios mayores a 2 segundos
- [ ] Voces claras sin ruido de fondo
- [ ] Transiciones suaves entre segmentos

---

## 🚨 RESOLUCIÓN DE PROBLEMAS

### Problema: Frontend no carga en http://localhost:5173
**Solución:**
```bash
cd rednorte-frontend
npm install  # por si faltan dependencias
npm run dev   # reiniciar dev server
# Esperar "VITE v8.x.x ready"
```

### Problema: BFF no conecta con microservicios
**Solución:**
```bash
# Verificar que ms-pacientes está en 8081
# Verificar que ms-citas está en 8082
# Reiniciar BFF
netstat -ano | findstr "8080\|8081\|8082"  # debe mostrar 3 puertos LISTENING
```

### Problema: H2 base de datos corrupta
**Solución:**
```bash
# Eliminar archivos H2
rm rednorte-bff/target/h2db.*
rm rednorte-ms-pacientes/target/h2db.*
rm rednorte-ms-citas/target/h2db.*
# Reiniciar servicios (crearán nuevas databases)
```

### Problema: Postman colección no sincronizada
**Solución:**
```bash
# Reimportar colección:
# Postman → File → Import → entregables/api-rednorte.postman_collection.json
# Asegurar que URLs tienen puerto correcto (8080)
```

### Problema: Grabadora de pantalla muestra 30fps pero requiere más
**Solución:**
- Reducir resolución a 1280x720 si hay lag
- Cerrar aplicaciones innecesarias
- Usar SSD (no HDD) para grabación
- Reducir bitrate a 5000 kbps si es necesario

---

## ✨ TIPS FINALES

1. **Sincronización:** Practica los tiempos con el guión ANTES de grabar
2. **Errores:** Si cometes un error durante screencast, CORTA y comienza de nuevo ese segmento
3. **Voces:** Graba las voces por SEPARADO en archivos individuales (no vivo)
4. **Calidad:** Prueba grabar un segmento de prueba antes de la grabación final
5. **Respaldo:** Guarda backups de todas las grabaciones
6. **Archivos:** Organiza todos los MP3s en carpeta `entregables/audio/`

---

**ESTADO FINAL:** ✅ TODO LISTO PARA GRABAR

- ✅ Frontend rediseñado y compilado
- ✅ Backend compilado y validado
- ✅ APIs funcionando
- ✅ Reportes JaCoCo accesibles
- ✅ Guión de video actualizado
- ✅ Checklist preparado

**Fecha de preparación:** 2026-06-23  
**Próximo paso:** Ejecutar grabación de pantalla siguiendo SEGMENTO 1 - SEGMENTO 5 en orden
