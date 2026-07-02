param(
    [string]$Prompt = "打开浏览器并搜索 Python",
    [string]$ExtraArgs = ""
)

Write-Host "[mano-p run] 尝试以云端模式运行示例任务（兼容多种环境）..."

# 激活虚拟环境（优先）
if (Test-Path ".venv\Scripts\Activate.ps1") {
    Write-Host "激活本地虚拟环境..."
    . .\.venv\Scripts\Activate.ps1
}

# 检查 mano-cua 可执行
$manoCmd = Get-Command mano-cua -ErrorAction SilentlyContinue
if ($manoCmd) {
    Write-Host "检测到 'mano-cua' 可用，执行云端示例任务："
    mano-cua run "$Prompt" $ExtraArgs
    exit $LASTEXITCODE
}

# 尝试 Python 模块方式
if (Test-Path ".venv\Scripts\python.exe") {
    Write-Host "尝试使用虚拟环境中的 Python 模块调用 mano_cua..."
    & .\.venv\Scripts\python.exe -m mano_cua run "$Prompt" $ExtraArgs
    if ($LASTEXITCODE -eq 0) { exit 0 }
}

# 尝试系统 Python3
$py3 = Get-Command python3 -ErrorAction SilentlyContinue
if ($py3) {
    Write-Host "尝试使用系统 python3 -m mano_cua 调用..."
    & python3 -m mano_cua run "$Prompt" $ExtraArgs
    if ($LASTEXITCODE -eq 0) { exit 0 }
}

Write-Warning "未检测到 mano-cua 命令或 mano_cua Python 模块。请先运行 'Setup Python venv (Robust)' 或按 README 指示安装 CLI/依赖。"
