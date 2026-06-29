# Guia Tecnica de Grabacion - RedNorte

Objetivo: grabar un video claro, continuo y evaluable en una sola toma principal de 15 minutos.

---

## 1. Configuracion recomendada

1. Resolucion: 1920x1080.
2. FPS: 30.
3. Formato de salida: MP4 H.264.
4. Audio: 48 kHz, mono o stereo estable.
5. Zoom del sistema: 100% o 110% (no mas).
6. Tamano de fuente en editor y terminal: minimo 14.

---

## 2. Preparacion del escritorio

1. Activa modo no molestar.
2. Cierra chats y notificaciones.
3. Deja solo estas ventanas ancladas:
	- Navegador con frontend (localhost:5173).
	- Navegador con Eureka (localhost:8761).
	- Postman con coleccion cargada.
	- VS Code en backend y frontend.
	- Terminal lista para comandos de inicio.
4. Orden de ventanas sugerido:
	- Monitor 1: navegador principal.
	- Monitor 2 o alternancia: VS Code y Postman.

---

## 3. Ensayo tecnico de 5 minutos

1. Ejecuta inicio de plataforma.
2. Verifica salud de servicios.
3. Crea un paciente de prueba.
4. Crea una cita de prueba asociada.
5. Ejecuta una prueba rapida de API en Postman.
6. Verifica que no aparezcan errores visuales o popups.

Si algo falla, corrige antes de la grabacion final.

---

## 4. Flujo de grabacion recomendado

1. Inicio y contexto del problema.
2. Arquitectura y roles de cada componente.
3. Demo funcional en frontend.
4. Validacion de API desde Postman.
5. Evidencia de pruebas.
6. Cierre con cumplimiento y valor tecnico.

Usa el archivo [GUION_VIDEO_15MIN.md](GUION_VIDEO_15MIN.md) como secuencia principal.

---

## 5. Reglas de calidad durante grabacion

1. No hagas scroll rapido.
2. Mantente 3 a 5 segundos por pantalla clave.
3. Cada vez que cambies de ventana, anuncia que vas a mostrar.
4. No dejes tiempos muertos mayores a 2 segundos.
5. Si te equivocas, repite la frase sin cortar la grabacion.

---

## 6. Recomendaciones para voz en off TTS

1. Velocidad sugerida: 0.92 a 0.97.
2. Tono sugerido: neutro-profesional.
3. Inserta pausas cortas con comas y pausas largas con punto.
4. Evita siglas sin expansion la primera vez.
5. Pronuncia URLs como: localhost, puerto cinco uno siete tres.

Usa [TARJETAS_VOICEOVER.md](TARJETAS_VOICEOVER.md) para copiar y pegar en Loquendo.

---

## 7. Exportacion final

1. Nombre sugerido: REDNORTE_Parcial3_GrupoX.mp4
2. Bitrate sugerido: 8 a 12 Mbps.
3. Revisa video completo antes de subir.
4. Valida que audio y video esten sincronizados.
5. Sube junto con PPT y evidencias solicitadas.

