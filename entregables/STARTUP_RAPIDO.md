# 🚀 GUÍA RÁPIDA - STARTUP REDNORTE PARA GRABACIÓN

**Última actualización:** 2026-06-23  
**Estado:** ✅ LISTO PARA PRODUCCIÓN

---

## ⚡ STARTUP EN 5 MINUTOS

### 1️⃣ Terminal 1: Eureka Service Registry (Opcional)
```bash
cd C:\Users\marce\proyecto-rednorte\rednorte-eureka
.\mvnw.cmd spring-boot:run
# Esperar: "Tomcat started on port(s): 8761"
# Verificar: http://localhost:8761
```

### 2️⃣ Terminal 2: Microservicio Pacientes
```bash
cd C:\Users\marce\proyecto-rednorte\rednorte-ms-pacientes
.\mvnw.cmd spring-boot:run
# Esperar: "Tomcat started on port(s): 8081"
# Verificar: http://localhost:8081/api/pacientes
```

### 3️⃣ Terminal 3: Microservicio Citas
```bash
cd C:\Users\marce\proyecto-rednorte\rednorte-ms-citas
.\mvnw.cmd spring-boot:run
# Esperar: "Tomcat started on port(s): 8082"
# Verificar: http://localhost:8082/api/citas
```

### 4️⃣ Terminal 4: BFF (Backend for Frontend)
```bash
cd C:\Users\marce\proyecto-rednorte\rednorte-bff
.\mvnw.cmd spring-boot:run
# Esperar: "Tomcat started on port(s): 8080"
# Verificar: http://localhost:8080/api/pacientes
```

### 5️⃣ Terminal 5: Frontend (Vite Dev Server)
```bash
cd C:\Users\marce\proyecto-rednorte\rednorte-frontend
npm run dev
# Esperar: "VITE v8.x.x ready in X ms"
# Abrir: http://localhost:5173
```

---

## ✅ VERIFICACIÓN RÁPIDA

Ejecutar en una nueva terminal:

```bash
# Verificar que todos los puertos están activos
netstat -ano | findstr "8080\|8081\|8082\|8761\|5173"

# Debe mostrar 4-5 líneas con LISTENING status
# Puerto 5173 puede no aparecer en netstat (es Node.js)
```

Abrir en navegador:

| Servicio | URL | Esperado |
|----------|-----|----------|
| Frontend | http://localhost:5173 | Centro de Operaciones Clinicas |
| BFF API | http://localhost:8080/api/pacientes | `[]` (JSON array vacío) |
| Pacientes MS | http://localhost:8081/api/pacientes | `[]` (JSON array vacío) |
| Citas MS | http://localhost:8082/api/citas | `[]` (JSON array vacío) |
| Eureka | http://localhost:8761 | Dashboard con servicios registrados |

---

## 🎬 ANTES DE GRABAR

Completar este checklist:

- [ ] Todos los 5 servicios iniciados (Eureka opcional pero recomendado)
- [ ] Frontend muestra encabezado "Centro de Operaciones Clínicas"
- [ ] Métricas KPI visibles (Pacientes, Citas, Citas con Paciente, Última Sync)
- [ ] Módulos Pacientes y Citas visibles
- [ ] Buscadores funcionan
- [ ] Crear paciente test → toast verde aparece
- [ ] BFF responde en http://localhost:8080/api/pacientes
- [ ] Postman colección lista
- [ ] VS Code abierto con proyecto
- [ ] Grabadora de pantalla configurada
- [ ] Micrófono probado

---

## 🎙️ GRABACIÓN DE VOCES

### Para cada persona:

```bash
# 1. Abrir Audacity
# 2. Generar → Tono silente de 30 segundos (para verificar)
# 3. Grabar audio (micrófono conectado)
# 4. Exportar como MP3:
#    File → Export → Export as MP3
#    - Nombre: NOMBRE_SEGMENTO.mp3
#    - Calidad: 192 kbps, 44100 Hz
# 5. Guardar en: entregables/audio/
```

**Archivos esperados:**
- `entregables/audio/ALEJANDRO_0-2-30.mp3`
- `entregables/audio/MANUEL_2-30-5-30.mp3`
- `entregables/audio/ANDRES_5-30-10-30.mp3`
- `entregables/audio/MARCELO_10-30-15-00.mp3`

---

## 📊 ESTADO ACTUAL DEL PROYECTO

**Frontend:**
- ✅ React 19.2.6 + Vite 8.0.14
- ✅ UI Rediseñada con encabezado profesional
- ✅ Tarjetas KPI con métricas en tiempo real
- ✅ Módulos Pacientes y Citas funcionales
- ✅ Búsqueda en tiempo real
- ✅ Notificaciones toast
- ✅ Responsive design
- ✅ Bundle: 202.65 kB JS (gzip 63.15 kB), 7.83 kB CSS (gzip 2.27 kB)

**Backend (BFF):**
- ✅ Spring Boot 4.0.7 con Java 17
- ✅ 10 endpoints REST funcionales
- ✅ Orquestación hacia microservicios
- ✅ H2 in-memory database
- ✅ Tests: 63.27% cobertura
- ✅ Build: SUCCESS

**Microservicios:**
- ✅ ms-pacientes (puerto 8081): 94.20% cobertura
- ✅ ms-citas (puerto 8082): 94.63% cobertura
- ✅ rednorte-eureka (puerto 8761): Service Registry

**Pruebas:**
- ✅ 14+ métodos de test unitarios
- ✅ JaCoCo reports generados
- ✅ Build validation: 0 errores

---

## 🔄 REINICIO RÁPIDO

Si necesitas reiniciar TODO:

```bash
# Terminal 1: Matar todos los puertos
netstat -ano | findstr "8080\|8081\|8082\|8761"
taskkill /PID <PID> /F  # para cada proceso

# Terminal 2: Limpiar archivos H2
rm C:\Users\marce\proyecto-rednorte\rednorte-bff\target\h2db.*
rm C:\Users\marce\proyecto-rednorte\rednorte-ms-pacientes\target\h2db.*
rm C:\Users\marce\proyecto-rednorte\rednorte-ms-citas\target\h2db.*

# Ahora inicia siguiendo pasos 1-5 arriba
```

---

## 📁 ESTRUCTURA DE ARCHIVOS

```
proyecto-rednorte/
├── rednorte-bff/               (Backend for Frontend)
├── rednorte-ms-pacientes/      (Microservicio Pacientes)
├── rednorte-ms-citas/          (Microservicio Citas)
├── rednorte-eureka/            (Service Registry)
├── rednorte-frontend/          (React + Vite)
└── entregables/
    ├── GUION_VIDEO_15MIN.md    (Script actualizado ✅)
    ├── CHECKLIST_GRABACION.md  (Checklist completo ✅)
    ├── STARTUP_RAPIDO.md       (Este archivo)
    ├── audio/                  (Voces MP3 - agregar aquí)
    └── arquitectura_microservicios.pdf
```

---

## 🎯 OBJETIVO FINAL

**Video de Presentación:** 15 minutos  
**Contenido:** Demostración completa de RedNorte  
**Audiencia:** Profesores/evaluadores  
**Formato:** Screencast + Voice-Over multitrack  
**Estado:** ✅ LISTO

---

## 📞 SOPORTE RÁPIDO

**Si algo no funciona:**

1. Verificar que los 5 servicios estén corriendo (Terminal → Ver puertos)
2. Limpiar H2 databases y reiniciar
3. Hacer `npm install` en rednorte-frontend si hay errores
4. Hacer `mvn clean install` en un microservicio si falla compilación
5. Revisar GUION_VIDEO_15MIN.md para instrucciones detalladas

---

**¡Listo para grabar! Dale con todo. 🚀**
