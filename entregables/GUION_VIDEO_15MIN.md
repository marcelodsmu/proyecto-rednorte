# Guion de Exposicion del Producto - RedNorte
Duracion objetivo: 15 minutos
Formato: pantalla + voz en off

Objetivo del tono: exponer RedNorte de forma clara, profesional y alineada a la pauta de evaluacion.

---

## 1. Estructura comercial minuto a minuto

### 0:00 a 1:10 - Problema de negocio y propuesta de valor

Pantalla:
1. Titulo del proyecto.
2. Slide con problema actual y solucion RedNorte.

Narracion sugerida:
"Hoy presentamos RedNorte: una plataforma para gestionar pacientes y citas medicas con trazabilidad y control operativo. Esta solucion ataca tres dolores directos: registro lento, duplicidad de informacion y baja visibilidad de la atencion diaria. La propuesta es centralizar el flujo critico en una plataforma moderna, con arquitectura escalable y pruebas de calidad verificables." 

### 1:10 a 3:00 - Arquitectura que reduce riesgo operativo

Pantalla:
1. Diagrama de arquitectura.
2. Eureka en puerto 8761.
3. Frontend, BFF, ms-pacientes, ms-citas.

Narracion sugerida:
"La arquitectura separa responsabilidades para reducir riesgo tecnico. El frontend atiende experiencia de usuario. El BFF en el puerto 8080 centraliza acceso y control. Los microservicios de pacientes y citas operan de forma independiente y se registran en Eureka. Esta estructura permite crecer por modulos, aislar fallas y evolucionar sin detener toda la operacion." 

### 3:00 a 7:20 - Demo funcional orientada a resultado

Pantalla:
1. Frontend en localhost:5173.
2. Alta de paciente.
3. Busqueda y edicion.
4. Alta y gestion de cita.

Narracion sugerida:
"Veamos el valor en accion. Registramos un paciente, lo encontramos en segundos y actualizamos sus datos. Luego creamos una cita asociada y gestionamos su ciclo completo. En terminos de negocio, esto significa menos friccion administrativa, mayor velocidad de atencion y mejor control sobre la agenda clinica." 

### 7:20 a 10:10 - Validacion API y control del dato

Pantalla:
1. Postman con coleccion oficial.
2. GET, POST, PUT, DELETE de pacientes y citas.
3. Consulta de citas por paciente.

Narracion sugerida:
"Ahora validamos la robustez de la capa API. Ejecutamos operaciones CRUD y comprobamos respuestas consistentes. Tambien validamos el endpoint relacional de citas por paciente, clave para reportabilidad y seguimiento clinico. Esto respalda integracion futura con nuevos canales o sistemas externos." 

### 10:10 a 12:20 - Calidad y mantenibilidad

Pantalla:
1. VS Code en controladores y servicios.
2. Configuracion del BFF.

Narracion sugerida:
"A nivel tecnico, la plataforma se construyo para mantenerse en el tiempo. La logica esta desacoplada por capas, el BFF protege al frontend de cambios internos y la estructura por servicios permite crecimiento incremental. En otras palabras, la solucion evita depender de una sola pieza dificil de escalar." 

### 12:20 a 14:20 - Evidencia de pruebas y mitigacion de riesgo

Pantalla:
1. Evidencia de pruebas unitarias.
2. Evidencia de integracion.
3. Evidencia end to end.

Narracion sugerida:
"Para minimizar riesgo de salida a produccion, validamos tres niveles obligatorios: pruebas unitarias, de integracion y end to end. Las pruebas se enfocan en procesos criticos del negocio y registran resultados, hallazgos y mejoras aplicadas. Esto no es una demo aislada: es una solucion controlada con evidencia tecnica." 

### 14:20 a 15:00 - Cierre

Pantalla:
1. Slide final con beneficios.
2. Mensaje de cierre.

Narracion sugerida:
"En conclusion, RedNorte entrega valor operativo inmediato y una base tecnica sostenible. Cumple arquitectura de microservicios, flujo funcional completo y estrategia formal de pruebas. La solucion queda presentada con evidencia tecnica y trazabilidad de resultados. Muchas gracias." 

---

## 2. Mensajes obligatorios de pauta

1. Se ejecutaron pruebas unitarias, de integracion y end to end.
2. Los casos se enfocan en procesos criticos del negocio.
3. Se documentan resultados, hallazgos y mejoras.
4. La arquitectura tiene separacion clara de responsabilidades.
5. La exposicion debe mostrar valor operativo y evidencia verificable.

---

## 3. Frases de impacto recomendadas

1. "Esto reduce riesgo operativo y acelera la atencion."
2. "La inversion queda protegida por una arquitectura escalable."
3. "No mostramos solo una demo; mostramos evidencia de calidad."
4. "La solucion esta lista para avanzar a siguiente etapa." 

---

## 4. Plan de contingencia

1. Si falla frontend, continuar con APIs y retomar interfaz al final.
2. Si falla un servicio, mostrar logs breves y seguir con evidencia de pruebas.
3. Si el tiempo baja de 15 minutos, priorizar valor de negocio + demo + pruebas.

