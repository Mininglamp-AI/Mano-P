param(
    [string]$ModelPath = "models\\mano-4b-quantized.gguf",
    [string]$Prompt = "打开浏览器并搜索 Python"
)

Write-Host "[mano-p run-local] 本地模式运行准备（Windows）..."

# 激活 venv
if (Test-Path ".venv\Scripts\Activate.ps1") { . .\.venv\Scripts\Activate.ps1 }

# 检查模型文件是否存在
if (-not (Test-Path $ModelPath)) {
    Write-Warning "模型文件未找到： $ModelPath 。本地模式需要已下载且量化的模型（GGUF/ggml）。请将模型放在项目的 models 目录下或使用云端模式。"
}

# 优先尝试检测 mano-cua 本地 CLI
$manoCmd = Get-Command mano-cua -ErrorAction SilentlyContinue
if ($manoCmd) {
    Write-Host "使用检测到的 mano-cua 执行本地模式："
    mano-cua run "$Prompt" --local --model $ModelPath
    exit $LASTEXITCODE
}

Write-Host "尝试通过 Python 模块调用本地模式（若已安装）..."
if (Test-Path ".venv\Scripts\python.exe") {
    & .\.venv\Scripts\python.exe -m mano_cua run "$Prompt" --local --model $ModelPath
    exit $LASTEXITCODE
}

Write-Warning "未找到可用的 mano-cua。本地模式可能不可用。可使用云端模式或先安装 CLI/模型。"
