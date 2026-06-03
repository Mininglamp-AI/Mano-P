param(
    [string]$PythonExe = "python"
)

Write-Host "[mano-p setup-robust] Starting environment checks and venv creation..."

function Find-Python {
    param([string]$exe)
    $cmd = Get-Command $exe -ErrorAction SilentlyContinue
    if ($cmd) { return $cmd.Source }
    return $null
}

$pyPath = Find-Python -exe $PythonExe
if (-not $pyPath) {
    Write-Host "尝试查找 'python3'..."
    $pyPath = Find-Python -exe "python3"
}
if (-not $pyPath) {
    Write-Host "尝试查找 'py' 启动器..."
    $pyLauncher = Get-Command py -ErrorAction SilentlyContinue
    if ($pyLauncher) { $pyPath = "$($pyLauncher.Source) -3" }
}

if (-not $pyPath) {
    Write-Error "Could not find a usable Python executable. Please install Python 3.10+ and ensure it is on PATH."
    exit 1
}

Write-Host "Using Python executable: $pyPath"

if (-not (Test-Path -Path ".\.venv")) {
    Write-Host "Creating virtual environment .venv ..."
    & $pyPath -m venv .venv
    if ($LASTEXITCODE -ne 0) { Write-Error "Failed to create virtual environment (exit $LASTEXITCODE)."; exit 1 }
} else { Write-Host ".venv already exists; skipping creation." }

$activate = Join-Path -Path (Get-Location) -ChildPath ".venv\Scripts\Activate.ps1"
if (-not (Test-Path $activate)) {
    Write-Error "Activation script not found: $activate"
    exit 1
}

Write-Host "Activating virtual environment and upgrading pip..."
. $activate
python -m pip install --upgrade pip wheel setuptools

if (Test-Path "requirements.txt") {
    Write-Host "Installing dependencies from requirements.txt..."
    pip install -r requirements.txt
} else {
    Write-Host "No requirements.txt found; installing minimal recommended dependency 'requests'..."
    pip install requests
}

Write-Host 'Environment ready. To activate in current session run: `. .\.venv\Scripts\Activate.ps1`'
