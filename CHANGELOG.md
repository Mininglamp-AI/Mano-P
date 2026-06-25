# Changelog

Notable changes to the Mano-P project and its released models. Format loosely follows [Keep a Changelog](https://keepachangelog.com/).

## [Unreleased]

### Documentation

- Added a 🚀 Quick Start section (EN/CN) with Homebrew install and cloud/local run examples
- Embedded the Video-SME-2, MIT1003 & SalECI, ETMD, and Online-Mind2Web benchmark charts above their data tables
- English hero banner now links to the in-page benchmark section instead of an external wiki
- Renamed `pics/MIT1003, SalEC.png` → `pics/MIT1003-SalECI.png`; removed unused `mano-action.jpeg`
- Contribution guidelines now state that `README.md` and `README_CN.md` must be kept in sync

## [1.1] - 2026-06-01

### Models

- Model naming standardized: released weights are now published as **Mano-CUA-4B-Thinking-1.1**, with an **MLX-8bit** variant for on-device inference on Apple Silicon
- Distribution expanded to Hugging Face, ModelScope CN, and ModelScope AI; model links added to the document header

### Benchmarks

- Refreshed all benchmark figures to model version 1.1 — **58.2% on OSWorld** (#1 among specialized GUI agent models), **41.7 NavEval** on WebRetriever Protocol I
- Added Instruct vs Thinking comparison on the 100-task execution suite: Mano-CUA-Thinking-4B 56.0% vs Mano-CUA-Instruct-4B 47.0% pass rate (cloud 83.0%, Qwen3-VL-Plus 39.0%)
- Added local (on-device) vs cloud vs Qwen3-VL task-execution comparison with per-tier and per-category breakdowns

## [1.0] - 2026-03-25

### Added

- Initial public release of the Mano-P project documentation
- Benchmark results: GUI grounding, OSWorld, WebRetriever, perception & cognition (Video-SME-2, MIT1003 & SalECI, ETMD), pruning (Online-Mind2Web / GSPruning), context learning (CL Bench)
- `mano-cua` CLI (Homebrew) and `mano-skill` (ClawHub) usage guides
- Cider inference-acceleration SDK documentation (W8A8 / W4A8 activation quantization for MLX)
- Bilingual README (English / 中文)
