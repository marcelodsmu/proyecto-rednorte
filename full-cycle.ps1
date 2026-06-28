param(
    [int]$TimeoutSec = 420,
    [switch]$SkipStart,
    [switch]$SkipStop
)

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function Test-Url {
    param([string]$Url)

    try {
        $resp = Invoke-WebRequest -Uri $Url -Method Get -UseBasicParsing -TimeoutSec 5
        return ($resp.StatusCode -ge 200 -and $resp.StatusCode -lt 500)
    }
    catch {
        return $false
    }
}

function Wait-Ready {
    param([int]$Timeout)

    $targets = @(
        'http://localhost:8081/api/pacientes',
        'http://localhost:8082/api/citas',
        'http://localhost:8080/api/pacientes',
        'http://localhost:8080/api/citas'
    )

    $deadline = (Get-Date).AddSeconds($Timeout)

    while ((Get-Date) -lt $deadline) {
        $allOk = $true
        foreach ($u in $targets) {
            if (-not (Test-Url -Url $u)) {
                $allOk = $false
                break
            }
        }

        if ($allOk) {
            return $true
        }

        Start-Sleep -Seconds 2
    }

    return $false
}

if (-not $SkipStart) {
    Write-Host 'Iniciando servicios locales...'
    & (Join-Path $root 'start-local.ps1')
}

Write-Host "Esperando disponibilidad de servicios (timeout: ${TimeoutSec}s)..."
$ready = Wait-Ready -Timeout $TimeoutSec
if (-not $ready) {
    throw 'Timeout esperando servicios locales.'
}

Write-Host 'Ejecutando smoke tests...'
& (Join-Path $root 'smoke-tests.ps1')

if (-not $SkipStop) {
    Write-Host 'Deteniendo servicios locales...'
    & (Join-Path $root 'stop-local.ps1')
}

Write-Host 'FULL_CYCLE_OK'
