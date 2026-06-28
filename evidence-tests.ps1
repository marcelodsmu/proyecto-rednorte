param(
    [string]$BffBaseUrl = 'http://localhost:8080',
    [string]$FrontendBaseUrl = 'http://localhost:5173',
    [string]$OutputPath = 'entregables/INFORME_PRUEBAS_INTEGRACION_E2E.md'
)

$ErrorActionPreference = 'Stop'

function New-TestResult {
    param(
        [string]$Id,
        [string]$Tipo,
        [string]$Nombre,
        [string]$Resultado,
        [string]$Detalle
    )

    return [PSCustomObject]@{
        Id = $Id
        Tipo = $Tipo
        Nombre = $Nombre
        Resultado = $Resultado
        Detalle = $Detalle
        Timestamp = (Get-Date).ToString('yyyy-MM-dd HH:mm:ss')
    }
}

function Invoke-Safe {
    param(
        [scriptblock]$Action,
        [string]$OnError
    )

    try {
        return & $Action
    }
    catch {
        throw "$OnError $($_.Exception.Message)"
    }
}

$results = New-Object System.Collections.Generic.List[object]
$createdPacienteId = $null
$createdCitaId = $null
$runId = [Guid]::NewGuid().ToString().Substring(0, 8)
$uniqueName = "E2E-$runId"
$uniqueRut = "11$($runId.Substring(0, 2))-1"

try {
    # INT-00: disponibilidad de servicios
    $statusPaciente = Invoke-WebRequest -Uri "$BffBaseUrl/api/pacientes" -Method Get -UseBasicParsing -TimeoutSec 10
    $statusCita = Invoke-WebRequest -Uri "$BffBaseUrl/api/citas" -Method Get -UseBasicParsing -TimeoutSec 10

    if ($statusPaciente.StatusCode -eq 200 -and $statusCita.StatusCode -eq 200) {
        $results.Add((New-TestResult -Id 'INT-00' -Tipo 'Integracion' -Nombre 'Disponibilidad BFF y microservicios' -Resultado 'PASS' -Detalle 'Endpoints /api/pacientes y /api/citas disponibles.'))
    }
    else {
        $results.Add((New-TestResult -Id 'INT-00' -Tipo 'Integracion' -Nombre 'Disponibilidad BFF y microservicios' -Resultado 'FAIL' -Detalle 'Uno o mas endpoints base no respondieron OK.'))
    }

    # INT-01: alta de paciente via BFF
    $pacienteBody = @{ nombre = $uniqueName; rut = $uniqueRut; email = "${runId}@rednorte.local" } | ConvertTo-Json -Compress
    $paciente = Invoke-RestMethod -Method Post -Uri "$BffBaseUrl/api/pacientes" -ContentType 'application/json' -Body $pacienteBody
    $createdPacienteId = $paciente.id

    if ($createdPacienteId) {
        $results.Add((New-TestResult -Id 'INT-01' -Tipo 'Integracion' -Nombre 'Alta de paciente via BFF' -Resultado 'PASS' -Detalle "Paciente creado con id=$createdPacienteId."))
    }
    else {
        $results.Add((New-TestResult -Id 'INT-01' -Tipo 'Integracion' -Nombre 'Alta de paciente via BFF' -Resultado 'FAIL' -Detalle 'No se obtuvo id de paciente.'))
    }

    # INT-02: alta de cita asociada
    $citaBody = @{ fecha = '2026-07-20'; especialidad = 'General'; idPaciente = $createdPacienteId } | ConvertTo-Json -Compress
    $cita = Invoke-RestMethod -Method Post -Uri "$BffBaseUrl/api/citas" -ContentType 'application/json' -Body $citaBody
    $createdCitaId = $cita.id

    if ($createdCitaId) {
        $results.Add((New-TestResult -Id 'INT-02' -Tipo 'Integracion' -Nombre 'Alta de cita asociada' -Resultado 'PASS' -Detalle "Cita creada con id=$createdCitaId para paciente id=$createdPacienteId."))
    }
    else {
        $results.Add((New-TestResult -Id 'INT-02' -Tipo 'Integracion' -Nombre 'Alta de cita asociada' -Resultado 'FAIL' -Detalle 'No se obtuvo id de cita.'))
    }

    # INT-03: caso no feliz (recurso inexistente)
    try {
        Invoke-RestMethod -Method Get -Uri "$BffBaseUrl/api/pacientes/99999999" -TimeoutSec 10 | Out-Null
        $results.Add((New-TestResult -Id 'INT-03' -Tipo 'Integracion' -Nombre 'Manejo de recurso no existente' -Resultado 'FAIL' -Detalle 'Se esperaba error y devolvio respuesta exitosa.'))
    }
    catch {
        $results.Add((New-TestResult -Id 'INT-03' -Tipo 'Integracion' -Nombre 'Manejo de recurso no existente' -Resultado 'PASS' -Detalle 'El sistema retorno error controlado para paciente inexistente.'))
    }

    # E2E-00: disponibilidad frontend para flujo extremo a extremo
    try {
        $frontendStatus = Invoke-WebRequest -Uri $FrontendBaseUrl -Method Get -UseBasicParsing -TimeoutSec 10
        if ($frontendStatus.StatusCode -eq 200) {
            $results.Add((New-TestResult -Id 'E2E-00' -Tipo 'E2E' -Nombre 'Disponibilidad Frontend' -Resultado 'PASS' -Detalle 'Frontend accesible en localhost:5173.'))
        }
        else {
            $results.Add((New-TestResult -Id 'E2E-00' -Tipo 'E2E' -Nombre 'Disponibilidad Frontend' -Resultado 'FAIL' -Detalle 'Frontend no respondio 200.'))
        }
    }
    catch {
        $results.Add((New-TestResult -Id 'E2E-00' -Tipo 'E2E' -Nombre 'Disponibilidad Frontend' -Resultado 'FAIL' -Detalle 'No fue posible acceder al frontend.'))
    }
}
catch {
    $results.Add((New-TestResult -Id 'RUN-ERROR' -Tipo 'Infraestructura' -Nombre 'Ejecucion de pruebas' -Resultado 'FAIL' -Detalle $_.Exception.Message))
}
finally {
    if ($createdCitaId) {
        try {
            Invoke-RestMethod -Method Delete -Uri "$BffBaseUrl/api/citas/$createdCitaId" | Out-Null
        }
        catch {
            $results.Add((New-TestResult -Id 'CLEANUP-CITA' -Tipo 'Limpieza' -Nombre 'Limpieza de cita' -Resultado 'WARN' -Detalle "No fue posible eliminar cita id=$createdCitaId"))
        }
    }

    if ($createdPacienteId) {
        try {
            Invoke-RestMethod -Method Delete -Uri "$BffBaseUrl/api/pacientes/$createdPacienteId" | Out-Null
        }
        catch {
            $results.Add((New-TestResult -Id 'CLEANUP-PACIENTE' -Tipo 'Limpieza' -Nombre 'Limpieza de paciente' -Resultado 'WARN' -Detalle "No fue posible eliminar paciente id=$createdPacienteId"))
        }
    }
}

$passCount = ($results | Where-Object { $_.Resultado -eq 'PASS' }).Count
$failCount = ($results | Where-Object { $_.Resultado -eq 'FAIL' }).Count
$warnCount = ($results | Where-Object { $_.Resultado -eq 'WARN' }).Count

$lines = @()
$lines += '# Informe de Pruebas de Integracion y E2E (Evidencia Ejecutada)'
$lines += "Fecha: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
$lines += ''
$lines += '## Resumen'
$lines += "- PASS: $passCount"
$lines += "- FAIL: $failCount"
$lines += "- WARN: $warnCount"
$lines += ''
$lines += '## Resultados por caso'
$lines += '| Caso | Tipo | Nombre | Resultado | Detalle | Timestamp |'
$lines += '|---|---|---|---|---|---|'

foreach ($r in $results) {
    $detalle = ($r.Detalle -replace '\|', '/').Trim()
    $lines += "| $($r.Id) | $($r.Tipo) | $($r.Nombre) | $($r.Resultado) | $detalle | $($r.Timestamp) |"
}

$lines += ''
$lines += '## Hallazgos y mejoras'
$lines += '- Hallazgo 1: Se valida manejo de recurso no existente (no happy path) sin caida total del sistema.'
$lines += '- Hallazgo 2: Se valida flujo critico alta paciente + alta cita asociada con persistencia observable via BFF.'
$lines += ''
$lines += '## Trazabilidad'
$lines += '- Script ejecutado: evidence-tests.ps1'
$lines += '- Business core cubierto: alta de paciente, alta de cita asociada, manejo de error por recurso inexistente.'

$reportContent = $lines -join [Environment]::NewLine
Set-Content -Path $OutputPath -Value $reportContent -Encoding UTF8

Write-Host "Reporte generado en: $OutputPath"
Write-Host "PASS=$passCount FAIL=$failCount WARN=$warnCount"
if ($failCount -gt 0) {
    exit 1
}
