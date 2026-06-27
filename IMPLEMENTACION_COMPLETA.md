# Implementacion Completa - RedNorte

Documento de estado tecnico y plan de cierre para Evaluacion Parcial 3.

---

## 1. Estado de implementacion

- Arquitectura de microservicios implementada.
- Integracion frontend-backend operativa.
- Persistencia de datos implementada.
- CRUD funcional en pacientes y citas.
- Endpoints REST documentados.

---

## 2. Plan de pruebas por capa

### 2.1 Unitarias

Objetivo: validar componentes aislados por modulo.

### 2.2 Integracion

Objetivo: validar interaccion real entre BFF, microservicios y persistencia.

Casos prioritarios:
1. Crear paciente desde BFF y persistir correctamente.
2. Crear cita asociada a paciente existente.
3. Consultar citas por paciente.
4. Manejo de errores de integracion (servicio no disponible, datos invalidos).

### 2.3 End-to-End

Objetivo: validar flujo completo desde frontend hasta base de datos.

Casos prioritarios:
1. Alta de paciente en UI y verificacion en API.
2. Alta de cita en UI y verificacion en API.
3. Busqueda y actualizacion en UI con persistencia real.
4. Eliminacion y verificacion de estado final.

---

## 3. Criterios de evidencia

Para cada prueba registrar:

1. Nombre y objetivo.
2. Entorno y ubicacion de ejecucion.
3. Pasos ejecutados.
4. Resultado esperado y resultado obtenido.
5. Evidencia (captura, log, reporte).
6. Hallazgos de bug/riesgo.
7. Correccion aplicada (si corresponde).

---

## 4. Entrega y presentacion

- Entrega maxima: 29-06-2026 23:59.
- Presentacion: 03-07-2026 y 04-07-2026.
- Formato de presentacion: PPT y video.

---

## 5. Observacion de alcance

El informe de arquitectura se mantiene si no hubo cambios.
Es obligatorio anexar el informe completo de pruebas unitarias, integracion y end-to-end con resultados y mejoras.

