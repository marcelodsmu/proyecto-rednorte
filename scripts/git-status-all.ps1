param(
    [switch]$IncludeRoot
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$repos = @(
    'rednorte-eureka',
    'rednorte-bff',
    'rednorte-ms-pacientes',
    'rednorte-ms-citas',
    'rednorte-frontend'
)

if ($IncludeRoot) {
    $repos = @('.') + $repos
}

foreach ($repo in $repos) {
    $repoPath = if ($repo -eq '.') { $root } else { Join-Path $root $repo }
    $repoName = if ($repo -eq '.') { 'proyecto-rednorte (root)' } else { $repo }

    if (-not (Test-Path (Join-Path $repoPath '.git'))) {
        Write-Host "`n=== $repoName ===" -ForegroundColor Yellow
        Write-Host 'No es un repositorio git. Omitido.' -ForegroundColor Yellow
        continue
    }

    Write-Host "`n=== $repoName ===" -ForegroundColor Cyan

    $branch = git -C $repoPath branch --show-current
    if (-not $branch) { $branch = '(sin rama)' }
    Write-Host "Rama actual: $branch"

    $remote = git -C $repoPath remote get-url origin 2>$null
    if ($LASTEXITCODE -eq 0 -and $remote) {
        Write-Host "Origin: $remote"
    } else {
        Write-Host 'Origin: (no configurado)' -ForegroundColor Yellow
    }

    $status = git -C $repoPath status --short
    if ([string]::IsNullOrWhiteSpace(($status | Out-String))) {
        Write-Host 'Estado: limpio' -ForegroundColor Green
    } else {
        Write-Host 'Estado: con cambios' -ForegroundColor Magenta
        $status
    }
}
