param(
    [switch]$IncludeRoot
)

$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
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
    if (-not $branch) {
        Write-Host 'No hay rama activa. Omitido.' -ForegroundColor Yellow
        continue
    }

    $status = git -C $repoPath status --porcelain
    if (-not [string]::IsNullOrWhiteSpace(($status | Out-String))) {
        Write-Host "Repositorio con cambios locales en $branch. Omitido para evitar push accidental." -ForegroundColor Yellow
        continue
    }

    git -C $repoPath rev-parse --abbrev-ref --symbolic-full-name '@{u}' *> $null
    if ($LASTEXITCODE -ne 0) {
        Write-Host "No hay upstream para $branch. Omitido." -ForegroundColor Yellow
        continue
    }

    Write-Host "Push origin $branch" -ForegroundColor Green
    git -C $repoPath push origin $branch
}
