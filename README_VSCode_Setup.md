# VS Code 轻量化部署指南（Windows 11 优化）

目的：在 Windows 11 + VS Code 中以最小改动支持 Mano-P 的快速验证（优先云端模式，支持本地模式预配置）。

先决条件：

- Windows 11
- 已安装 VS Code
- 推荐安装扩展：在 `extensions.json` 中已列出（Python, Pylance, PowerShell, GitLens）。
- Python 3.10+ 可执行（推荐通过官方安装器）

快速步骤：

1. 在 VS Code 中打开工作区：`C:\Users\aa142\Mano-P`
2. 打开命令面板（Ctrl+Shift+P）→ 选择 `Tasks: Run Task` → 运行 `Setup Python venv (Robust)`。
3. 安装完成后，运行 `Run Mano-P (cloud mode)` 来尝试云端执行示例任务。
4. 若要尝试本地模式，请先把量化模型放到 `models\` 下，然后运行 `Run Mano-P (local mode)`。

脚本说明：

- `scripts/setup_venv_robust.ps1`：更可靠地检测 Python 并创建 `.venv`，安装最小依赖。
- `scripts/run_cloud_mode.ps1`：尝试多种方式调用 `mano-cua`（全局 / venv / python3）并运行云端任务。
- `scripts/run_local_mode.ps1`：检测模型并尝试以本地模式运行（需模型及本地 CLI 支持）。

常见问题：

- 如果 `mano-cua` 未安装，建议使用仓库或 Homebrew（macOS）提供的安装方式，或在虚拟环境中安装相应 Python 包。
- 本地模式需要量化模型文件与可能的本地后端（llama.cpp/ggml 或 PyTorch），该部分需按 README 中的本地模型说明处理。
