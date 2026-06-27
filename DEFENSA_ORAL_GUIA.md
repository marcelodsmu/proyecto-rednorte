# RedNorte - Guia de Defensa Oral (15 minutos)
Evaluacion Parcial 3: Arquitectura de Microservicios

---

## 1. Reglas vigentes del profesor

- Fecha maxima de entrega de Parcial 3: 29-06-2026 23:59.
- La entrega no se limita a pruebas unitarias.
- Deben incluirse pruebas de integracion y end-to-end en procesos criticos del negocio.
- Presentaciones: 03-07-2026 y 04-07-2026 (se puede presentar antes avisando con al menos 1 dia).
- Video de arquitectura y uso de la solucion: fecha maxima 29-06-2026 23:59.
- Revision por checklist entre pares: fecha maxima 07-07-2026 23:59.
- La presentacion debe incluir PPT y video.

---

## 2. Estructura sugerida de exposicion (15 minutos)

1. Min 0-2: Contexto del problema y arquitectura general.
2. Min 2-5: Frontend y flujo de uso.
3. Min 5-8: APIs y microservicios.
4. Min 8-12: Pruebas unitarias, integracion y end-to-end.
5. Min 12-15: Evidencia, mejoras, bugs detectados y conclusiones.

---

## 3. Contenido obligatorio durante la defensa

- Arquitectura de microservicios y diagrama.
- Integracion frontend-backend.
- Evidencia de persistencia de datos.
- Evidencia de pruebas por capas:
	- Unitarias.
	- Integracion.
	- End-to-end.
- Justificacion de por que esas pruebas cubren el business core.
- Resultados de pruebas y cambios realizados por hallazgos.
- Evidencia de bugs, riesgos o vulnerabilidades detectadas y corregidas.

---

## 4. Preguntas probables y respuestas cortas

### Arquitectura

P: Por que microservicios y no monolito?
R: Permite escalar servicios en forma independiente, separar responsabilidades y aislar fallas.

P: Que rol cumple el BFF?
R: Unifica el acceso del frontend, simplifica contratos y orquesta llamadas a ms-pacientes y ms-citas.

### Pruebas

P: Que diferencia hay entre unitarias, integracion y e2e en su proyecto?
R: Unitarias validan componentes aislados; integracion valida interaccion real entre servicios y BD; e2e valida flujos completos desde UI hasta persistencia.

P: Que flujo critico probaron extremo a extremo?
R: Alta de paciente y creacion de cita asociada; tambien edicion y eliminacion, incluyendo escenarios de error.

P: Que cambio hicieron por un bug encontrado en pruebas?
R: Se ajusto validacion y manejo de errores para evitar respuestas inconsistentes y mejorar feedback al usuario.

### Presentacion

P: Se presenta solo pruebas?
R: No. Se presenta el sistema y se resume el informe de pruebas con evidencia, resultados y mejoras.

P: Se requiere PPT?
R: Si. Debe presentarse PPT y video.

---

## 5. Evidencia que debe estar abierta durante la exposicion

- Diagrama de arquitectura.
- Aplicacion en ejecucion.
- Coleccion Postman y/o OpenAPI.
- Reportes de pruebas unitarias (JaCoCo).
- Evidencia de pruebas de integracion.
- Evidencia de pruebas end-to-end.
- Informe consolidado de pruebas.
- PPT final.

---

## 6. Guion breve para el cierre

"RedNorte entrega una solucion de microservicios funcional y documentada. Ademas de cobertura unitaria, incorporamos pruebas de integracion y end-to-end sobre procesos criticos del negocio, registrando evidencia, hallazgos y mejoras aplicadas. El informe y la presentacion consolidan resultados tecnicos y validacion funcional para sostener una salida robusta."

