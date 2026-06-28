# Verificacion Oficial de Cumplimiento
Evaluacion Parcial 3: Arquitectura de Microservicios

Fecha de actualizacion: 26-06-2026
Equipo: RedNorte

---

## 1. Indicaciones nuevas del profesor

1. Entrega Parcial 3 hasta 29-06-2026 23:59.
2. Pruebas obligatorias: unitarias, integracion y end-to-end.
3. Enfocar pruebas en procesos criticos del negocio.
4. Entregar informe de pruebas con:
	- que se probo,
	- donde se probo,
	- resultados,
	- bugs/riesgos hallados,
	- mejoras realizadas.
5. Presentacion con PPT y video.

---

## 2. Matriz de cumplimiento

| Requisito | Estado | Evidencia |
|---|---|---|
| Arquitectura de microservicios | Cumple | entregables/arquitectura_microservicios.mmd, entregables/arquitectura_microservicios.pdf |
| Integracion frontend-backend | Cumple | rednorte-frontend + rednorte-bff + microservicios |
| API REST | Cumple | entregables/openapi-rednorte.yaml, entregables/api-rednorte.postman_collection.json |
| Persistencia | Cumple | entregables/descripcion_persistencia.txt |
| Pruebas unitarias | Cumple | entregables/informe_pruebas_unitarias.txt |
| Pruebas de integracion | Cumple | entregables/INFORME_PRUEBAS_INTEGRACION_E2E.md, entregables/EVIDENCIA_COMPLETA_PRUEBAS.md |
| Pruebas end-to-end | Cumple | rednorte-frontend/tests/e2e/business-core.spec.js, rednorte-frontend/playwright-report/index.html, entregables/EVIDENCIA_COMPLETA_PRUEBAS.md |
| Informe consolidado de pruebas | Cumple (en actualizacion) | entregables/EVIDENCIA_COMPLETA_PRUEBAS.md |
| Presentacion en PPT | En cierre final | entregables/PRESENTACION_PARCIAL3_REDNORTE.pptx |
| Video de arquitectura y uso | Pendiente de render final | entregables/GUION_VIDEO_15MIN.md |

---

## 3. Definition of Done para cerrar Parcial 3

1. Ejecutar y registrar pruebas unitarias por modulo.
2. Ejecutar y registrar pruebas de integracion del business core.
3. Ejecutar y registrar pruebas end-to-end del business core.
4. Registrar incidencias relevantes y su correccion.
5. Consolidar informe final de pruebas.
6. Consolidar PPT de presentacion con evidencia visual.
7. Exportar video final y validar duracion/calidad.
8. Subir entrega antes de la fecha limite.

---

## 4. Flujos criticos recomendados para evidencia minima

1. Alta de paciente.
2. Edicion de paciente.
3. Creacion de cita asociada a paciente existente.
4. Consulta de citas por paciente.
5. Manejo de errores de validacion y disponibilidad de servicio.

---

## 5. Confirmacion de alcance de informe

Si la arquitectura no cambia, se mantiene el informe de arquitectura.
Adicionalmente, es obligatorio un informe de pruebas (unitarias, integracion y end-to-end) con justificacion, resultados y mejoras.

