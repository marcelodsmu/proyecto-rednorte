#Requires -Version 5.0
<#
.SYNOPSIS
Inicia el sistema completo de RedNorte: 4 servicios Java + frontend React

.DESCRIPTION
Lanza Eureka, ms-pacientes, ms-citas, BFF y frontend en paralelo.
Espera a que todos estén listos, luego abre automáticamente el navegador.

.PARAMETER TimeoutSec
Segundos para esperar a que los servicios estén listos (default: 180)

.PARAMETER SkipBrowser
No abrir navegador automáticamente

.EXAMPLE
.\start-complete.ps1 -TimeoutSec 180
.\start-complete.ps1 -SkipBrowser
#>

param(
  [int]$TimeoutSec = 180,
  [switch]$SkipBrowser
)

$ErrorActionPreference = 'Stop'
$workspaceRoot = Split-Path -Parent $PSCommandPath

Write-Host "🚀 RedNorte Platform - Iniciando sistema completo..." -ForegroundColor Cyan
Write-Host "Workspace: $workspaceRoot`n" -ForegroundColor Gray

# Obtener ruta absoluta y detalle de cada servicio
$services = @(
  @{ name = 'Eureka (Discovery)'; path = 'rednorte-eureka'; port = 8761; jar = 'target/rednorte_eureka-0.0.1-SNAPSHOT.jar' }
  @{ name = 'ms-pacientes'; path = 'rednorte-ms-pacientes'; port = 8081; jar = 'target/ms_pacientes-0.0.1-SNAPSHOT.jar' }
  @{ name = 'ms-citas'; path = 'rednorte-ms-citas'; port = 8082; jar = 'target/ms_citas-0.0.1-SNAPSHOT.jar' }
  @{ name = 'BFF Gateway'; path = 'rednorte-bff'; port = 8080; jar = 'target/bff_rednorte-0.0.1-SNAPSHOT.jar' }
)

$pids = @()

# Iniciar servicios Java
foreach ($svc in $services) {
  $svcPath = Join-Path $workspaceRoot $svc.path
  $jarPath = Join-Path $svcPath $svc.jar

  if (!(Test-Path $jarPath)) {
    Write-Host "❌ JAR no encontrado: $jarPath" -ForegroundColor Red
    Write-Host "   Ejecuta: cd $svcPath && mvn clean package -DskipTests" -ForegroundColor Yellow
    exit 1
  }

  Write-Host "▶️  Iniciando $($svc.name)..." -ForegroundColor Green

  $env:SPRING_CLOUD_DISCOVERY_ENABLED = 'false'
  $env:EUREKA_CLIENT_ENABLED = 'false'
  $env:EUREKA_CLIENT_REGISTER_WITH_EUREKA = 'false'
  $env:EUREKA_CLIENT_FETCH_REGISTRY = 'false'
  $env:SPRING_DATASOURCE_URL = 'jdbc:h2:mem:reddb;DB_CLOSE_DELAY=-1;DB_CLOSE_ON_EXIT=false'
  $env:SPRING_DATASOURCE_DRIVER_CLASS_NAME = 'org.h2.Driver'
  $env:SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT = 'org.hibernate.dialect.H2Dialect'
  $env:SPRING_JPA_HIBERNATE_DDL_AUTO = 'create-drop'

  $process = Start-Process -FilePath 'java' `
    -ArgumentList "-jar", $jarPath `
    -WorkingDirectory $svcPath `
    -PassThru `
    -NoNewWindow

  $pids += @{ service = $svc.name; pid = $process.Id; port = $svc.port }
}

# Iniciar frontend React (Vite dev server)
$frontendPath = Join-Path $workspaceRoot 'rednorte-frontend'
Write-Host "▶️  Iniciando Frontend (Vite)..." -ForegroundColor Green

$frontendProcess = Start-Process -FilePath 'npm' `
  -ArgumentList 'run', 'dev' `
  -WorkingDirectory $frontendPath `
  -PassThru `
  -NoNewWindow

$pids += @{ service = 'Frontend Vite'; pid = $frontendProcess.Id; port = 5173 }

Write-Host "`n⏳ Esperando a que los servicios estén listos (máx $TimeoutSec segundos)...`n" -ForegroundColor Yellow

# Función para verificar puerto
function Test-Port {
  param([int]$Port)
  try {
    $connection = New-Object System.Net.Sockets.TcpClient
    $connection.Connect('127.0.0.1', $Port)
    $connection.Close()
    return $true
  } catch {
    return $false
  }
}

# Esperar a que todos los puertos estén listos
$startTime = Get-Date
$allReady = $false

while ((New-TimeSpan -Start $startTime -End (Get-Date)).TotalSeconds -lt $TimeoutSec) {
  $readyCount = 0

  foreach ($svc in $pids) {
    if (Test-Port $svc.port) {
      Write-Host "✓ $($svc.service) está listo (puerto $($svc.port))" -ForegroundColor Green
      $readyCount++
    }
  }

  if ($readyCount -eq $pids.Count) {
    $allReady = $true
    break
  }

  Start-Sleep -Seconds 3
}

if (-not $allReady) {
  Write-Host "`n⚠️  Algunos servicios aún se están iniciando. Continúa esperando o abre el navegador manualmente." -ForegroundColor Yellow
}

Write-Host "`n✅ Sistema RedNorte listo!" -ForegroundColor Green
Write-Host "`nServicios activos:" -ForegroundColor Cyan
foreach ($svc in $pids) {
  Write-Host "  • $($svc.service)`t→ http://localhost:$($svc.port)" -ForegroundColor Cyan
}

# Abrir navegador automáticamente
if (-not $SkipBrowser) {
  Write-Host "`n🌐 Abriendo navegador..." -ForegroundColor Cyan
  Start-Sleep -Seconds 2
  Start-Process 'http://localhost:5173'
}

Write-Host "`n📝 Presiona CTRL+C para detener todos los servicios." -ForegroundColor Yellow
Write-Host "Logs aparecerán en las ventanas de PowerShell correspondientes.`n" -ForegroundColor Gray

# Mantener script activo y permitir CTRL+C para limpiar
$null = Read-Host "Presiona Enter cuando quieras detener los servicios"

Write-Host "`n🛑 Deteniendo todos los servicios...`n" -ForegroundColor Red

foreach ($svc in $pids) {
  try {
    Stop-Process -Id $svc.pid -Force -ErrorAction SilentlyContinue
    Write-Host "✓ $($svc.service) detenido" -ForegroundColor Green
  } catch {
    Write-Host "❌ Error deteniendo $($svc.service): $_" -ForegroundColor Red
  }
}

Write-Host "`n✅ Sistema detenido." -ForegroundColor Cyan
