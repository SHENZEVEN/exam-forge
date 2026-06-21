# exam-forge 📝

> 上传往年真题 + 老师划的重点 → AI 自动生成风格一致的模拟卷（含答案、解题步骤、常见错误、知识点覆盖报告）。

<p align="center">
  <!-- TODO: 替换为实际 demo GIF -->
  <img src="demo.gif" alt="exam-forge demo" width="700">
</p>

---

## 这是什么

exam-forge 是一个 **AI 期末模拟卷生成器**。给 AI 看几套旧真题 → 自动分析出题规律 → 按规律出一套全新的模拟卷。

和直接问 ChatGPT "帮我出一套卷子"的区别：

| | ChatGPT 直接出 | exam-forge |
|---|---|---|
| 出题依据 | 模糊概念 | **你学校的真题 + 老师重点** |
| 风格匹配 | 随机 | **复刻原卷措辞、陷阱、难度曲线** |
| 知识点覆盖 | 随机 | **优先出原卷没覆盖的重点考点** |
| 学习价值 | 只有题目 | **每题带解题步骤 + insight + 常见错误** |
| 学科适配 | CS 通用 | **自动识别理工/文商/语言，切换模板** |

---

## 快速开始

```bash
git clone https://github.com/[你的用户名]/exam-forge
cd exam-forge
bash install.sh
```

在 Claude Code 中输入 `/exam-forge input`，按提示操作。

> 详细安装说明见 [docs/INSTALL.md](docs/INSTALL.md)

---

## 谁适合用

| 你… | |
|------|:--:|
| 本科生，学校近年不再公开真题 | ✅ |
| 手里只有几套旧题，做烂了 | ✅ |
| 老师划了重点但不知道怎么出题 | ✅ |
| CS、数学、物理、经济、外语…… | 🆕 |
| 想检验自己到底掌握到什么程度 | ✅ |

---

## 命令

| 命令 | 做什么 |
|------|--------|
| `/exam-forge input` | 输入真题 + 重点 |
| `/exam-forge analyze` | 分析出题规律 |
| `/exam-forge generate` | 生成模拟卷 |
| `/exam-forge regenerate` | 不满意，重新出一份 |
| `/exam-forge export md` | 导出 Markdown |
| `/exam-forge export docx` | 导出 Word 文档 |

详细说明见 [commands/](commands/)

---

## 真题提取

| 格式 | 工具 | 安装 |
|------|------|------|
| PDF（文字型） | PyMuPDF (fitz) | `pip install PyMuPDF` |
| PDF（图片型） | tesseract.js | `npm install -g tesseract.js` |
| 图片 (.png/.jpg) | tesseract.js | 同上 |
| Word (.docx) | python-docx | `pip install python-docx` |
| 文本 (.txt/.md) | 直接读取 | 无 |

> 渐进增强：不装任何工具也能用（手动粘贴真题），装了体验更好。

---

## 导出

| 格式 | 命令 | 说明 |
|------|------|------|
| Markdown | `/exam-forge export md` | 默认 |
| Word | `/exam-forge export docx` | 需 pandoc 或 python-docx |
| PDF | ❌ | 不支持（中文乱码），建议 `.docx` → WPS 另存 PDF |

---

## 项目结构

```
exam-forge/
├── skill/SKILL.md      # ⭐ 核心 System Prompt
├── commands/           # 子命令说明
├── docs/               # 详细文档
├── install.sh          # 一键安装
├── README.md           # 本文件
├── CONTRIBUTING.md     # 贡献指南
└── LICENSE             # MIT
```

---

## 文件结构（Skill 运行时）

```
你的项目/
├── inputs/             # 👈 把真题放这里
│   ├── 2020-期末.pdf
│   └── 重点.jpg
└── outputs/            # 👈 模拟卷输出到这里
    ├── 模拟卷（一）-数据结构.md
    └── 模拟卷（一）-数据结构.docx
```

---

## 常见问题

**Q: 不用 Claude Code 能用吗？**
可以。把 `skill/SKILL.md` 复制到 ChatGPT / Kimi / DeepSeek 的 System Prompt 中使用。

**Q: 扫描版 PDF 怎么处理？**
安装 `tesseract.js`（`npm install -g tesseract.js`），Skill 会自动 OCR。

**Q: 能导出 PDF 吗？**
不推荐直接导出（中文大概率乱码）。导出 `.docx` 后在 WPS/Word 中另存为 PDF。

**Q: 非 CS 专业能用吗？**
能。自动从课程名和真题题型推断学科类型，切换到对应出题模板。纯论述型考试（如历史、哲学）效果会打折扣。

**Q: 需要额外花钱吗？**
不需要。Skill 模式下 AI 推理完全由你已有的 Claude 完成，零额外 API 调用。

---

## License

MIT
