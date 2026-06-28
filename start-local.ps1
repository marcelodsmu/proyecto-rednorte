$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path

function Start-ServiceWindow {
    param(
        [string]$Title,
        [string]$WorkingDir,
        [string[]]$EnvLines,
        [string]$RunLine
    )

    $envScript = if ($EnvLines -and $EnvLines.Count -gt 0) {
        ($EnvLines -join '; ') + '; '
    } else {
        ''
    }

    $command = "Set-Location '$WorkingDir'; $envScript$RunLine"

    Start-Process powershell -ArgumentList @(
        '-NoExit',
        '-Command',
        "`$Host.UI.RawUI.WindowTitle = '$Title'; $command"
    ) | Out-Null
}

# Eureka
Start-ServiceWindow `
    -Title 'rednorte-eureka' `
    -WorkingDir (Join-Path $root 'rednorte-eureka') `
    -EnvLines @() `
    -RunLine '.\mvnw.cmd spring-boot:run'

# ms-pacientes
Start-ServiceWindow `
    -Title 'rednorte-ms-pacientes' `
    -WorkingDir (Join-Path $root 'rednorte-ms-pacientes') `
    -EnvLines @(
        "$env:SPRING_DATASOURCE_URL='jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;MODE=PostgreSQL'",
        "$env:SPRING_DATASOURCE_DRIVER_CLASS_NAME='org.h2.Driver'",
        "$env:SPRING_JPA_HIBERNATE_DDL_AUTO='create-drop'",
        "$env:SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT='org.hibernate.dialect.H2Dialect'",
        "$env:SPRING_CLOUD_DISCOVERY_ENABLED='false'",
        "$env:EUREKA_CLIENT_ENABLED='false'"
    ) `
    -RunLine '.\mvnw.cmd -Pdev spring-boot:run'

# ms-citas
Start-ServiceWindow `
    -Title 'rednorte-ms-citas' `
    -WorkingDir (Join-Path $root 'rednorte-ms-citas') `
    -EnvLines @(
        "$env:SPRING_DATASOURCE_URL='jdbc:h2:mem:testdb;DB_CLOSE_DELAY=-1;MODE=PostgreSQL'",
        "$env:SPRING_DATASOURCE_DRIVER_CLASS_NAME='org.h2.Driver'",
        "$env:SPRING_JPA_HIBERNATE_DDL_AUTO='create-drop'",
        "$env:SPRING_JPA_PROPERTIES_HIBERNATE_DIALECT='org.hibernate.dialect.H2Dialect'",
        "$env:SPRING_CLOUD_DISCOVERY_ENABLED='false'",
        "$env:EUREKA_CLIENT_ENABLED='false'"
    ) `
    -RunLine '.\mvnw.cmd -Pdev spring-boot:run'

# BFF
Start-ServiceWindow `
    -Title 'rednorte-bff' `
    -WorkingDir (Join-Path $root 'rednorte-bff') `
    -EnvLines @(
        "$env:SPRING_CLOUD_DISCOVERY_ENABLED='false'",
        "$env:EUREKA_CLIENT_ENABLED='false'"
    ) `
    -RunLine '.\mvnw.cmd -DskipTests spring-boot:run'

Write-Host 'Se lanzaron 4 terminales (Eureka, ms-pacientes, ms-citas, bff).'
Write-Host 'Espera a que ms-pacientes, ms-citas y bff muestren arranque antes de probar endpoints.'
Write-Host 'Nota: Eureka puede no iniciar y el ciclo local sigue funcionando porque discovery esta desactivado en local.'
