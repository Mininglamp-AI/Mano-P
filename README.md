<div align="center">
    <h1>
      <img src="./pics/logo.png" alt="Mano-P Logo" height="60" style="vertical-align: -15px;">
      Mano-P 1.0
    </h1>
    <p><strong>GUI-Aware Agent Model for Edge Devices</strong></p>
    <p><strong>Private AI</strong></p>
</div>

<hr>

<div align="center">

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)
[![GitHub Stars](https://img.shields.io/github/stars/Mininglamp-AI/Mano-P?style=social)](https://github.com/Mininglamp-AI/Mano-P)
[![Paper](https://img.shields.io/badge/arXiv-Technical%20Report-red?logo=arxiv)](https://arxiv.org/abs/2509.17336)

<a href="README_CN.md">中文</a> | English

**[📖 Overview](#-overview) | [🎯 Key Highlights](#-key-highlights) | [🎬 Use Cases](#-use-case-demonstrations) | [📊 Benchmark](#-benchmark-performance) | [🔧 Skills](#-skills) | [🤖 Models](#-models) | [⚡ Inference SDK](#-inference-sdk) | [⚗️ Approach](#-approach) | [🌟 Technical Advantages](#-technical-advantages) | [🔗 Applications](#-applications) | [📄 Citation](#-technical-papers--citation) | [❓ FAQ](#-faq)**

</div>

---

<div align="center">
  <a href="https://ccnt9oddmvfr.feishu.cn/wiki/QUwbwmUwriHdL4kkyqPcWNaPn9c" target="_blank">
    <img src="pics/Benchmark_Overview.png" alt="GUI Agent Grounding Benchmark" style="max-width: 100%; height: auto;">
  </a>
</div>

---

## 📖 Overview

**Mano-P**: "Mano" means "hand" in Spanish, and "P" has dual meanings: Person and Party. We believe that both individuals and organizations can create their own Private AI, and a bright future of human-machine collaboration is on the horizon.

![opensource_architecture.png](pics/opensource_architecture_en.png)

**Mano-P** is a GUI-VLA agent project designed specifically for edge devices. It serves both as an open-source project and a hardware product solution.
As an open-source project, Mano-P is being released in a phased, progressive manner, targeting three distinct groups of developers. In the first phase, we will open-source the Mano-CUA Skills. This phase is aimed at Agent enthusiasts—such as users of OpenClaw or Claude Code—enabling them to leverage the capabilities of Mano-CUA Skills to construct more intelligent CUA task workflows and overcome the bottlenecks associated with human intervention. In the second phase, we will open-source the local-side models and SDK components of Mano-CUA. This phase targets developers with high security requirements, allowing them to directly utilize GUI-VLA models capable of running inference locally on a Mac mini to build their own custom Skills, Tools, and more; **crucially, all your CUA operations will be executed entirely on your local Mac mini and will not be uploaded to external servers.** In the third phase, we will open-source the training methodologies and the pruning and quantization techniques used for the Mano-P models. This phase is designed for developers with specific model training needs, empowering them to apply our training methods to create their own on-device GUI-VLA models tailored to their unique requirements.

Regarding our GUI-VLA models—which are capable of running inference directly on Mac mini and MacBook devices—we currently support two deployment methods: First, direct deployment on Mac mini or MacBook models equipped with an M4 chip and 32GB or more of RAM; and second, deployment utilizing a compute stick connected via a USB 4.0 port or higher. We will be releasing detailed instructions for both deployment methods in the near future, and we plan to expand our support to include additional deployment options in the future.

### Main Capabilities

- **Complex GUI Automation**: Autonomously complete complex interface operations containing hundreds of interactive elements
- **Cross-System Data Integration**: Extract and integrate multi-source data through pure visual interaction without API interfaces
- **Long-Task Planning Execution**: Support enterprise-level business process automation of dozens to hundreds of steps
- **Intelligent Report Generation**: Automatically generate structured documents such as data analysis reports and work summaries
- **Edge-Native Inference**: Efficient on-device execution on Apple Silicon via INT8 activation quantization ([Cider](#-inference-sdk))
- **Autonomous Application Construction**: Drives end-to-end software construction pipelines through visual GUI operation ([Mano-AFK](#-applications))

### Technical Background

Mano-P builds upon the complete technical framework of the Mano project (see [Mano Technical Report](https://arxiv.org/abs/2509.17336)), employing the Mano-Action bidirectional self-reinforcement learning method, three-stage progressive training (SFT → Offline Reinforcement Learning → Online Reinforcement Learning), "think-act-verify" loop reasoning mechanism, and a closed-loop data circulation system to achieve high-precision GUI understanding and operation capabilities. The edge version is optimized through mixed-precision quantization, visual token pruning, and edge inference adaptation, enabling large-scale parameter models to run efficiently on edge devices like Mac mini/MacBook/computing sticks.

## 🎯 Key Highlights

- **#1 on OSWorld Benchmark**: Mano-P 1.0-72B achieves **58.2% success rate on OSWorld**, ranking first among all specialized GUI agent models, outperforming the second-place opencua-72b (45.0%) by 13.2 percentage points
- **Leading on WebRetriever Protocol I**: Mano-P 1.0 scores **41.7 NavEval**, surpassing Gemini 2.5 Pro Computer Use (40.9) and Claude 4.5 Computer Use (31.3)
- **Fully Local Execution**: Runs inference locally on **Apple M4 chip with 32GB RAM** (Mac mini or MacBook). No cloud API calls required. All screenshots and task data stay on-device
- **High-Performance Inference**: The 4B quantized model (w4a16) achieves **476 tokens/s prefill** and **76 tokens/s decode** on Apple M4 Pro, with only 4.3GB peak memory usage
- **Autonomous Long-Task Execution**: Supports **complex business processes** with end-to-end automation without internet connectivity
- **Edge-Native INT8 Acceleration**: Companion [Cider](#-inference-sdk) SDK adds the W8A8 / W4A8 activation-quantization primitives MLX lacks natively, delivering **1.4x–2.2x prefill speedup** over MLX W4A16 on Apple M5 Pro — works with any MLX model, not just Mano-P
- **Autonomous Software Construction**: [Mano-AFK](#-applications) drives a full PRD → code → deploy → test → fix loop using Mano-P as its local vision model for real-browser E2E testing — from a single natural-language prompt to a deployed, tested application, no human in the loop

---

## 🎬 Use Case Demonstrations

### Scenario 1: Mano-AFK Fully automated application construction

https://github.com/user-attachments/assets/8512ab65-f836-4779-979a-4c636fe61fd2

We demonstrated the fully automated application construction process of [Mano-AFK](#-applications). After receiving natural language requirements, the system sequentially completes requirement clarification, technical architecture design, code generation, local deployment, and multi-level testing (API interface testing, LLM based page visual inspection, and end-to-end GUI automation testing driven by VLA model). When the test fails, the system automatically locates the root cause of the problem, fixes the code, and deploys verification again, iterating until all test cases pass. The entire process does not require manual intervention, and ultimately delivers a runnable application with complete requirement documents and build reports.

[![Watch on YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/T2QeXOOvRBQ?si=-I1HDmmtWNeKmg5Q)

### Scenario 2: Commercial video intelligent system

https://github.com/user-attachments/assets/04730188-e664-4f92-8ba7-023269880718

We fully demonstrated the actual workflow of a commercial video intelligent system. Starting from the user's command, the system automatically completes the entire process of video generation, uploading, analysis, editing, and secondary evaluation. During the process, the system can autonomously operate web pages and editing software, complete fine operations such as file processing and subtitle modification, and generate analysis reports containing subjective evaluations and objective indicators. By comparing the differences between the initial and refined versions, visually present the overall capabilities and application effects of the system.

[![Watch on YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/g4sXOTtNPbo?si=RmV5wLLlI1u4e7Nj)

### Scenario 3: Local model task execution

https://github.com/user-attachments/assets/992f4961-3028-45c9-a7c2-29a8e5bf93a9

Mano-P, The small-sized end side GUI-VLA model can run directly on your computer, supporting direct inference operation on Macmini/Macbook with M4 chip and above, as well as direct operation on plug and play computing power sticks. In the CUA scenario, break through the bottleneck of human participation in the Agent workflow. Mano-P, The first step in leading Private AI.

[![Watch on YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/VyHhsO1HFpg)

### Scenario 4: Daily Life and Entertainment Applications

https://github.com/user-attachments/assets/ff11fd5b-9ee7-4a74-b8e6-3ad3071d3af8

Mano-P excels not only in enterprise-level business automation but also integrates seamlessly into daily life. This video demonstrates the system's application in Mahjong gameplay: through pure visual understanding of the game interface, it autonomously completes tile recognition, analysis, and decision-making. This case validates Mano-P's general-purpose capabilities beyond work scenarios—from office automation to leisure entertainment, from structured data processing to unstructured game interactions, truly realizing the vision of "Private AI." One model, adapting to every aspect of life and work.

[![Watch on YouTube](https://img.shields.io/badge/Watch%20on-YouTube-red?logo=youtube)](https://youtu.be/P4-wE3p7mB8)

---

## 📊 Benchmark Performance

**Performance of the Mano series models in multiple benchmarks:**

### 1. GUI Grounding

<details>
<summary>📊 Expand Evaluation Data</summary>
<br>

![GUI Agent Grounding Benchmark](./pics/GUI_Agent_Grounding_Benchmark.png)

</details>

### 2. BUA & CUA

<details>
<summary>📊 Expand Evaluation Data</summary>

#### [OSWorld](https://os-world.github.io/) - Specialized Models

![OS-World-Verified-Specialized-Model.png](pics/OS-World-Verified-Specialized-Model.png)

#### [OSWorld](https://os-world.github.io/) - All Models

![OS-World-Verified-All-Model.png](pics/OS-World-Verified-All-Model.png)

#### [WebRetriever](https://github.com/hhhhhhalf/WebRetriever)

![WebRetriever.png](pics/WebRetriever.png)

</details>

### 3. Perception & Cognition

<details>
<summary>📊 Expand Evaluation Data</summary>

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
      <td rowspan="7" style="text-align: left;">SalECI</td>
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
      <td style="text-align: center;"><strong>0.868</strong></td>
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
<summary>📊 Expand Evaluation Data</summary>

#### Online-Mind2Web

**Comparison of Task Execution Success Rate (SR) on Online-Mind2Web Benchmark**
_Avg. Tokens/img_ represents the average visual token retention rate per image; lower values indicate more aggressive pruning.

**GSPruning** is a novel token pruning method designed for Vision-Language Models to efficiently process high-resolution web interfaces by preserving global spatial structure through anchor points and identifying semantic outliers for critical UI elements. It achieves 2-3× throughput speedup with minimal performance loss, enabling more efficient autonomous web agents.

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
      <td style="text-align: left;">FlashVLM [4]</td>
      <td style="text-align: center;">12.55%</td>
      <td style="text-align: center;">17.01</td>
      <td style="text-align: center;">0.343</td>
    </tr>
    <tr>
      <td style="text-align: left;">Compressor-VLA [11]</td>
      <td style="text-align: center;">13.33%</td>
      <td style="text-align: center;">16.92</td>
      <td style="text-align: center;">0.293</td>
    </tr>
    <tr>
      <td style="text-align: left;">HiPrune [16]</td>
      <td style="text-align: center;">25.09%</td>
      <td style="text-align: center;">16.67</td>
      <td style="text-align: center;">0.333</td>
    </tr>
    <tr>
      <td style="text-align: left;">PDrop [33]</td>
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
<summary>📊 Expand Evaluation Data</summary>

#### [CL Bench](https://github.com/Tencent-Hunyuan/CL-bench)

![CL-bench.png](pics/CL-bench.png)

</details>

---

## 🔧 Skills

**Mano-Skill** is a desktop GUI automation tool based on the Mano model, driving cross-platform graphical interface operations through natural language. We provide three different usage forms for the same core capability to adapt to different usage scenarios and user groups.

---

### 📦 Core Capability Overview

#### Feature Highlights

- **Natural Language Driven**: Users describe tasks in natural language, and the system automatically executes GUI operations
- **Flexible Inference Modes**:
  - **Local Mode**: Models run locally, data stays on device, fast response
    - Run directly on Mac mini/MacBook (M4 chip or above, 32GB+ RAM)
    - Or use Mano-P computing stick (via USB 4.0 connection)
  - **Cloud Mode**: Without local model configuration, uses cloud API service (`mano.mininglamp.com`)
  - System automatically detects local model configuration and seamlessly switches inference modes
- **Comprehensive Interaction Support**: Click, type, hotkey, scroll, drag, mouse movement, screenshot, wait, app launch, URL navigation
- **Cross-Platform Support**: macOS (stable), Windows, Linux (Beta)

#### How It Works

**Local Mode**

1. Capture current screen screenshot
2. Run Mano-P model on local device (Mac mini/MacBook) or computing stick for inference
3. Local model analyzes and returns next action instruction
4. Client executes operation (click, type, etc.)
5. Loop execution until task completion

**Cloud Mode (Default)**

1. Capture current screen screenshot
2. Send screenshot and task description to cloud vision model (`mano.mininglamp.com`)
3. Cloud model analyzes and returns next action instruction
4. Local client executes operation (click, type, etc.)
5. Loop execution until task completion

#### Data Privacy & Security

**Local Mode (Mac mini/MacBook or Computing Stick):**

- ✅ **Fully Local Processing**: All data processing is completed locally, screenshots and task descriptions never leave the device
- ✅ **Data Stays on Device**: Does not access or transmit any data to external servers
- ✅ **Maximum Privacy Protection**: Suitable for handling sensitive information and high-security scenarios

**Cloud Mode:**

- ⚠️ **Data Sent**: Screenshots and task descriptions sent to `mano.mininglamp.com` for real-time visual analysis
- ✅ **Data Not Sent**: Does not access or transmit local files, clipboard contents, system credentials
- ⚠️ **Privacy Note**: Avoid displaying sensitive documents, chat logs, or credential information on screen when running tasks

**General Assurance:**

- ✅ **Open Source Auditable**: Complete source code publicly available for review

---

### 🔧 Three Usage Forms

> If you want to use Mano-P directly to accomplish GUI automation tasks, here are three different usage forms. Choose the one that best fits your use case.

#### 1️⃣ mano-cua (CLI Command-Line Tool) ⏳ Planned

**Use Case**: Developers, advanced users who need to quickly execute GUI automation tasks in terminal

**Installation**:

```bash
# Install via Homebrew
brew tap hanningwang/tap
brew install mano-cua
```

The installation process will automatically:

- Create an isolated Python 3.13 virtual environment
- Install required dependencies (including Tkinter GUI library)
- Configure the executable command to system PATH

**Usage**:

```bash
# Run tasks
mano-cua run "Open WeChat and tell FTY the meeting is postponed"
mano-cua run "Search for AI news on Xiaohongshu and display the first post"

# Stop current task
mano-cua stop
```

**Features**:

- ✅ Command-line interface, quick invocation
- ✅ Virtual environment isolation, no system Python pollution
- ✅ Suitable for script integration and batch processing
- ✅ Can be embedded in shell scripts

**Project Resources**:

- **Homebrew Tap**: [github.com/Mininglamp-AI/homebrew-tap](https://github.com/Mininglamp-AI/homebrew-tap)

---

#### 2️⃣ mano-client (Python SDK) ⏳ Planned

**Use Case**: Python developers who need to integrate GUI automation capabilities into Python projects

**Planned Features**:

```python
from mano_client import ManoClient

# Create client instance
client = ManoClient()

# Run task
client.run("Open WeChat and tell FTY the meeting is postponed")

# Stop task
client.stop()
```

**Planned Capabilities**:

- Python API, easy integration into existing Python projects
- Supports asynchronous calls and callback functions
- Programmable control of task flow
- Suitable for building automated workflows

> **Development Status**: Python SDK is under development. Please use CLI tool or Skill form for now.

---

#### 3️⃣ mano-skill (ClawHub Skill Form)

**Use Case**: AI agents like Claude Code, OpenClaw that need to autonomously invoke GUI automation capabilities to complete user tasks

**Installation**:

**Option 1: Install via Claude Code**

In Claude Code, skills exist as "commands". Installation steps:

1. Download the skill zip package from [ClawHub](https://clawhub.ai/hanningwang/mano-cua)
2. After extraction, copy files to Claude Code's commands directory
3. Restart Claude Code or in a new session, the skill will be automatically available

**Option 2: Install via ClawHub CLI (Recommended)**

Use the ClawHub CLI tool for one-click installation and skill management:

```bash
# Install skill
clawhub install mano-cua

# Install specific version
clawhub install mano-cua --version 1.0.0

# Update skill to latest version
clawhub update mano-cua
```

After installation, start a new Claude Code or OpenClaw session to use.

> **Prerequisites**: ClawHub CLI tool must be installed first. See: [OpenClaw Documentation - ClawHub](https://docs.openclaw.ai/tools/clawhub)

**Usage**:

When users make requests to AI agents that require GUI operations, the agent will automatically invoke this skill:

```
User: "Help me open WeChat, find FTY's chat window, and tell him the meeting is postponed to tomorrow"
Agent: [Automatically invokes mano-skill to complete GUI operation]
```

**Features**:

- ✅ Autonomously invoked by AI agents, no manual command execution needed
- ✅ Deeply integrated with agent reasoning capabilities
- ✅ Suitable for complex multi-step task automation
- ✅ ClawHub ecosystem with version management and security scanning

**Project Resources**:

- **Source Code**: [github.com/Mininglamp-AI/mano-skill](https://github.com/Mininglamp-AI/mano-skill)
- **ClawHub Home**: [clawhub.ai/hanningwang/mano-cua](https://clawhub.ai/hanningwang/mano-cua)
- **Version**: v1.0.0
- **License**: MIT

---

### ⚙️ Permission Requirements (Common to All Forms)

- **Screen Recording Permission**
- **Accessibility Permission** (keyboard/mouse control)
- Grant permissions in **System Preferences → Privacy & Security**

### 🔒 Security Constraints (Common to All Forms)

- Sensitive or potentially dangerous operations require user confirmation before execution
- Users can stop tasks at any time
- Only one task can run on each device simultaneously
- Only supports primary display (multi-display environment)

### 📊 Status Panel

When a task is running, a small status panel appears in the top-right corner of the screen to:

- Display real-time task status and progress
- Provide task management functions (pause/stop)
- Remind users that an automation task is running to avoid accidental interference

### 🔔 Platform Compatibility Note

**Beta Version Notice**: Mano-Skill is currently in Beta testing phase.

- **macOS**: ✅ Preferred and most thoroughly tested platform, stable and ready for use
- **Windows** and **Linux**: ⚠️ Platform adaptations not yet fully completed, minor issues may occur

We are continuously improving cross-platform compatibility. Feedback is welcome.

---

## 🤖 Models

> If you want to integrate Mano-P's model capabilities into your own applications, this section provides performance metrics and usage guidelines.

### Performance Evaluation

The table below presents actual inference benchmark results of Mano-P 1.0-4B running on Apple M5 Pro with the Cider inference SDK. Using W8A16 (MLX's native weight-only quantization path) as the baseline — the same reference convention adopted in [Cider's LLM Quantization benchmark](#-inference-sdk) — enabling Cider's W8A8 activation quantization reduces prefill time from 2.839s to 2.519s on the same input, a **~12.7% prefill speedup**. For more data, refer to the [⚡ Inference SDK](#-inference-sdk) section below.

<table>
  <thead>
    <tr>
      <th>Model</th>
      <th>Chip</th>
      <th>Bandwidth</th>
      <th>Framework</th>
      <th>Context Length</th>
      <th>Quantization</th>
      <th>Prefill Time<br/>(s)</th>
      <th>Decode Speed<br/>(tokens/s)</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td rowspan="2"><strong>Mano-P 1.0-4B</strong></td>
      <td rowspan="2">Apple M5 Pro<br/>64GB RAM</td>
      <td rowspan="2"><strong>307 GB/s</strong></td>
      <td rowspan="2">Cider</td>
      <td rowspan="2">4516</td>
      <td>W8A16</td>
      <td>2.839</td>
      <td>80.1</td>
    </tr>
    <tr>
      <td>W8A8</td>
      <td>2.519</td>
      <td>79.5</td>
    </tr>
  </tbody>
</table>

**Model download:** 🤗 [Hugging Face](https://huggingface.co/Mininglamp-2718/Mano-P) · 🪄 [ModelScope](https://modelscope.cn/models/Mininglamp/Mano-P)

---

## ⚡ Inference SDK

### Overview

**Cider** is an inference acceleration SDK for Apple Silicon, built on top of Apple MLX. It implements the online activation-quantization operators that MLX does not ship natively, exposed as MLX custom primitives with full lazy-evaluation support. Cider also extends `mlx_vlm` with bug fixes and adds on-device inference services. It works with any MLX model — Qwen, Llama, Mistral, and VLMs like Qwen3-VL — via a one-line `convert_model()` API, and ships an OpenAI-compatible VLM inference server out of the box.

### Modes

| Mode     | Weights             | Activations    | Compute Path       | Status    |
| -------- | ------------------- | -------------- | ------------------ | --------- |
| **W8A8** | INT8 per-column     | INT8 per-token | TensorOps matmul2d | ✅ Stable |
| **W4A8** | INT4 packed (uint8) | INT8 per-token | Unpack → TensorOps | ✅ Stable |
| W4A16    | —                   | —              | MLX built-in       | Baseline  |
| W8A16    | —                   | —              | MLX built-in       | Baseline  |

MLX natively supports **W4A16** and **W8A16** only; Cider fills in the missing **W8A8** and **W4A8** modes. MLX's native quantization is weight-only (`QuantizedLinear` dequantizes weights to FP16 and runs FP16 GEMM), while Cider provides true INT8 activation quantization plus INT8 TensorOps compute via fused quantize-matmul-dequant primitives:

- **W8A8**: 1.4x–2.2x faster than MLX W4A16 depending on batch size
- **W4A8**: half the weight memory of W8A8, competitive with MLX W4A16 at batch sizes ≥ 16

### Performance (Apple M5 Pro, 4096×4096)

**Individual Operator Latency**

| M   | W8A8   | W4A8   | MLX W4A16 | W8A8 vs W4A16 |
| --- | ------ | ------ | --------- | ------------- |
| 1   | 0.47ms | 0.52ms | 0.21ms    | 0.44x         |
| 16  | 0.23ms | 0.32ms | 0.34ms    | **1.48x**     |
| 64  | 0.24ms | 0.40ms | 0.53ms    | **2.21x**     |
| 128 | 0.29ms | 0.47ms | 0.40ms    | **1.38x**     |
| 256 | 0.41ms | 0.69ms | 0.71ms    | **1.73x**     |

**End-to-End VLM Prefill (Qwen3-VL-2B, chunked prefill chunk=2048, bfloat16 model)**

| Tokens | BF16 (baseline) | W8A8 Prefill | Speedup   |
| ------ | --------------- | ------------ | --------- |
| 1334   | 159ms           | **134ms**    | **1.19x** |
| 2393   | 298ms           | **254ms**    | **1.17x** |
| 3455   | 432ms           | **374ms**    | **1.15x** |

Decode uses the original weights (zero overhead); mode switching is instant.

**LLM Quantization: Precision vs. Speed**

| Model     | Quantization    | wikitext2 PPL ↓ | Prefill (tokens/s) ↑ |
| --------- | --------------- | --------------- | -------------------- |
| Qwen3-8B  | FP16            | 9.729           | 1695                 |
| Qwen3-8B  | W4A16 (AWQ)     | 9.991           | 1628                 |
| Qwen3-8B  | W8A16 (GPTQ)    | 9.707           | 1484                 |
| Qwen3-8B  | **W8A8 (GPTQ)** | 9.756           | **2531**             |
| Llama3-8B | FP16            | 6.138           | 1727                 |
| Llama3-8B | W4A16 (GPTQ)    | 6.809           | 1579                 |
| Llama3-8B | W8A16 (GPTQ)    | 6.147           | 1477                 |
| Llama3-8B | **W8A8 (GPTQ)** | 6.271           | **2520**             |

An experimental **ANE+GPU heterogeneous tensor parallelism** mode on M4 adds another 3%–16% by offloading ~65% of output channels to the Apple Neural Engine during prefill.

- 🔗 Repository: [github.com/Mininglamp-AI/cider](https://github.com/Mininglamp-AI/cider)

---

## ⚗️ Approach

> If you are a researcher or wish to train customized GUI Agent models based on your own data, we plan to open-source the complete Mano-Action training methodology and related tools.
>
> **Release Soon**

### Mano-Action Training Methodology

Mano-Action is a bidirectional self-reinforcement training framework specifically designed for GUI Grounding. Unlike traditional unidirectional prediction methods, Mano-Action achieves more robust interface understanding through Text↔Action cycle consistency learning, enabling the model to master both "locating elements from descriptions" and "describing given elements" simultaneously.

#### Core Features

- **Bidirectional Cycle Learning**: Mutual reinforcement between Text → Action and Action → Text
- **Three-Stage Progressive Training**: Supervised Learning → Offline RL → Online RL
- **Closed-Loop Data Generation**: Automatically generate high-quality training data for continuous model improvement
- **Edge Optimization Adaptation**: Includes quantization, pruning, and other edge deployment optimization techniques

#### Use Cases

- 🎓 **Academic Research**: Explore new approaches to GUI understanding and multimodal interaction
- 🏢 **Enterprise Customization**: Train specialized models based on internal enterprise systems
- 🌐 **Domain Adaptation**: Fine-tune models for specific domains (healthcare, finance, etc.)
- 🔬 **Algorithm Innovation**: Develop new training techniques building on Mano-Action

---

## 🌟 Technical Advantages

### Mano-P vs Traditional Solutions CUA Comparison

| Feature             | Mano-P                 | OpenClaw                 | Manus                        | Traditional RPA                 |
| ------------------- | ---------------------- | ------------------------ | ---------------------------- | ------------------------------- |
| **Model Source**    | ✅ Built-in edge model | ⚠️ User-configured       | ⚠️ Cloud API calls           | ❌ No model (rule-based engine) |
| **Data Security**   | ✅ Local execution     | ⚠️ LLM/skill cloud calls | ⚠️ Cloud inference           | ✅ Can be local                 |
| **Control Method**  | ✅ Pure visual         | ⚠️ CDP protocol+CLI      | ❌ HTML parsing+CLI          | ❌ System API                   |
| **Use Scenarios**   | ✅ All-platform GUI    | ✅ Cross-platform apps   | ⚠️ Web apps only             | ⚠️ Specific systems             |
| **Long Task Plan**  | ✅ Autonomous planning | ✅ Autonomous planning   | ✅ Visual flow orchestration | ❌ Needs preset workflows       |
| **Response Speed**  | ✅ Instant response    | ✅ Local/cloud execution | ⚠️ Cloud latency             | ✅ Instant response             |
| **Deployment Cost** | ✅ Low-cost entry      | ✅ Open source & free    | ⚠️ Subscription fee          | ✅ Low cost                     |
| **Robustness**      | ✅ UI change adaptive  | ✅ LLM adaptive          | ⚠️ Limited adaptation        | ❌ UI change needs reconfig     |

### Core Competitiveness

1. **Edge Large Model + Flexible Deployment**
   - 4B model runs directly on Mac (M4 chip + 32GB RAM)
   - Large parameter models (72B) supported via computing stick
   - No API key configuration needed, ready out-of-the-box
   - Significant advantage over OpenClaw (requires user model configuration) and Manus (cloud calls)

2. **Universal Visual Understanding**
   - Pure visual GUI interaction, not limited to browsers and web apps
   - Broader support than OpenClaw (CDP protocol mainly for browsers) and Manus (web apps only)
   - Supports desktop software, 3D applications, professional tools, and non-standard GUIs

3. **Offline Long-Task Autonomous Planning**
   - Fully offline reasoning for complex business processes
   - Autonomous decision-making and error correction without internet connection
   - Unique advantage over Manus (cloud latency) and traditional RPA (needs preset workflows)

4. **Integrated Hardware Deployment**
   - Model + computing stick integrated solution, plug-and-play
   - Lowers technical barrier compared to OpenClaw (open-source & free but requires self-deployment)
   - Cross-platform compatible, rapid deployment and launch

---

## 🔗 Applications

**Mano-AFK** — an autonomous full-cycle app builder that turns a single natural-language sentence into a deployed, tested, and bug-fixed application. It uses Mano-P as its local vision model to drive real-browser E2E testing, demonstrating a concrete application scenario of Mano-P in real-world software engineering pipelines.

- GitHub: [github.com/Mininglamp-AI/mano-afk](https://github.com/Mininglamp-AI/mano-afk)
- ClawHub: [clawhub.ai/hanningwang/mano-afk](https://clawhub.ai/hanningwang/mano-afk)

**CUA Benchmark — Mano-P 4B on MacBook Pro M5 (16GB)**

The suite evaluates 100 tasks across 5 web applications that were themselves built autonomously by Mano-AFK: **TripSplit** (expense splitting), **md-wechat** (Markdown → WeChat formatter), **OMS** (order management), **Family Ledger** (household bookkeeping), and **Life Dashboard** (personal widgets). Each app ships in two variants — a **golden** build (bug-free, expected verdict PASS, 76 tasks) and a **buggy** build with specific UI/logic defects injected (expected verdict FAIL, 24 tasks). Accuracy is defined as the share of tasks where the judge's verdict matches the expected label; each project contributes 15–16 golden tasks and 4–5 bug-injection tasks.

| Configuration | Accuracy  | Avg Steps | Avg Step Time | Avg Tokens/Step |
| ------------- | --------- | --------- | ------------- | --------------- |
| W8A16         | **58.0%** | 6.1       | 10.1s         | 3,389           |
| W8A8          | **54.0%** | 6.93      | 10.4s         | 3,104           |

Metrics: _Accuracy_ — judge verdict matches expected PASS/FAIL; _Steps_ — actions taken per task; _Step Time_ — model-only latency per action (end-to-end time is higher); _Tokens/Step_ — prompt + generation tokens combined.

> **Note on W8A8 on this hardware:** The W8A8 row runs via [Cider](https://github.com/Mininglamp-AI/cider) for INT8 activation quantization. W8A8 accelerates prefill through INT8 TensorOps, but it must hold both the original and the INT8 weights in memory simultaneously — roughly doubling weight footprint. On a 16 GB unified-memory device, the added pressure can trigger swapping that offsets the prefill gain, which is why W8A8 here lands slightly behind W8A16 on both accuracy and step time. At least 4 GB of free memory beyond the model size is recommended to see W8A8's full benefit.

- [Benchmark methodology](https://github.com/Mininglamp-AI/mano-afk/tree/master/benchmark) — full test design, task schema, and bug catalog

---

## 📄 Technical Papers & Citation

### Related Papers

Mano-P is based on the following research work:

**1. Mano Series Model Foundation Paper**

```bibtex
@article{mano-2025,
  title={Mano Technical Report},
  author={Tianyu Fu, Anyang Su, Chenxu Zhao, Hanning Wang, Minghui Wu, Zhe Yu, Fei Hu, Mingjia Shi, Wei Dong, Jiayao Wang, Yuyang Chen, Ruiyang Yu, Siran Peng, Menglin Li, Nan Huang, Haitian Wei, Jiawei Yu, Yi Xin, Xilin Zhao, Kai Gu, Ping Jiang, Sifan Zhou, Shuo Wang},
  journal={arXiv preprint arXiv:2509.17336},
  year={2025},
  url={https://arxiv.org/abs/2509.17336}
}
```

**2. WebRetriever Benchmark**

```bibtex
@article{webretriever-2026,
  title={WebRetriever: A Large-Scale Comprehensive Benchmark for Efficient Web Agent Evaluation},
  author={Wei Dong and Tianyu Fu and Zhe Yu and Hanning Wang and Anyang Su and Zhizhou Fang and Yuyang Chen and Shuo Wang and Minghui Wu and Ping Jiang and Zhen Lei and Chenxu Zhao},
  year={2026},
  note={To be published},
  url={https://github.com/hhhhhhalf/WebRetriever}
}
```

### Academic Collaboration

We welcome collaboration with academia:

- 🔬 **Dataset Contribution**: Provide new GUI task datasets
- 🤝 **Joint Research**: Collaborate on edge deployment, quantization optimization, GUI understanding, etc.
- 📚 **Benchmarking**: Test Mano-P on new evaluation sets

For academic collaboration inquiries, please contact: model@mininglamp.com

---

## ❓ FAQ

<details open>
<summary><b>🤖 What is Mano-P?</b></summary>
<br>

Mano-P is an **open-source GUI-VLA (Vision-Language-Action) agent** designed to run locally on Apple Silicon edge devices. It uses **pure visual understanding** to automate desktop GUI operations across platforms.

</details>

<details open>
<summary><b>⚖️ How does Mano-P compare to Claude Computer Use?</b></summary>
<br>

**Performance Comparison:**

- OSWorld (all models): Claude Sonnet 4.6 **72.1%** vs Mano-P 1.0-72B **58.2%**
- WebRetriever Protocol I: Mano-P **41.7 NavEval** vs Claude 4.5 Computer Use **31.3**

**Key Difference:**

- ✅ Mano-P **runs entirely on-device**, no data leaves the machine
- ⚠️ Claude Computer Use requires cloud API calls

**Use Case:** Mano-P is particularly suitable for **high-security scenarios**.

</details>

<details open>
<summary><b>🔌 Can Mano-P run without internet?</b></summary>
<br>

**Yes!** In local mode, all model inference runs on the Apple M4 device. ✅ **No screenshots or task descriptions are sent to external servers.**

</details>

<details open>
<summary><b>💻 What hardware do I need?</b></summary>
<br>

**Minimum Requirements:**

- Mac mini or MacBook
- Apple M4 chip
- 32GB RAM

**Alternative:**

- Any Mac + Mano-P computing stick (connected via USB 4.0+)

📌 We plan to support more devices in the future.

</details>

<details open>
<summary><b>📦 How do I install Mano-P?</b></summary>
<br>

**CLI Tool:** ⏳ Planned

```bash
brew tap hanningwang/tap && brew install mano-cua
```

**OpenClaw/Claude Code Skill:**
See [ClawHub - Mano-CUA](https://clawhub.ai/hanningwang/mano-cua)

</details>

<details open>
<summary><b>🔒 Is my data safe?</b></summary>
<br>

**Local Mode:** ✅ All processing happens on-device

**Cloud Mode:**

- ⚠️ Only screenshots and task descriptions sent to `mano.mininglamp.com`
- ✅ No local files, clipboard contents, or credentials accessed

**Transparency:** Full client is [open-source](https://github.com/Mininglamp-AI/mano-skill) for audit

</details>

---

## 🤝 Contribution Guidelines

We welcome community contributions! If you want to contribute to the project:

1. Fork this repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Contribution Areas

- 🐛 Bug fixes and issue reporting
- 📝 Documentation improvements and translations
- 💡 New feature suggestions and implementations
- 🧪 Test cases and benchmarking
- 🎨 Application scenarios and demo contributions

---

## 📄 License

This project is licensed under the [Apache License 2.0](LICENSE).

**License Highlights:**

- ✅ Commercial use
- ✅ Modification and distribution
- ✅ Patent grant
- ⚠️ Must retain copyright notice
- ⚠️ Must state changes

---

## 📮 Contact

<!-- Contact information to be added -->

- 📧 Email: model@mininglamp.com
- 🏠 Website: [https://github.com/Mininglamp-AI/Mano-P](https://github.com/Mininglamp-AI/Mano-P)
- 💬 Community: (To be added)
- 🐛 GitHub Issues: [https://github.com/Mininglamp-AI/Mano-P/issues](https://github.com/Mininglamp-AI/Mano-P/issues)

---

## 🙏 Acknowledgments

Thanks to all developers and researchers who contributed to this project.

**Special Thanks:**

- Mano project team for providing the technical foundation
- DeepMiner platform for deep integration support
- Edge computing hardware partners
- Open source community contributors

---

<p align="center">
  <sub>Built with ❤️ by the Mano-P Team</sub>
</p>
