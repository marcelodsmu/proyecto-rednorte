[CmdletBinding(SupportsShouldProcess = $true)]
param()

$ErrorActionPreference = 'Stop'

$targets = @(
    @{ Name = 'Eureka'; Port = 8761 },
    @{ Name = 'BFF'; Port = 8080 },
    @{ Name = 'ms-pacientes'; Port = 8081 },
    @{ Name = 'ms-citas'; Port = 8082 }
)

function Get-ListeningPidsByPort {
    param([int]$Port)

    $pids = @()

    try {
        $conns = Get-NetTCPConnection -State Listen -LocalPort $Port -ErrorAction Stop
        $pids = $conns | Select-Object -ExpandProperty OwningProcess -Unique
    }
    catch {
        $lines = netstat -ano | Select-String ":$Port"
        foreach ($line in $lines) {
            if ($line -match '^\s*TCP\s+\S+:$Port\s+\S+\s+LISTENING\s+(\d+)\s*$') {
                $pids += [int]$Matches[1]
            }
        }
        $pids = $pids | Select-Object -Unique
    }

    return $pids
}

foreach ($target in $targets) {
    $name = $target.Name
    $port = [int]$target.Port

    $pids = Get-ListeningPidsByPort -Port $port

    if (-not $pids -or $pids.Count -eq 0) {
        Write-Host "SKIP [${name}:${port}] no hay proceso escuchando."
        continue
    }

    foreach ($targetPid in $pids) {
        try {
            $proc = Get-Process -Id $targetPid -ErrorAction Stop
        }
        catch {
            Write-Host "WARN [${name}:${port}] no se pudo leer PID $targetPid."
            continue
        }

        if ($proc.ProcessName -ne 'java') {
            Write-Host "WARN [${name}:${port}] PID $targetPid es '$($proc.ProcessName)'; no se detiene por seguridad."
            continue
        }

        if ($PSCmdlet.ShouldProcess("${name}:${port} PID $targetPid", 'Stop-Process')) {
            try {
                Stop-Process -Id $targetPid -Force -ErrorAction Stop
                Write-Host "STOP [${name}:${port}] detenido PID $targetPid (java)."
            }
            catch {
                Write-Host "FAIL [${name}:${port}] error al detener PID ${targetPid}: $($_.Exception.Message)"
            }
        }
    }
}

Write-Host 'stop-local finalizado.'
