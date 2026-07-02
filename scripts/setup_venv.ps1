param()

Write-Host "[mano-p setup] 检查 Python 可用性..."
$py = Get-Command python -ErrorAction SilentlyContinue
if (-not $py) {
    Write-Error "未找到 'python' 命令，请先在系统安装 Python 并确保已添加到 PATH。"
    exit 1
}

if (-not (Test-Path -Path ".\.venv")) {
    Write-Host "正在创建虚拟环境：.venv"
    python -m venv .venv
} else {
    Write-Host ".venv 已存在，跳过创建。"
}

Write-Host "激活虚拟环境并安装最小依赖（若有 requirements.txt）..."
$activate = Join-Path -Path (Get-Location) -ChildPath ".venv\Scripts\Activate.ps1"
if (Test-Path $activate) {
    & $activate
    if (Test-Path "requirements.txt") {
        Write-Host "找到 requirements.txt，开始安装..."
        pip install -r requirements.txt
    } else {
        Write-Host "未找到 requirements.txt，跳过依赖安装。"
    }
    Write-Host "虚拟环境准备完成。要在当前 PowerShell 会话激活，请运行：`. .\.venv\Scripts\Activate.ps1`"
} else {
    Write-Error "无法找到虚拟环境激活脚本：$activate"
    exit 1
}
