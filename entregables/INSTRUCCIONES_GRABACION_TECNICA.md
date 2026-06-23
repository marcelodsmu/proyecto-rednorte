# INSTRUCCIONES TÉCNICAS DE GRABACIÓN DE VIDEO
## Para Marcelo (quien graba la pantalla)

---

## 📹 HERRAMIENTAS RECOMENDADAS

### Opción 1: OBS Studio (Gratuito, Recomendado)
- Descargar: https://obsproject.com/download
- Soporta: Windows, Mac, Linux
- Ventajas: Flexible, libre, profesional
- Desventajas: Curva de aprendizaje

**Instalación rápida:**
```
1. Descargar OBS Studio
2. Instalar (siguiendo asistente)
3. Abrir y crear nueva "Scene"
4. Agregar source: "Display Capture" (pantalla completa)
5. Configurar audio: Input (micrófono)
6. Click "Start Recording"
```

### Opción 2: Camtasia (Pago, Más fácil)
- Descargar: https://www.techsmith.com/download/camtasia/
- Precio: ~$99 (prueba gratis 30 días)
- Ventajas: Interfaz intuitiva, editor integrado
- Desventajas: Costo

**Instalación rápida:**
```
1. Instalar Camtasia
2. File → New Recording
3. Seleccionar pantalla completa
4. Click "Record"
5. Al terminar, automáticamente abre editor
```

### Opción 3: Windows 11 Built-in (Más rápido)
- Usar: Windows + Alt + R
- Ventajas: No instalar nada, integrado
- Desventajas: Limitado en opciones
- Ubicación: Carpeta Videos → Captures

---

## ⚙️ CONFIGURACIÓN RECOMENDADA

### Resolución Pantalla:
- **Ideal:** 1920 x 1080 (Full HD)
- **Mínimo:** 1280 x 720 (HD)
- **Cambiar en:** Configuración → Pantalla → Resolución de pantalla

**Verificar tu resolución actual:**
```
Windows + Pausa
O
Configuración → Sistema → Pantalla → Resolución de pantalla
```

### Configuración OBS:

**1. Settings → Output**
```
Output Mode: Advanced (o Simple)
Recording Path: C:\Videos\rednorte-video.mp4
Recording Format: mp4
Audio Encoder: AAC
Video Encoder: NVIDIA NVENC H.264 (si tienes tarjeta NVIDIA)
                o x264 (si no)
Bitrate: 6000-8000 kbps (buena calidad)
```

**2. Settings → Video**
```
Canvas Resolution: 1920x1080
Output Resolution: 1920x1080
FPS: 30
```

**3. Settings → Audio**
```
Sample Rate: 44.1 kHz (estándar)
Channels: Stereo
```

---

## 🎯 CHECKLIST ANTES DE GRABAR

### 30 Minutos Antes:

- [ ] Cierra Slack, Teams, Discord, notificaciones
- [ ] Cierra navegador (excepto lo que vas a mostrar)
- [ ] Cierra email
- [ ] Apaga teléfono o ponlo en silencio
- [ ] Cierra todas las pestañas innecesarias
- [ ] Abre SOLO lo que vas a mostrar

### Software Necesario (Verificar Abierto):

- [ ] Terminal PowerShell lista en: `c:\Users\marce\proyecto-rednorte`
- [ ] Frontend ejecutando: `npm run dev` en rednorte-frontend
  ```powershell
  cd c:\Users\marce\proyecto-rednorte\rednorte-frontend
  npm run dev
  # Debería mostrar: "VITE v8.x.x ready in X ms"
  # URL: http://localhost:5173
  ```

- [ ] Backend ejecutando (abre en otras terminales):
  ```powershell
  # En otra terminal:
  cd c:\Users\marce\proyecto-rednorte\rednorte-eureka
  mvn spring-boot:run -q
  
  # En otra terminal:
  cd c:\Users\marce\proyecto-rednorte\rednorte-bff
  mvn spring-boot:run -q
  
  # En otra terminal:
  cd c:\Users\marce\proyecto-rednorte\rednorte-ms-pacientes
  mvn spring-boot:run -q
  
  # En otra terminal:
  cd c:\Users\marce\proyecto-rednorte\rednorte-ms-citas
  mvn spring-boot:run -q
  
  # Esperar mensajes: "Started Application in X seconds"
  ```

- [ ] Navegador abierto (Google Chrome o Firefox recomendado)
- [ ] VS Code abierto con proyecto
- [ ] Postman abierto con colección importada
- [ ] Micrófono probado (grabar test 5 segundos)

### Resolución & Display:

- [ ] Pantalla en 1920x1080
- [ ] Zoom navegador al 100% (Ctrl+0)
- [ ] Zoom VS Code al 100% (Ctrl+0)
- [ ] Brightness optimizada (no muy oscuro)

---

## 🎬 PROCEDIMIENTO DE GRABACIÓN

### FASE 1: Preparación (5 minutos)

```
1. Abre OBS Studio
2. Crea nueva Scene: "RedNorte Presentation"
3. Agrega source:
   - Type: Display Capture
   - Select: Monitor donde está pantalla principal
4. Configura audio input (micrófono)
5. Haz prueba: Click "Start Recording" → Habla 5 seg → "Stop"
6. Verifica archivo se creó en: C:\Videos\test-recording.mp4
7. Elimina archivo de prueba
```

### FASE 2: Grabación (15 minutos)

```
IMPORTANT: NO GRABES AUDIO AÚN
Grabarás SOLO la pantalla en silencio
Las voces se agregan DESPUÉS

1. En OBS, desactiva Audio Input (o pon en mute)
   Settings → Audio → Desktop Audio Volume: 0%
   Settings → Audio → Mic/Auxiliary Audio: 0%

2. Click "Start Recording"

3. Espera 3 segundos (grabando silencio es OK)

4. Sigue EXACTAMENTE el guión GUION_VIDEO_15MIN.md:
   - Minuto 0:00-2:30: Preparar diapositivas
   - Minuto 2:30-5:30: Navegar frontend
   - Minuto 5:30-10:30: Mostrar Postman y código
   - Minuto 10:30-15:00: Mostrar tests y JaCoCo

5. Mantén ritmo: Si acabas en minuto 14:50, está bien
   Si acabas en minuto 15:10, está bien
   Rango aceptable: 14:45 - 15:15

6. Si cometes error:
   - NO cierres la grabación
   - Continúa desde el siguiente segmento
   - Edita después si es necesario

7. Cuando alcances 15:00:
   - Click "Stop Recording"
   - OBS guarda archivo automáticamente
```

---

## 📍 SECUENCIA DETALLADA (Minuto a Minuto)

### 0:00-2:30 (Alejandro narrará después)
```
[MONTAJE DE PANTALLA]
0:00 - Mostrar slide con título "REDNORTE HEALTHCARE SYSTEM"
       (imagen, PDF o PowerPoint)
       
0:15 - Abrir PDF: arquitectura_microservicios.pdf
       Mantener visible durante explicación de arquitectura
       
1:30 - Mantener PDF visible (ya en parte de microservicios)
       
2:00 - Mantener PDF visible (stack de tecnologías)
       
2:30 - Cerrar PDF (Alt+F4 o botón cerrar)
```

### 2:30-5:30 (Manuel narrará después)
```
[DEMOSTRACIÓN FRONTEND]
2:30 - Abrir navegador o traer a foreground
       URL: http://localhost:5173
       Esperar carga (5 segundos si no está cargado)
       
2:45 - Mostrar tabla de Pacientes (scroll si necesario)
       
3:30 - Click en botón "Nuevo Paciente"
       Esperar que modal se abra
       Mostrar formulario vacío (10 segundos)
       
4:00 - Presionar ESC para cerrar modal
       Click en botón "Editar" de un paciente existente
       Mostrar modal precargado (10 segundos)
       
4:30 - Presionar ESC para cerrar
       Scroll derecho o cambiar vista para mostrar tabla de Citas
       
5:15 - Click en "Nuevo Paciente" de citas
       O "Nuevo Cita" (según nombre del botón)
       Llenar formulario RÁPIDO:
       Nombre/Título: "Test Cita"
       Fecha: Hoy o mañana
       Hora: 10:00
       Etc.
       Click en "Guardar"
       Esperar toast verde (notificación)
```

### 5:30-10:30 (Andrés narrará después)
```
[POSTMAN & CÓDIGO BACKEND]
5:30 - Cambiar a Postman (Alt+Tab)
       
5:45 - En Postman, expandir carpeta "Pacientes"
       Mostrar estructura de requests
       
6:00 - Seleccionar "GET - List Pacientes"
       Verificar URL: http://localhost:8080/api/pacientes
       Click "Send"
       Mostrar respuesta JSON (verde 200 OK)
       
6:45 - Seleccionar "POST - Create Paciente"
       Mostrar URL y Body
       Click "Send"
       Mostrar respuesta 201 CREATED
       
7:15 - Seleccionar "PUT - Update Paciente"
       Mostrar URL con ID y Body
       Click "Send"
       Mostrar respuesta 200 OK
       
7:45 - Seleccionar "DELETE - Delete Paciente"
       Click "Send"
       Mostrar respuesta 204 NO CONTENT
       
8:15 - Expandir carpeta "Citas"
       Mostrar estructura (no ejecutar)
       
8:45 - (Opcional: ejecutar GET Citas para demo)
       
9:30 - Minimizar Postman (Alt+Tab a VS Code)
       
9:30 - En VS Code, abrir archivo:
       rednorte-bff → src → main → java → com → rednorte 
       → bff_rednorte → GatewayController.java
       Mostrar código (scroll lentamente)
       
10:00 - Cambiar a carpeta: rednorte-ms-pacientes
        Abrir: PacienteController.java
        Mostrar (10 segundos)
        
10:10 - Abrir: PacienteService.java
        Mostrar (10 segundos)
        
10:20 - Abrir: Paciente.java (entity)
        Mostrar (10 segundos)
```

### 10:30-14:00 (Marcelo narrará después)
```
[PRUEBAS & JACOCO]
10:30 - En VS Code, navegar a:
        rednorte-bff → src → test → java → 
        com → rednorte → bff_rednorte → 
        GatewayControllerTest.java
        Mostrar archivo (scroll lentamente)
        
11:00 - Scroll para mostrar método: getPacientesSuccess()
        Resaltar: @Test, @Mock, when, then
        Mostrar durante 20 segundos
        
11:45 - Abrir terminal en VS Code (Ctrl+`)
        Ejecutar: cd rednorte-bff
        Ejecutar: mvn clean test -q
        Esperar ejecución (30-60 segundos)
        Mostrar: "BUILD SUCCESS" al final
        
12:45 - Abrir navegador (nueva ventana/pestaña)
        Ir a: file:///C:/Users/marce/proyecto-rednorte/
              rednorte-bff/target/site/jacoco/index.html
        Mostrar tabla de cobertura (63.27%)
        
13:00 - Click en "GatewayController" o clase específica
        Mostrar detalles por clase
        
13:15 - Abrir nueva pestaña:
        file:///C:/Users/marce/proyecto-rednorte/
        rednorte-ms-pacientes/target/site/jacoco/index.html
        Mostrar: 94.20% cobertura
        
13:25 - Abrir nueva pestaña:
        file:///C:/Users/marce/proyecto-rednorte/
        rednorte-ms-citas/target/site/jacoco/index.html
        Mostrar: 94.63% cobertura
        
14:00 - Todas las pestañas de cobertura visibles
        (puede tener 2-3 pestañas abiertas)
        Mostrar durante conclusión
```

### 14:00-15:00 (Marcelo narrará después)
```
[CONCLUSIÓN]
14:00 - Mostrar slide o imagen con título:
        "Logros del Proyecto RedNorte"
        O simplemente la tabla de cobertura
        
14:30 - Mostrar diapositiva o texto con GitHub URLs:
        https://github.com/marcelodsmu/rednorte-frontend
        https://github.com/marcelodsmu/rednorte-bff
        https://github.com/marcelodsmu/rednorte-ms-pacientes
        https://github.com/marcelodsmu/rednorte-ms-citas
        https://github.com/marcelodsmu/rednorte-eureka
        https://github.com/marcelodsmu/proyecto-rednorte
        
15:00 - Mantener URLs visibles
        Video termina cuando Marcelo diga "...fácil de extender"
```

---

## ✅ DESPUÉS DE GRABAR

### Verificación:
```
1. Abrir archivo guardado: C:\Videos\rednorte-video.mp4
   (O ubicación que especificaste en OBS)

2. Reproducir en VLC Media Player o similar
   - ¿Duración correcta? (~15 minutos) ✓
   - ¿Calidad visual? (1920x1080, claro) ✓
   - ¿Sin audio ruido? (silencio OK, lo agregaremos después) ✓
   - ¿Navegación suave? (sin saltos o congelazos) ✓

3. Si todo está bien:
   - Guardar archivo como: rednorte-presentation-15min.mp4
   - Compartir con Alejandro, Manuel, Andrés
   
4. Si hay problema:
   - Opción A: Editar con Camtasia/Adobe (recortar/pegar)
   - Opción B: Regrabar desde inicio
```

### Respaldo:
```
1. Copiar archivo en múltiples ubicaciones:
   - C:\Videos\rednorte-presentation-15min.mp4 (original)
   - Google Drive (backup en nube)
   - USB externo (backup físico)

2. No eliminar nunca hasta que proyecto esté entregado
```

---

## 🎤 COORDINACIÓN CON VOCES

### Archivos de Audio a Esperar:
```
De Alejandro (0:00-2:30):
└─ ALEJANDRO_0-2-30.mp3 (~150 segundos)

De Manuel (2:30-5:30):
└─ MANUEL_2-30-5-30.mp3 (~180 segundos)

De Andrés (5:30-10:30):
└─ ANDRES_5-30-10-30.mp3 (~300 segundos)

De ti Marcelo (10:30-15:00):
└─ MARCELO_10-30-15-00.mp3 (~270 segundos)
```

### Sincronización:
```
1. Después que todos graben sus voces
2. Usar software como Audacity:
   - Importar video como track de audio
   - Importar cada voz como track separado
   - Alinear cada voz a su timestamp
   - Mezclar audios
   - Exportar como MP4

3. Video final tendrá:
   - Video sin audio original (silencio)
   - Voces sincronizadas de los 4
   - Resultado: Video con narración completa
```

---

## 🎯 TIPS PROFESIONALES

- ✓ Graba durante el día (mejor iluminación en pantalla)
- ✓ Zoom en navegador al 100% (ni muy pequeño, ni muy grande)
- ✓ Movimientos de mouse LENTOS (así se ve profesional)
- ✓ Esperas entre clicks (2-3 segundos)
- ✓ Mantén elementos visibles según guión (no cambies rápido)
- ✓ Si se carga lento algo, ESPERA (no aceleres)
- ✓ Usa zoom en texto si está pequeño (Ctrl+Scroll)
- ✓ Muestra ventana maximizada (pantalla completa)

---

## ⚠️ SOLUCIÓN DE PROBLEMAS

### Problema: "OBS no reconoce micrófono"
```
Solución:
1. Settings → Audio → Mic/Auxiliary Audio
2. Dropdown → Selecciona tu micrófono
3. Prueba de nuevo
```

### Problema: "Grabación muy lenta o congelada"
```
Solución:
1. Cierra todas las aplicaciones excepto lo que grabes
2. Disminuye resolución a 1280x720 temporalmente
3. Reduce bitrate en OBS a 4000 kbps
4. Intenta de nuevo
```

### Problema: "Terminal o ventana se ve muy pequeña"
```
Solución:
1. Usa Zoom de Windows: Windows + Plus (+)
2. O zoom en aplicación: Ctrl + Scroll
3. Vuelve a normal después de segmento
```

### Problema: "Sitio web no carga en navegador"
```
Solución:
1. Verificar backend está ejecutando:
   - Eureka en 8761
   - BFF en 8080
   - Ms-pacientes en 8081
   - Ms-citas en 8082
2. Recargar página: F5
3. Limpiar cache: Ctrl+Shift+Delete
4. Esperar 10 segundos y reintentar
```

---

**¡LISTO PARA GRABAR! ADELANTE MARCELO! 🎬**

