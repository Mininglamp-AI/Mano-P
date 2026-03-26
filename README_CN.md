<div align="center">
    <h1>
      <img src="./pics/logo.png" alt="Mano-P Logo" height="60" style="vertical-align: -15px;">
      Mano-P 1.0
    </h1>
    <p><strong>面向端侧设备的GUI感知智能体模型</strong></p>
    <p><strong>个性化AI</strong></p>
</div>

<hr>

<div align="center">

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/Mininglamp-AI/Mano-P?style=social)](https://github.com/Mininglamp-AI/Mano-P)
[![Paper](https://img.shields.io/badge/arXiv-Technical%20Report-red?logo=arxiv)](https://arxiv.org/abs/2509.17336)

中文 | <a href="README.md">English</a>

**[📖 项目概述](#-项目概述) | [🎬 应用场景](#-应用场景展示) | [🔧 Skills](#-skills) | [🤖 模型](#模型) | [⚗️ 方法](#方法) | [🌟 技术优势](#-技术优势) | [📄 论文引用](#-技术论文与引用) | [❓ FAQ](#-常见问题)**

</div>

---

<div align="center">
  <a href="https://ccnt9oddmvfr.feishu.cn/wiki/QUwbwmUwriHdL4kkyqPcWNaPn9c" target="_blank">
    <img src="pics/Benchmark_Overview.png" alt="GUI Agent Grounding Benchmark" style="max-width: 100%; height: auto;">
  </a>
</div>

---

## 项目概述

**Mano-P**，Mano 是西班牙语里"手"的意思，P 有两重含义：Person（个体）和 Party（组织）。我们相信，个体和组织都能够创造属于自己的个性化 AI，人机协同的美好世界即将到来。

![opensource_architecture.png](pics/opensource_architecture_zh.png)

**Mano-P** 是一个专为边缘设备设计的 GUI-VLA 代理项目。它既是一个开源项目，也是一个硬件产品解决方案。作为开源项目，Mano-P 将面向三类不同的开发者群体，分阶段逐步发布。在第一阶段，我们将开源 Mano-CUA 技能。此阶段的目标用户是Agent爱好者，例如 OpenClaw 或 Claude Code 的用户，使他们能够利用 Mano-CUA 技能的功能构建更智能的 CUA 任务工作流程，并克服人工干预带来的瓶颈。在第二阶段，我们将开源 Mano-CUA 的本地模型和 SDK 组件。此阶段的目标用户是具有高安全性要求的开发者，使他们能够直接使用可在 Mac mini 本地运行推理的 GUI-VLA 模型来构建自定义技能、工具等。**重要的是，所有 CUA 操作都将在本地 Mac mini 上执行，而不会上传到外部服务器**。在第三阶段，我们将开源 Mano-P 模型所使用的训练方法、剪枝和量化技术。此阶段旨在满足开发者特定的模型训练需求，使他们能够应用我们的训练方法，创建符合自身独特需求的本地 GUI-VLA 模型。

关于我们的 GUI-VLA 模型（可在 Mac mini 和 MacBook 设备上直接运行推理），我们目前支持两种部署方式：第一种是直接部署在配备 M4 芯片和 32GB 或以上内存的 Mac mini 或 MacBook 机型上；第二种是使用通过 USB 4.0 或更高版本端口连接的算力棒进行部署。我们将在近期发布这两种部署方式的详细说明，并计划在未来扩展支持范围，纳入更多部署选项。

### 主要能力

- **复杂 GUI 自动化操作**：自主完成包含数百个交互元素的复杂界面操作
- **跨系统数据整合**：无需 API 接口，通过纯视觉交互提取和整合多源数据
- **长任务规划执行**：支持数十步至上百步的企业级业务流程自动化
- **智能报告生成**：自动生成数据分析报告、工作总结等结构化文档

### 技术背景

Mano-P 基于完整的 Mano 项目技术体系（详见 [Mano Technical Report](https://arxiv.org/abs/2509.17336)），采用 Mano-Action 双向自增强学习方法，通过三阶段渐进式训练（SFT → 离线强化学习 → 在线强化学习）和"思考-行动-验证"循环推理机制，配合闭环数据循环系统，实现了高精度的 GUI 理解和操作能力。端侧版本通过混合精度量化、视觉 Token 剪枝和边缘推理自适应等优化，使大参数量模型能够在 Mac mini/MacBook/算力棒等端侧设备上高效运行。

## 🎯 核心亮点

- **OSWorld 基准测试第一**：Mano-P 1.0-72B 在 OSWorld 上取得 **58.2% 成功率**，在所有专用 GUI 智能体模型中排名第一，领先第二名 opencua-72b (45.0%) 达 13.2 个百分点
- **WebRetriever Protocol I 领先**：Mano-P 1.0 取得 **41.7 NavEval 分数**，超越 Gemini 2.5 Pro Computer Use (40.9) 和 Claude 4.5 Computer Use (31.3)
- **完全本地运行**：在**苹果 M4 芯片 + 32GB 内存**的 Mac mini/MacBook 上本地推理，无需云端 API，所有截图和任务数据不出设备
- **高性能推理**：4B 量化模型 (w4a16) 在 Apple M4 Pro 上实现 **476 tokens/s 预填充**和 **76 tokens/s 解码**，峰值内存仅 4.3GB
- **长任务自主执行**：支持**复杂业务流程**的端到端自动化，无需联网

---

## 🎬 应用场景展示

### 场景 1: Mano-afk 全自动化应用构建

https://github.com/user-attachments/assets/7637957d-aa5e-48c1-b823-56ff392181ab

我们演示了mano-afk全自动化应用构建流程。系统接收自然语言需求后，依次完成需求澄清、技术架构设计、代码生成、本地部署及多层级测试（API接口测试、基于LLM的页面视觉检测、以及通过VLA模型驱动的端到端GUI自动化测试）。测试未通过时，系统自动定位问题根因、修复代码并重新部署验证，循环迭代直至所有测试用例通过。全流程无需人工干预，最终交付可运行的应用及完整的需求文档与构建报告。

[![Watch on Bilibili](https://img.shields.io/badge/Watch%20on-Bilibili-00A1D6?logo=bilibili&logoColor=white)](https://www.bilibili.com/video/BV13MQSBQEnS/?share_source=copy_web&vd_source=a259b97248b3127e1c3761e841cae8e1)

### 场景 2: 商业视频智能系统

https://github.com/user-attachments/assets/64c7dca1-973f-4c36-b30e-1f4e0e9e8a03

我们完整演示了一套商业视频智能系统的实际工作流程。从用户下发指令开始，系统自动完成视频生成、上传、分析、剪辑再到二次评测的全过程。过程中，系统可自主操作网页与剪辑软件，完成文件处理、字幕修改等精细操作，并生成包含主观评价与客观指标的分析报告。通过对比初版与精剪版本的差异，直观呈现系统的整体能力与应用效果。

[![Watch on Bilibili](https://img.shields.io/badge/Watch%20on-Bilibili-00A1D6?logo=bilibili&logoColor=white)](https://www.bilibili.com/video/BV183QSBSEgJ/?share_source=copy_web&vd_source=a259b97248b3127e1c3761e841cae8e1)

### 场景 3: 本地模型任务执行

https://github.com/user-attachments/assets/cb3e65be-eaf5-44a5-9f38-1415c12a8a43

Mano-P，小尺寸端上GUI-VLA模型，直接运行在你的电脑上，支持M4芯片及以上的Macmini/Macbook直接推理运行，也支持在即插即用算力棒上直接运行。在CUA场景中，打通Agent工作流人类参与其中的瓶颈。Mano-P，引领AI for Personal/Party第一步。

[![Watch on Bilibili](https://img.shields.io/badge/Watch%20on-Bilibili-00A1D6?logo=bilibili&logoColor=white)](https://www.bilibili.com/video/BV1xzQUBrEtq/?share_source=copy_web&vd_source=a259b97248b3127e1c3761e841cae8e1)

---

## 基准测试性能

**Mano系列模型在多项基准测试上的表现：**

### 1. GUI Grounding

<details>
<summary>📊 展开评测数据</summary>
<br>

![GUI Agent Grounding Benchmark](./pics/GUI_Agent_Grounding_Benchmark.png)

</details>

### 2. BUA & CUA

<details>
<summary>📊 展开评测数据</summary>

#### [OSWorld](https://os-world.github.io/) - Specialized Models

![OS-World-Verified-Specialized-Model.png](pics/OS-World-Verified-Specialized-Model.png)

#### [OSWorld](https://os-world.github.io/) - All Models

![OS-World-Verified-All-Model.png](pics/OS-World-Verified-All-Model.png)

#### [WebRetriever](https://github.com/hhhhhhalf/WebRetriever)

![WebRetriever.png](pics/WebRetriever.png)

</details>

### 3. Perception & Cognition

<details>
<summary>📊 展开评测数据</summary>

#### Video-SME-2

<table>
  <thead>
    <tr>
      <th rowspan="2">Models</th>
      <th rowspan="2">Protocol</th>
      <th colspan="2">CA</th>
      <th colspan="2">CV</th>
      <th colspan="2">PAR</th>
      <th colspan="5">Saliency</th>
    </tr>
    <tr>
      <th>Acc</th>
      <th>F1</th>
      <th>Acc</th>
      <th>F1</th>
      <th>Acc</th>
      <th>F1</th>
      <th>KL↓</th>
      <th>CC↑</th>
      <th>SIM↑</th>
      <th>NSS↑</th>
      <th>AUC↑</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2">Random</td>
      <td>P1</td>
      <td>10.42</td>
      <td>11.03</td>
      <td>10.76</td>
      <td>10.95</td>
      <td>15.94</td>
      <td>16.00</td>
      <td>2.1789</td>
      <td>0.0452</td>
      <td>0.2852</td>
      <td>0.1081</td>
      <td>0.5340</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.01</td>
      <td>10.74</td>
      <td>10.32</td>
      <td>10.50</td>
      <td>14.39</td>
      <td>15.04</td>
      <td>4.3378</td>
      <td>0.0270</td>
      <td>0.2274</td>
      <td>0.0665</td>
      <td>0.5273</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td colspan="13" align="center"><strong>Zero-shot for MLLMs</strong></td>
    </tr>
    <tr>
      <td rowspan="2">GPT4o</td>
      <td>P1</td>
      <td>15.17</td>
      <td>6.57</td>
      <td>16.11</td>
      <td>9.58</td>
      <td>16.71</td>
      <td>10.34</td>
      <td>1.9423</td>
      <td>0.4660</td>
      <td>0.4602</td>
      <td>1.2842</td>
      <td>0.7848</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.26</td>
      <td>4.77</td>
      <td>12.16</td>
      <td>7.66</td>
      <td>15.00</td>
      <td>8.55</td>
      <td>2.2650</td>
      <td>0.4097</td>
      <td>0.4028</td>
      <td>1.2418</td>
      <td>0.7807</td>
    </tr>
    <tr>
      <td rowspan="2">Gemini 2.0 Flash</td>
      <td>P1</td>
      <td>17.18</td>
      <td>5.13</td>
      <td><b>25.06</b></td>
      <td>8.39</td>
      <td>24.94</td>
      <td>9.52</td>
      <td>1.4726</td>
      <td>0.3380</td>
      <td>0.3751</td>
      <td>0.8629</td>
      <td>0.7296</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.45</td>
      <td>4.26</td>
      <td>12.60</td>
      <td>4.95</td>
      <td>15.96</td>
      <td>7.90</td>
      <td>1.6373</td>
      <td>0.3542</td>
      <td>0.3490</td>
      <td>1.0027</td>
      <td>0.7590</td>
    </tr>
    <tr>
      <td rowspan="2">GPT-5.2</td>
      <td>P1</td>
      <td><b>17.83</b></td>
      <td>7.67</td>
      <td>22.22</td>
      <td>12.55</td>
      <td>16.17</td>
      <td>9.74</td>
      <td><b>1.3262</b></td>
      <td>0.4852</td>
      <td>0.4632</td>
      <td>1.3078</td>
      <td>0.7969</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>15.31</td>
      <td>5.14</td>
      <td>19.88</td>
      <td>10.27</td>
      <td>13.56</td>
      <td>7.42</td>
      <td>1.5444</td>
      <td>0.4379</td>
      <td>0.4092</td>
      <td>1.3006</td>
      <td>0.7999</td>
    </tr>
    <tr>
      <td rowspan="2">Claude Sonnet 4.5</td>
      <td>P1</td>
      <td>10.34</td>
      <td>5.8</td>
      <td>13.26</td>
      <td>9.84</td>
      <td>16.02</td>
      <td>9.94</td>
      <td>1.4235</td>
      <td><b>0.4912</b></td>
      <td>0.4213</td>
      <td>1.2956</td>
      <td>0.8042</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.34</td>
      <td>5.55</td>
      <td>13.27</td>
      <td>7.08</td>
      <td>16.02</td>
      <td>9.6</td>
      <td><b>1.2855</b></td>
      <td><b>0.4564</b></td>
      <td>0.4781</td>
      <td>1.3112</td>
      <td>0.7915</td>
    </tr>
    <tr>
      <td rowspan="2">Llama 4 Scout</td>
      <td>P1</td>
      <td>13.98</td>
      <td>9.96</td>
      <td>10.25</td>
      <td>6.51</td>
      <td>13.27</td>
      <td>8.11</td>
      <td>3.7166</td>
      <td>0.3331</td>
      <td>0.3849</td>
      <td>0.8828</td>
      <td>0.7238</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.00</td>
      <td>7.33</td>
      <td>11.10</td>
      <td>8.49</td>
      <td>14.35</td>
      <td>7.42</td>
      <td>3.7434</td>
      <td>0.3019</td>
      <td>0.3452</td>
      <td>0.8848</td>
      <td>0.7258</td>
    </tr>
    <tr>
      <td rowspan="2">Qwen2.5-VL-7B</td>
      <td>P1</td>
      <td>15.88</td>
      <td>5.21</td>
      <td>10.07</td>
      <td>6.07</td>
      <td>12.26</td>
      <td>4.96</td>
      <td>12.0586</td>
      <td>0.0999</td>
      <td>0.2154</td>
      <td>0.2578</td>
      <td>0.5852</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.25</td>
      <td>3.95</td>
      <td>10.89</td>
      <td>5.83</td>
      <td>14.39</td>
      <td>5.73</td>
      <td>12.7596</td>
      <td>0.0762</td>
      <td>0.1855</td>
      <td>0.2195</td>
      <td>0.5753</td>
    </tr>
    <tr>
      <td rowspan="2">InternVL3-8B</td>
      <td>P1</td>
      <td>13.35</td>
      <td>7.78</td>
      <td>14.71</td>
      <td>8.02</td>
      <td>10.20</td>
      <td>6.95</td>
      <td>12.6480</td>
      <td>0.0572</td>
      <td>0.1895</td>
      <td>0.1140</td>
      <td>0.5769</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>10.58</td>
      <td>6.70</td>
      <td>10.94</td>
      <td>8.12</td>
      <td>12.68</td>
      <td>6.32</td>
      <td>12.1385</td>
      <td>0.0604</td>
      <td>0.1819</td>
      <td>0.1395</td>
      <td>0.5859</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td colspan="13" align="center"><strong>Fine-tune for MLLMs</strong></td>
    </tr>
    <tr>
      <td rowspan="2">Qwen2.5-VL-7B</td>
      <td>P1</td>
      <td>22.51</td>
      <td>19.11</td>
      <td>23.39</td>
      <td>10.83</td>
      <td>32.06</td>
      <td>25.88</td>
      <td>1.5091</td>
      <td>0.6953</td>
      <td>0.6118</td>
      <td>1.8937</td>
      <td>0.8579</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>13.72</td>
      <td>13.25</td>
      <td>13.03</td>
      <td>10.94</td>
      <td>21.24</td>
      <td>20.65</td>
      <td>2.2496</td>
      <td>0.5359</td>
      <td>0.4793</td>
      <td>1.6439</td>
      <td>0.8221</td>
    </tr>
    <tr>
      <td rowspan="2">InternVL3-8B</td>
      <td>P1</td>
      <td>20.94</td>
      <td>18.41</td>
      <td>21.96</td>
      <td>11.02</td>
      <td>30.33</td>
      <td>24.66</td>
      <td>1.2551</td>
      <td>0.7014</td>
      <td>0.6340</td>
      <td>1.9896</td>
      <td>0.8670</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>12.81</td>
      <td>11.83</td>
      <td>12.16</td>
      <td>11.11</td>
      <td>19.26</td>
      <td>19.27</td>
      <td>1.8759</td>
      <td>0.6282</td>
      <td>0.5467</td>
      <td>2.0621</td>
      <td>0.8627</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td colspan="13" align="center"><strong>Mano-P 1.0</strong></td>
    </tr>
    <tr>
      <td rowspan="2">Stage I</td>
      <td>P1</td>
      <td>31.27</td>
      <td>30.53</td>
      <td>27.31</td>
      <td>25.18</td>
      <td>35.16</td>
      <td>34.45</td>
      <td>0.6794</td>
      <td>0.7670</td>
      <td>0.7015</td>
      <td>2.1347</td>
      <td>0.8710</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>21.89</td>
      <td>22.06</td>
      <td>18.27</td>
      <td>18.57</td>
      <td>23.77</td>
      <td>23.87</td>
      <td>1.5759</td>
      <td>0.6482</td>
      <td>0.6167</td>
      <td>2.1021</td>
      <td>0.8627</td>
    </tr>
    <tr>
      <td rowspan="2">Stage II</td>
      <td>P1</td>
      <td>32.59</td>
      <td>31.46</td>
      <td>27.57</td>
      <td>25.76</td>
      <td>37.73</td>
      <td>35.79</td>
      <td>0.6736</td>
      <td>0.7686</td>
      <td>0.7120</td>
      <td>2.1688</td>
      <td>0.8853</td>
    </tr>
    <tr>
      <td>P2</td>
      <td>20.55</td>
      <td>21.26</td>
      <td>15.37</td>
      <td>15.15</td>
      <td>25.36</td>
      <td>25.83</td>
      <td>0.5617</td>
      <td>0.6440</td>
      <td>0.6130</td>
      <td>2.1090</td>
      <td>0.8602</td>
    </tr>
    <tr>
      <td rowspan="2">Stage III</td>
      <td>P1</td>
      <td><strong>34.58</strong></td>
      <td><strong>33.99</strong></td>
      <td><strong>31.92</strong></td>
      <td><strong>28.37</strong></td>
      <td><strong>39.42</strong></td>
      <td><strong>37.63</strong></td>
      <td><strong>0.6073</strong></td>
      <td><strong>0.7853</strong></td>
      <td><strong>0.7248</strong></td>
      <td><strong>2.2103</strong></td>
      <td><strong>0.8938</strong></td>
    </tr>
    <tr>
      <td>P2</td>
      <td><strong>25.29</strong></td>
      <td><strong>25.83</strong></td>
      <td><strong>20.21</strong></td>
      <td><strong>19.29</strong></td>
      <td><strong>26.49</strong></td>
      <td><strong>26.54</strong></td>
      <td><strong>1.4617</strong></td>
      <td><strong>0.6725</strong></td>
      <td><strong>0.6330</strong></td>
      <td><strong>2.1788</strong></td>
      <td><strong>0.8776</strong></td>
    </tr>
  </tbody>
</table>

#### MIT1003 & SalECI

<table>
  <thead>
    <tr>
      <th rowspan="2" style="text-align: center;">Dataset</th>
      <th rowspan="2" style="text-align: center;">Method</th>
      <th colspan="5" style="text-align: center;">Saliency</th>
    </tr>
    <tr>
      <th style="text-align: center;">KL↓</th>
      <th style="text-align: center;">CC↑</th>
      <th style="text-align: center;">SIM↑</th>
      <th style="text-align: center;">NSS↑</th>
      <th style="text-align: center;">AUC↑</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="7" style="text-align: left;">MIT1003</td>
      <td style="text-align: left;">FastSal</td>
      <td style="text-align: center;">1.036</td>
      <td style="text-align: center;">0.590</td>
      <td style="text-align: center;">0.478</td>
      <td style="text-align: center;">2.008</td>
      <td style="text-align: center;">0.875</td>
    </tr>
    <tr>
      <td style="text-align: left;">SAM-Resnet</td>
      <td style="text-align: center;">1.247</td>
      <td style="text-align: center;">0.746</td>
      <td style="text-align: center;">0.597</td>
      <td style="text-align: center;">2.752</td>
      <td style="text-align: center;">0.902</td>
    </tr>
    <tr>
      <td style="text-align: left;">DAV</td>
      <td style="text-align: center;">0.753</td>
      <td style="text-align: center;">0.699</td>
      <td style="text-align: center;">0.566</td>
      <td style="text-align: center;">2.574</td>
      <td style="text-align: center;">0.897</td>
    </tr>
    <tr>
      <td style="text-align: left;">UNISAL</td>
      <td style="text-align: center;">1.014</td>
      <td style="text-align: center;">0.734</td>
      <td style="text-align: center;">0.597</td>
      <td style="text-align: center;">2.759</td>
      <td style="text-align: center;">0.902</td>
    </tr>
    <tr>
      <td style="text-align: left;">Transalnet</td>
      <td style="text-align: center;">0.660</td>
      <td style="text-align: center;">0.722</td>
      <td style="text-align: center;">0.592</td>
      <td style="text-align: center;">2.631</td>
      <td style="text-align: center;">0.903</td>
    </tr>
    <tr>
      <td style="text-align: left;">SUM</td>
      <td style="text-align: center;"><strong>0.563</strong></td>
      <td style="text-align: center;">0.768</td>
      <td style="text-align: center;">0.630</td>
      <td style="text-align: center;">2.839</td>
      <td style="text-align: center;"><strong>0.913</strong></td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>Mano-P 1.0</strong></td>
      <td style="text-align: center;">0.648</td>
      <td style="text-align: center;"><strong>0.770</strong></td>
      <td style="text-align: center;"><strong>0.698</strong></td>
      <td style="text-align: center;"><strong>2.950</strong></td>
      <td style="text-align: center;">0.902</td>
    </tr>
  </tbody>
  <tbody>
    <tr>
      <td rowspan="7" style="text-align: left;">SalECI </td>
      <td style="text-align: left;">SSM</td>
      <td style="text-align: center;">0.720</td>
      <td style="text-align: center;">0.599</td>
      <td style="text-align: center;">0.611</td>
      <td style="text-align: center;">1.396</td>
      <td style="text-align: center;">0.830</td>
    </tr>
    <tr>
      <td style="text-align: left;">DeepGaze IIE</td>
      <td style="text-align: center;">0.995</td>
      <td style="text-align: center;">0.560</td>
      <td style="text-align: center;">0.399</td>
      <td style="text-align: center;">1.327</td>
      <td style="text-align: center;">0.842</td>
    </tr>
    <tr>
      <td style="text-align: left;">EML-NET</td>
      <td style="text-align: center;">1.220</td>
      <td style="text-align: center;">0.510</td>
      <td style="text-align: center;">0.536</td>
      <td style="text-align: center;">1.232</td>
      <td style="text-align: center;">0.807</td>
    </tr>
    <tr>
      <td style="text-align: left;">Transalnet</td>
      <td style="text-align: center;">0.873</td>
      <td style="text-align: center;">0.717</td>
      <td style="text-align: center;">0.534</td>
      <td style="text-align: center;">1.723</td>
      <td style="text-align: center;">0.824</td>
    </tr>
    <tr>
      <td style="text-align: left;">Temp-Sal</td>
      <td style="text-align: center;">0.712</td>
      <td style="text-align: center;">0.719</td>
      <td style="text-align: center;">0.629</td>
      <td style="text-align: center;"><strong>1.768</strong></td>
      <td style="text-align: center;">0.813</td>
    </tr>
    <tr>
      <td style="text-align: left;">SSwinTransformer</td>
      <td style="text-align: center;">0.652</td>
      <td style="text-align: center;">0.687</td>
      <td style="text-align: center;">0.606</td>
      <td style="text-align: center;">1.701</td>
      <td style="text-align: center;"><strong>0.868</strong></td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>Mano-P 1.0</strong></td>
      <td style="text-align: center;"><strong>0.615</strong></td>
      <td style="text-align: center;"><strong>0.769</strong></td>
      <td style="text-align: center;"><strong>0.695</strong></td>
      <td style="text-align: center;">1.735</td>
      <td style="text-align: center;">0.868</td>
    </tr>
  </tbody>
</table>

#### ETMD

##### **Saliency Metrics**

<table>
  <thead>
    <tr>
      <th rowspan="2" style="text-align: left;">Methods</th>
      <th colspan="4" style="text-align: center;">Saliency</th>
    </tr>
    <tr>
      <th style="text-align: center;">CC ↑</th>
      <th style="text-align: center;">SIM ↑</th>
      <th style="text-align: center;">NSS ↑</th>
      <th style="text-align: center;">AUC ↑</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left;">ACLNet</td>
      <td style="text-align: center;">0.477</td>
      <td style="text-align: center;">0.329</td>
      <td style="text-align: center;">2.36</td>
      <td style="text-align: center;">0.915</td>
    </tr>
    <tr>
      <td style="text-align: left;">TASED-Net</td>
      <td style="text-align: center;">0.479</td>
      <td style="text-align: center;">0.366</td>
      <td style="text-align: center;">2.63</td>
      <td style="text-align: center;">0.916</td>
    </tr>
    <tr>
      <td style="text-align: left;">STAViS</td>
      <td style="text-align: center;">0.569</td>
      <td style="text-align: center;">0.425</td>
      <td style="text-align: center;">2.94</td>
      <td style="text-align: center;">0.931</td>
    </tr>
    <tr>
      <td style="text-align: left;">ViNet</td>
      <td style="text-align: center;">0.569</td>
      <td style="text-align: center;">0.409</td>
      <td style="text-align: center;">3.06</td>
      <td style="text-align: center;">0.928</td>
    </tr>
    <tr>
      <td style="text-align: left;">CASP-Net</td>
      <td style="text-align: center;">0.620</td>
      <td style="text-align: center;">0.478</td>
      <td style="text-align: center;"><strong>3.34</strong></td>
      <td style="text-align: center;"><strong>0.940</strong></td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>Mano-P 1.0</strong></td>
      <td style="text-align: center;"><strong>0.642</strong></td>
      <td style="text-align: center;"><strong>0.481</strong></td>
      <td style="text-align: center;">2.99</td>
      <td style="text-align: center;">0.929</td>
    </tr>
  </tbody>
</table>

##### **Emotion Recognition**

<table>
  <thead>
    <tr>
      <th rowspan="2" style="text-align: left;"></th>
      <th colspan="2" style="text-align: center;">Emotion Valence</th>
      <th colspan="2" style="text-align: center;">Emotion Arousal</th>
    </tr>
    <tr>
      <th style="text-align: center;">Acc ↑</th>
      <th style="text-align: center;">Acc ± 1 ↑</th>
      <th style="text-align: center;">Acc ↑</th>
      <th style="text-align: center;">Acc ± 1 ↑</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td style="text-align: left;">Qwen2.5-VL-7B</td>
      <td style="text-align: center;">13.3</td>
      <td style="text-align: center;">38.1</td>
      <td style="text-align: center;">10.8</td>
      <td style="text-align: center;">35.5</td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>Mano-P 1.0</strong></td>
      <td style="text-align: center;"><strong>20.2</strong></td>
      <td style="text-align: center;"><strong>46.5</strong></td>
      <td style="text-align: center;"><strong>18.7</strong></td>
      <td style="text-align: center;"><strong>47.3</strong></td>
    </tr>
  </tbody>
</table>

</details>

### 4. Pruning

<details>
<summary>📊 展开评测数据</summary>

#### Online-Mind2Web

**对比Online-Mind2Web基准测试中任务执行成功率（SR）**
_Avg. Tokens/img_ 表示每张图片的平均视觉 token 保留率；值越低表示剪枝越激进。

**GSPruning** 是一种新型的token剪枝方法，专为视觉语言模型设计，通过保留全局空间锚点维持网页结构骨架，并识别语义异常值来捕获关键UI元素，从而高效处理高分辨率网页界面。该方法在性能损失极小的情况下实现了2-3倍的吞吐量提升，为构建高效的自主网页智能体设立了新的技术标杆。

<table>
  <thead>
    <tr>
      <th style="text-align: left;">Model</th>
      <th style="text-align: left;">Method</th>
      <th style="text-align: center;">Avg. Tokens<br>/img ↓</th>
      <th style="text-align: center;">Training<br>samples/s ↑</th>
      <th style="text-align: center;">SR (↑)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="10" style="text-align: left;">Qwen3VL-2B</td>
      <td style="text-align: left;">Baseline (w/o FT)</td>
      <td style="text-align: center;">100%</td>
      <td style="text-align: center;">5.08</td>
      <td style="text-align: center;">0.290</td>
    </tr>
    <tr>
      <td style="text-align: left;">Baseline (FT)</td>
      <td style="text-align: center;">100%</td>
      <td style="text-align: center;">5.09</td>
      <td style="text-align: center;">0.390</td>
    </tr>
    <tr>
      <td style="text-align: left;">TextGuide</td>
      <td style="text-align: center;">12.55%</td>
      <td style="text-align: center;">13.54</td>
      <td style="text-align: center;">0.310</td>
    </tr>
    <tr>
      <td style="text-align: left;">FlashVLM</td>
      <td style="text-align: center;">12.55%</td>
      <td style="text-align: center;">17.01</td>
      <td style="text-align: center;">0.343</td>
    </tr>
    <tr>
      <td style="text-align: left;">Compressor-VLA</td>
      <td style="text-align: center;">13.33%</td>
      <td style="text-align: center;">16.92</td>
      <td style="text-align: center;">0.293</td>
    </tr>
    <tr>
      <td style="text-align: left;">HiPrune</td>
      <td style="text-align: center;">25.09%</td>
      <td style="text-align: center;">16.67</td>
      <td style="text-align: center;">0.333</td>
    </tr>
    <tr>
      <td style="text-align: left;">PDrop</td>
      <td style="text-align: center;">41.47%</td>
      <td style="text-align: center;">10.43</td>
      <td style="text-align: center;">0.330</td>
    </tr>
    <tr>
      <td style="text-align: left;">IVC</td>
      <td style="text-align: center;">25.09%</td>
      <td style="text-align: center;">7.89</td>
      <td style="text-align: center;">0.303</td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>Mano-P 1.0</strong></td>
      <td style="text-align: center;">25.09%</td>
      <td style="text-align: center;">20.04</td>
      <td style="text-align: center;">0.370</td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>Mano-P 1.0</strong></td>
      <td style="text-align: center;"><strong>12.57%</strong></td>
      <td style="text-align: center;"><strong>22.62</strong></td>
      <td style="text-align: center;">0.336</td>
    </tr>
    <tr>
      <td rowspan="4" style="text-align: left; background-color: white;">Qwen3VL-4B</td>
      <td style="text-align: left;">Baseline (FT)</td>
      <td style="text-align: center;">100%</td>
      <td style="text-align: center;">3.24</td>
      <td style="text-align: center;"><strong>0.425</strong></td>
    </tr>
    <tr>
      <td style="text-align: left;">PDrop</td>
      <td style="text-align: center;">41.47%</td>
      <td style="text-align: center;">5.58</td>
      <td style="text-align: center;">0.365</td>
    </tr>
    <tr>
      <td style="text-align: left;">IVC</td>
      <td style="text-align: center;"><strong>25.09%</strong></td>
      <td style="text-align: center;">4.67</td>
      <td style="text-align: center;">0.343</td>
    </tr>
    <tr>
      <td style="text-align: left;"><strong>GSPruning</strong></td>
      <td style="text-align: center;"><strong>25.09%</strong></td>
      <td style="text-align: center;"><strong>16.72</strong></td>
      <td style="text-align: center;">0.400</td>
    </tr>
  </tbody>
</table>

</details>

### 5. Context Learning

<details>
<summary>📊 展开评测数据</summary>

#### [CL Bench](https://github.com/Tencent-Hunyuan/CL-bench)

![CL-bench.png](pics/CL-bench.png)

</details>

---

# 🔧 Skills

**Mano-Skill** 是基于 Mano 模型的桌面 GUI 自动化工具，通过自然语言驱动跨平台图形界面操作。同一个核心能力，我们提供了三种不同的使用形式，以适配不同的使用场景和用户群体。

---

## 📦 核心能力概述

### 功能特性

- **自然语言驱动**：用户通过自然语言描述任务，系统自动执行GUI操作
- **灵活的推理模式**：
  - **本地模式**：模型在本地运行，数据不出设备，快速响应 - 直接在 Mac mini/MacBook（M4 芯片及以上，32GB+ 内存）上运行 - 或使用 Mano-P 算力棒（通过 USB 4.0 连接）
  - **云端模式**：未配置本地模型时，使用云端 API 服务 (`mano.mininglamp.com`)
  - 系统自动检测本地模型配置，无缝切换推理模式
- **全方位交互支持**：点击、输入、热键、滚动、拖拽、鼠标移动、截图、等待、应用启动、URL跳转
- **跨平台支持**：macOS（稳定）、Windows、Linux（Beta）

### 工作原理

**本地模式**

1. 捕获当前屏幕截图
2. 在本地设备（Mac mini/MacBook）或算力棒上运行 Mano-P 模型进行推理
3. 本地模型分析并返回下一步操作指令
4. 客户端执行操作（点击、输入等）
5. 循环执行直到任务完成

**云端模式（默认）**

1. 捕获当前屏幕截图
2. 发送截图和任务描述到云端视觉模型 (`mano.mininglamp.com`)
3. 云端模型分析并返回下一步操作指令
4. 本地客户端执行操作（点击、输入等）
5. 循环执行直到任务完成

### 数据隐私与安全

**本地模式（Mac mini/MacBook 或算力棒）：**

- ✅ **完全本地运行**：所有数据处理在本地完成，截图和任务描述完全不上云
- ✅ **数据不出设备**：不访问或传输任何数据到外部服务器
- ✅ **最高隐私保护**：适合处理敏感信息和高安全要求场景

**云端模式：**

- ⚠️ **发送数据**：截图和任务描述发送到 `mano.mininglamp.com` 进行实时视觉分析
- ✅ **不发送数据**：不访问或传输本地文件、剪贴板内容、系统凭证
- ⚠️ **隐私提示**：运行任务时避免在屏幕上显示敏感文档、聊天记录或凭证信息

**通用保障：**

- ✅ **开源可审计**：完整源代码公开，可供审查

---

## 🔧 三种使用形式

> 如果您想直接使用 Mano-P 完成 GUI 自动化任务，这里提供了三种不同的使用方式，根据您的使用场景选择最适合的形式。

### 1️⃣ mano-cua（CLI 命令行工具）

**适用场景**：开发者、高级用户，需要在终端快速执行 GUI 自动化任务

**安装方式**：

```bash
# 通过 Homebrew 安装
brew tap HanningWang/tap
brew install mano-cua
```

安装过程会自动完成：

- 创建独立的 Python 3.13 虚拟环境
- 安装所需依赖（包括 Tkinter 图形界面库）
- 配置可执行命令到系统路径

**使用方式**：

```bash
# 运行任务
mano-cua run "打开微信并告诉FTY会议延期"
mano-cua run "在小红书搜索AI新闻并展示第一条帖子"

# 停止当前任务
mano-cua stop
```

**特点**：

- ✅ 命令行界面，快速调用
- ✅ 虚拟环境隔离，不污染系统 Python
- ✅ 适合脚本集成和批处理
- ✅ 可在 shell 脚本中嵌入使用

---

### 2️⃣ mano-client（Python SDK）⏳ 计划中

**适用场景**：Python 开发者，需要在 Python 项目中集成 GUI 自动化能力

**计划功能**：

```python
from mano_client import ManoClient

# 创建客户端实例
client = ManoClient()

# 运行任务
client.run("打开微信并告诉FTY会议延期")

# 停止任务
client.stop()
```

**计划特点**：

- Python API，易于集成到现有 Python 项目
- 支持异步调用和回调函数
- 可编程控制任务流程
- 适合构建自动化工作流

> **开发状态**：Python SDK 正在开发中，敬请期待。当前可使用 CLI 工具或 Skill 形式。

---

### 3️⃣ mano-skill（ClawHub Skill 形式）

**适用场景**：Claude Code、OpenClaw 等 AI Agent，需要自主调用 GUI 自动化能力完成用户任务

**安装方式**：

**方案一：通过 Claude Code 安装**

在 Claude Code 中，skills 以"命令"(commands) 的形式存在。安装步骤：

1. 从 [ClawHub](https://clawhub.ai/HanningWang/mano-cua) 下载 skill zip 包
2. 解压后将文件复制到 Claude Code 的 commands 目录：
3. 重启 Claude Code 或在新会话中，skill 将自动可用

**方案二：通过 ClawHub CLI 安装（推荐）**

使用 ClawHub CLI 工具可以一键安装和管理 skills：

```bash
# 安装 skill
clawhub install mano-cua

# 安装特定版本
clawhub install mano-cua --version 1.0.0

# 更新 skill 到最新版本
clawhub update mano-cua
```

安装完成后，启动新的 Claude Code 或 OpenClaw 会话即可使用。

> **前置要求**：需要先安装 ClawHub CLI 工具。详见：[OpenClaw 文档 - ClawHub](https://docs.openclaw.ai/tools/clawhub)

**使用方式**：

当用户向 AI Agent 提出需要 GUI 操作的需求时，Agent 会自动调用此 skill：

```
用户: "帮我打开微信，找到FTY的聊天窗口，告诉他会议延期到明天"
Agent: [自动调用 mano-skill 完成 GUI 操作]
```

**特点**：

- ✅ AI Agent 自主调用，无需用户手动执行命令
- ✅ 与 Agent 的推理能力深度集成
- ✅ 适合复杂的多步骤任务自动化
- ✅ ClawHub 生态，支持版本管理和安全扫描

**项目资源**：

- **源代码**：[github.com/HanningWang/mano-skill](https://github.com/HanningWang/mano-skill)
- **ClawHub 主页**：[clawhub.ai/HanningWang/mano-cua](https://clawhub.ai/HanningWang/mano-cua)
- **版本**：v1.0.0
- **许可证**：MIT

---

## ⚙️ 权限要求（所有形式通用）

- **屏幕录制权限**（Screen Recording）
- **辅助功能权限**（Accessibility - 键盘/鼠标控制）
- 在 **系统偏好设置 → 隐私与安全** 中授予权限

## 🔒 安全约束（所有形式通用）

- 敏感或潜在危险的操作需要用户确认才能执行
- 用户可随时停止任务
- 每台设备同时只能运行一个任务
- 仅支持主显示器（多显示器环境）

## 📊 状态面板

任务运行时，屏幕右上角会显示一个小型状态面板，用于：

- 实时显示当前任务状态和进度
- 提供任务管理功能（暂停/停止）
- 提醒用户当前有自动化任务正在运行，避免误操作

## 🔔 平台兼容性说明

**Beta 版本提示**：Mano-Skill 当前处于 Beta 测试阶段。

- **macOS**：✅ 首选和测试最充分的平台，稳定可用
- **Windows** 和 **Linux**：⚠️ 平台适配尚未完全完成，可能存在小问题

我们正在持续改进跨平台兼容性，欢迎反馈使用体验。

---

## 模型

> 如果您想在自己的应用中集成 Mano-P 的模型能力，这里提供了模型的性能指标和使用指南。模型即将发布，敬请期待。

### 性能评测

我们的Mano-P模型在采用专有的GS-Pruning算法进行剪枝后，可在苹果M4 Pro芯片上实现4K上下文任务的实时性能。相关模型与方法即将发布。下表展示了M4 Pro的实际基准测试结果。

<table>
  <thead>
    <tr>
      <th>模型</th>
      <th>芯片</th>
      <th>带宽</th>
      <th>框架</th>
      <th>上下文长度</th>
      <th>剪枝率</th>
      <th>Prefill速度<br/>(tokens/s)</th>
      <th>Decode速度<br/>(tokens/s)</th>
      <th>峰值内存<br/>(GB)</th>
      <th>Prefill时间<br/>(s)</th>
      <th>Decode时间<br/>(s)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2"><strong>Mano-P 1.0-4B<br/>(w4a16)</strong></td>
      <td rowspan="2">Apple M4 Pro<br/>64GB RAM</td>
      <td rowspan="2"><strong>273 GB/s</strong></td>
      <td rowspan="2">Mano-SDK</td>
      <td>4112</td>
      <td>0.5</td>
      <td>476.952</td>
      <td>76.75</td>
      <td>4.356</td>
      <td>8.621</td>
      <td>0.265</td>
    </tr>
    <tr>
      <td>8208</td>
      <td>0.5</td>
      <td>331.0</td>
      <td>70.946</td>
      <td>5.1471</td>
      <td>24.792</td>
      <td>0.253</td>
    </tr>
  </tbody>
</table>

**模型即将推出**

---

## 方法

> 如果您是研究人员或希望基于自己的数据训练定制化 GUI Agent 模型，我们计划开源完整的 Mano-Action 训练方法和相关工具。
>
> **即将开源** - Release Soon

### Mano-Action 训练方法

Mano-Action 是一套专为 GUI Grounding 设计的双向自增强训练框架。不同于传统的单向预测方法，Mano-Action 通过 Text↔Action 循环一致性学习，让模型同时掌握"从描述定位元素"和"描述给定元素"两个方向的能力，从而实现更鲁棒的界面理解。

#### 核心特性

- **双向循环学习**：Text → Action 和 Action → Text 的互相增强
- **三阶段渐进训练**：监督学习 → 离线强化学习 → 在线强化学习
- **闭环数据生成**：自动生成高质量训练数据，持续提升模型能力
- **端侧优化适配**：包含量化、剪枝等端侧部署优化技术

#### 适用场景

- 🎓 **学术研究**：探索 GUI 理解和多模态交互新方法
- 🏢 **企业定制**：基于企业内部系统训练专用模型
- 🌐 **领域适配**：针对特定领域（医疗、金融等）微调模型
- 🔬 **算法创新**：在 Mano-Action 基础上开发新的训练技术

---

## 🌟 技术优势

### Mano-P vs 传统方案 CUA对比

| 特性           | Mano-P          | OpenClaw             | Manus             | 传统RPA                 |
| -------------- | --------------- | -------------------- | ----------------- | ----------------------- |
| **模型来源**   | ✅ 内置端侧模型 | ⚠️ 用户自行配置      | ⚠️ 云端API调用    | ❌ 无需模型（规则引擎） |
| **数据安全**   | ✅ 本地运行     | ⚠️ LLM/skill调用上云 | ⚠️ 云端推理       | ✅ 可本地               |
| **控制方式**   | ✅ 纯视觉交互   | ⚠️ CDP协议+CLI       | ❌ HTML解析+CLI   | ❌ 系统API              |
| **适用场景**   | ✅ 全平台GUI    | ✅ 跨平台应用        | ⚠️ 仅Web应用      | ⚠️ 特定系统             |
| **长任务规划** | ✅ 自主规划     | ✅ 自主规划          | ✅ 可视化流程编排 | ❌ 需预设流程           |
| **响应速度**   | ✅ 即时响应     | ✅ 本地/云端运行     | ⚠️ 云端延迟       | ✅ 即时响应             |
| **部署成本**   | ✅ 低成本起步   | ✅ 开源免费          | ⚠️ 订阅付费       | ✅ 低成本               |
| **鲁棒性**     | ✅ UI变化自适应 | ✅ LLM自适应         | ⚠️ 有限适应       | ❌ 界面变化需重配       |

### 核心竞争力

1. **端侧大模型 + 灵活部署**
   - 4B模型可直接在Mac上运行（M4芯片+32GB内存）
   - 大参数模型（72B）通过算力棒支持
   - 无需配置API密钥，开箱即用
   - 相对OpenClaw（需用户配置模型）和Manus（云端调用）的显著优势

2. **全场景视觉理解**
   - 纯视觉GUI交互，不限于浏览器和Web应用
   - 相对OpenClaw（CDP协议主要针对浏览器）和Manus（仅Web应用）支持更广
   - 支持桌面软件、3D应用、专业工具等非标准GUI

3. **离线长任务自主规划**
   - 复杂业务流程的完全离线推理
   - 无需联网即可完成自主决策与纠错
   - 相对Manus（云端延迟）和传统RPA（需预设流程）的独特优势

4. **一体化硬件部署**
   - 模型+算力棒一体化方案，即插即用
   - 相对OpenClaw（开源免费但需自行部署）降低技术门槛
   - 跨平台兼容，快速部署上线

---

## 📄 技术论文与引用

### 相关论文

Mano-P基于以下研究工作：

**1. Mano系列模型基础论文**

```bibtex
@article{mano-2025,
  title={Mano Technical Report},
  author={Tianyu Fu, Anyang Su, Chenxu Zhao, Hanning Wang, Minghui Wu, Zhe Yu, Fei Hu, Mingjia Shi, Wei Dong, Jiayao Wang, Yuyang Chen, Ruiyang Yu, Siran Peng, Menglin Li, Nan Huang, Haitian Wei, Jiawei Yu, Yi Xin, Xilin Zhao, Kai Gu, Ping Jiang, Sifan Zhou, Shuo Wang},
  journal={arXiv preprint arXiv:2509.17336},
  year={2025},
  url={https://arxiv.org/abs/2509.17336}
}
```

**2. WebRetriever基准测试**

```bibtex
@article{webretriever-2026,
  title={WebRetriever: A Large-Scale Comprehensive Benchmark for Efficient Web Agent Evaluation},
  author={Wei Dong and Tianyu Fu and Zhe Yu and Hanning Wang and Anyang Su and Zhizhou Fang and Yuyang Chen and Shuo Wang and Minghui Wu and Ping Jiang and Zhen Lei and Chenxu Zhao},
  year={2026},
  note={To be published},
  url={https://github.com/hhhhhhalf/WebRetriever}
}
```

### 学术合作

我们欢迎学术界的合作研究：

- 🔬 **数据集贡献**：提供新的GUI任务数据集
- 🤝 **联合研究**：在端侧部署、量化优化、GUI理解等方向合作
- 📚 **基准测试**：在新的评测集上测试Mano-P

如有学术合作意向，请联系：model@mininglamp.com

---

## ❓ 常见问题

<details open>
<summary><b>🤖 Mano-P 是什么？</b></summary>
<br>

Mano-P 是一个**开源的 GUI-VLA（Vision-Language-Action）智能体**，设计用于在苹果芯片边缘设备上本地运行。它使用**纯视觉理解**来跨平台自动化桌面 GUI 操作。

</details>

<details open>
<summary><b>⚖️ Mano-P 与 Claude Computer Use 相比如何？</b></summary>
<br>

**性能对比：**

- OSWorld（所有模型）：Claude Sonnet 4.6 **72.1%** vs Mano-P 1.0-72B **58.2%**
- WebRetriever Protocol I：Mano-P **41.7 NavEval** vs Claude 4.5 Computer Use **31.3**

**核心差异：**

- ✅ Mano-P **完全在设备上运行**，数据不离开设备
- ⚠️ Claude Computer Use 需要云端 API 调用

**适用场景：** Mano-P 特别适合**高安全性要求**的场景。

</details>

<details open>
<summary><b>🔌 Mano-P 可以离线运行吗？</b></summary>
<br>

**可以！** 在本地模式下，所有模型推理都在 Apple M4 设备上运行。✅ **不会向外部服务器发送任何截图或任务描述。**

</details>

<details open>
<summary><b>💻 需要什么硬件配置？</b></summary>
<br>

**最低要求：**

- Mac mini 或 MacBook
- Apple M4 芯片
- 32GB 内存

**替代方案：**

- 任何 Mac + Mano-P 算力棒（通过 USB 4.0+ 连接）

📌 我们计划在未来支持更多设备。

</details>

<details open>
<summary><b>📦 如何安装 Mano-P？</b></summary>
<br>

**CLI 工具形式：**

```bash
brew tap HanningWang/tap && brew install mano-cua
```

**OpenClaw/Claude Code Skill 形式：**
请参见 [ClawHub - Mano-CUA](https://clawhub.ai/HanningWang/mano-cua)

</details>

<details open>
<summary><b>🔒 我的数据安全吗？</b></summary>
<br>

**本地模式：** ✅ 所有处理都在设备上进行

**云端模式：**

- ⚠️ 仅截图和任务描述发送到 `mano.mininglamp.com`
- ✅ 不访问本地文件、剪贴板内容或凭证

**透明度：** 完整客户端[开源](https://github.com/HanningWang/mano-skill)可供审计

</details>

---

## 🤝 贡献指南

我们欢迎社区贡献！如果你想为项目做出贡献：

1. Fork 本仓库
2. 创建你的特性分支 (`git checkout -b feature/AmazingFeature`)
3. 提交你的更改 (`git commit -m 'Add some AmazingFeature'`)
4. 推送到分支 (`git push origin feature/AmazingFeature`)
5. 开启一个 Pull Request

### 贡献方向

- 🐛 Bug修复和问题报告
- 📝 文档改进和翻译
- 💡 新功能建议和实现
- 🧪 测试用例和基准测试
- 🎨 应用场景和Demo贡献

---

## 📄 开源协议

本项目采用 [Apache License 2.0](LICENSE) 开源协议。

**协议要点：**

- ✅ 商业使用
- ✅ 修改和分发
- ✅ 专利授权
- ⚠️ 需保留版权声明
- ⚠️ 需说明修改内容

---

## 📮 联系方式

<!-- 联系信息待补充 -->

- 📧 邮箱: model@mininglamp.com
- 🏠 官网: [https://github.com/Mininglamp-AI/Mano-P](https://github.com/Mininglamp-AI/Mano-P)
- 💬 社区: （待补充）
- 🐛 GitHub Issues: [https://github.com/Mininglamp-AI/Mano-P/issues](https://github.com/Mininglamp-AI/Mano-P/issues)

---

## 🙏 致谢

感谢所有为本项目做出贡献的开发者和研究者。

**特别感谢：**

- Mano项目团队提供的技术基础
- DeepMiner平台的深度集成支持
- 端侧算力硬件合作伙伴
- 开源社区的贡献者们

---

<p align="center">
  <sub>由Mano-P团队用 ❤️ 打造</sub>
</p>
