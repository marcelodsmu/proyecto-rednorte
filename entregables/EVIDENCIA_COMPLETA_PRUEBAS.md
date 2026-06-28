# Evidencia Completa de Pruebas
RedNorte Healthcare System - Evaluacion Parcial 3

Fecha de actualizacion: 28-06-2026

---

## 1. Alcance obligatorio

Este informe consolida pruebas:

1. Unitarias.
2. De integracion.
3. End-to-end.

Con foco en procesos criticos del negocio.

---

## 2. Procesos criticos (business core)

1. Registro de paciente.
2. Actualizacion de datos de paciente.
3. Registro de cita asociada a paciente.
4. Consulta de citas por paciente.
5. Eliminacion y consistencia de datos.

---

## 3. Evidencia de pruebas unitarias

Resumen de cobertura actual:

| Modulo | Cobertura |
|---|---|
| ms-pacientes | 94.20% |
| ms-citas | 94.63% |
| bff | 63.27% |
| Promedio | 83.70% |

Herramientas: JUnit 5, Mockito, JaCoCo.

Referencias:
- entregables/informe_pruebas_unitarias.txt
- reportes JaCoCo por modulo en target/site/jacoco/

---

## 4. Evidencia de pruebas de integracion

Ejecucion automatizada realizada el 28-06-2026 con resultado PASS.

Resumen de ejecucion:

- INT-00 Disponibilidad BFF y microservicios: PASS.
- INT-01 Alta de paciente via BFF: PASS.
- INT-02 Alta de cita asociada: PASS.
- INT-03 Recurso inexistente (no happy path): PASS.

Evidencia:

- entregables/INFORME_PRUEBAS_INTEGRACION_E2E.md
- evidence-tests.ps1

### Caso INT-01: Alta de paciente via BFF

- Objetivo: validar creacion real desde gateway al microservicio y persistencia.
- Entrada: POST /api/pacientes con payload valido.
- Resultado esperado: respuesta exitosa y disponibilidad en GET posterior.
- Evidencia requerida: request/response, log de servicio, validacion en consulta.

### Caso INT-02: Alta de cita asociada

- Objetivo: validar asociacion cita-paciente entre servicios.
- Entrada: POST /api/citas con paciente existente.
- Resultado esperado: cita creada y recuperable por endpoint relacional.
- Evidencia requerida: respuesta de creacion y consulta cruzada.

### Caso INT-03: Error de integracion

- Objetivo: validar manejo de indisponibilidad de servicio.
- Escenario: servicio dependiente no disponible.
- Resultado esperado: mensaje de error controlado, sin caida total.

---

## 5. Evidencia de pruebas end-to-end

Ejecucion E2E automatizada en UI con Playwright realizada el 28-06-2026.

Resumen de ejecucion:

- Caso E2E-UI-01: alta de paciente y cita asociada desde frontend con validacion en API: PASS.
- Caso E2E-UI-02: no happy path de formulario (RUT invalido): PASS.

Evidencia:

- rednorte-frontend/tests/e2e/business-core.spec.js
- rednorte-frontend/playwright-report/index.html
- Comando: npm run test:e2e

### Caso E2E-01: Flujo completo de alta paciente

- Frontend: ingreso de datos en formulario.
- Backend: creacion via BFF.
- Persistencia: verificacion por consulta.

### Caso E2E-02: Flujo completo de alta cita

- Frontend: seleccion de paciente y datos de cita.
- Backend: creacion y asociacion.
- Persistencia: listado actualizado y consulta API.

### Caso E2E-03: Actualizacion y eliminacion

- Frontend: editar y eliminar registro.
- Backend: operaciones reflejadas.
- Persistencia: estado final consistente.

---

## 6. Registro de hallazgos y mejoras

Cada hallazgo debe registrar:

1. Codigo del caso de prueba.
2. Defecto detectado.
3. Impacto en negocio.
4. Cambio implementado.
5. Evidencia posterior a la correccion.

Tabla sugerida:

| Caso | Hallazgo | Cambio aplicado | Estado |
|---|---|---|---|
| INT-03 | Verificacion de no happy path para recurso inexistente | Se incorpora caso automatizado con evidencia ejecutada en reportes | Resuelto |
| E2E-UI-02 | Bug en validador de RUT (digito verificador numerico comparaba number vs string) | Correccion en rednorte-frontend/src/utils/validators.js usando String(V) | Resuelto |

Detalle del bug corregido:

- Archivo: rednorte-frontend/src/utils/validators.js
- Cambio: return String(V) === rut.charAt(rut.length - 1)
- Impacto: ahora se aceptan correctamente RUT validos con digito numerico.

---

## 7. Conclusiones

La validacion de RedNorte cubre pruebas por capas con evidencia ejecutada en unitarias, integracion y end-to-end sobre procesos criticos del negocio. Se documentan resultados, hallazgos y mejoras implementadas para sustentar calidad tecnica y operativa de la solucion.

