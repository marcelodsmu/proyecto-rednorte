param(
    [string]$BffBaseUrl = 'http://localhost:8080'
)

$ErrorActionPreference = 'Stop'

function Invoke-Check {
    param(
        [string]$Name,
        [scriptblock]$Action
    )

    try {
        & $Action
        Write-Host "OK   $Name"
    }
    catch {
        Write-Host "FAIL $Name"
        throw
    }
}

$pacienteId = $null
$citaId = $null

try {
    Invoke-Check -Name 'GET /api/pacientes' -Action {
        Invoke-RestMethod -Method Get -Uri "$BffBaseUrl/api/pacientes" | Out-Null
    }

    Invoke-Check -Name 'GET /api/citas' -Action {
        Invoke-RestMethod -Method Get -Uri "$BffBaseUrl/api/citas" | Out-Null
    }

    Invoke-Check -Name 'POST /api/pacientes' -Action {
        $paciente = Invoke-RestMethod -Method Post -Uri "$BffBaseUrl/api/pacientes" -ContentType 'application/json' -Body '{"nombre":"Smoke","rut":"11-1"}'
        $script:pacienteId = $paciente.id
        if (-not $script:pacienteId) {
            throw 'No se obtuvo id de paciente.'
        }
    }

    Invoke-Check -Name 'PUT /api/pacientes/{id}' -Action {
        Invoke-RestMethod -Method Put -Uri "$BffBaseUrl/api/pacientes/$pacienteId" -ContentType 'application/json' -Body '{"nombre":"Smoke Updated","rut":"11-1"}' | Out-Null
    }

    Invoke-Check -Name 'POST /api/citas' -Action {
        $body = @{
            fecha = '2026-07-15'
            especialidad = 'General'
            idPaciente = $pacienteId
        } | ConvertTo-Json -Compress
        $cita = Invoke-RestMethod -Method Post -Uri "$BffBaseUrl/api/citas" -ContentType 'application/json' -Body $body
        $script:citaId = $cita.id
        if (-not $script:citaId) {
            throw 'No se obtuvo id de cita.'
        }
    }

    Invoke-Check -Name 'PUT /api/citas/{id}' -Action {
        $body = @{
            fecha = '2026-07-16'
            especialidad = 'Neurologia'
            idPaciente = $pacienteId
        } | ConvertTo-Json -Compress
        Invoke-RestMethod -Method Put -Uri "$BffBaseUrl/api/citas/$citaId" -ContentType 'application/json' -Body $body | Out-Null
    }

    Write-Host "PacienteId=$pacienteId"
    Write-Host "CitaId=$citaId"
    Write-Host 'SMOKE_TESTS_OK'
}
finally {
    if ($citaId) {
        try {
            Invoke-RestMethod -Method Delete -Uri "$BffBaseUrl/api/citas/$citaId" | Out-Null
            Write-Host "Cleanup citaId=$citaId"
        }
        catch {
            Write-Host "No se pudo limpiar citaId=$citaId"
        }
    }

    if ($pacienteId) {
        try {
            Invoke-RestMethod -Method Delete -Uri "$BffBaseUrl/api/pacientes/$pacienteId" | Out-Null
            Write-Host "Cleanup pacienteId=$pacienteId"
        }
        catch {
            Write-Host "No se pudo limpiar pacienteId=$pacienteId"
        }
    }
}
