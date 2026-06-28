# Informe de Pruebas de Integracion y E2E (Evidencia Ejecutada)
Fecha: 2026-06-28 09:13:00

## Resumen
- PASS: 5
- FAIL: 0
- WARN: 0

## Resultados por caso
| Caso | Tipo | Nombre | Resultado | Detalle | Timestamp |
|---|---|---|---|---|---|
| INT-00 | Integracion | Disponibilidad BFF y microservicios | PASS | Endpoints /api/pacientes y /api/citas disponibles. | 2026-06-28 09:13:00 |
| INT-01 | Integracion | Alta de paciente via BFF | PASS | Paciente creado con id=1. | 2026-06-28 09:13:00 |
| INT-02 | Integracion | Alta de cita asociada | PASS | Cita creada con id=1 para paciente id=1. | 2026-06-28 09:13:00 |
| INT-03 | Integracion | Manejo de recurso no existente | PASS | El sistema retorno error controlado para paciente inexistente. | 2026-06-28 09:13:00 |
| E2E-00 | E2E | Disponibilidad Frontend | PASS | Frontend accesible en localhost:5173. | 2026-06-28 09:13:00 |

## Hallazgos y mejoras
- Hallazgo 1: Se valida manejo de recurso no existente (no happy path) sin caida total del sistema.
- Hallazgo 2: Se valida flujo critico alta paciente + alta cita asociada con persistencia observable via BFF.

## Trazabilidad
- Script ejecutado: evidence-tests.ps1
- Business core cubierto: alta de paciente, alta de cita asociada, manejo de error por recurso inexistente.
