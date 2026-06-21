# exam-forge 安装指南

## 前置条件

| 你需要 | 用途 | 必须？ |
|--------|------|:--:|
| [Claude Code](https://claude.ai/code) | Skill 运行环境 | ✅ 必须 |
| Python 3.8+ | PDF/Word 文字提取（主力） | ⚡ 推荐 |
| Node.js 18+ | OCR 图片识别（备用） | 可选 |
| pandoc | Word 文档导出 | 可选 |

## 一键安装

```bash
bash install.sh
```

## 手动安装

### 1. 安装 Skill

```bash
mkdir -p ~/.claude/skills/exam-forge
cp skill/SKILL.md ~/.claude/skills/exam-forge/SKILL.md
```

### 2. 安装提取工具（按需）

```bash
# Python 工具（推荐，覆盖 80% 场景）
pip install PyMuPDF python-docx

# Node.js OCR（处理扫描版 PDF / 照片）
npm install -g tesseract.js

# 文档导出
# 方式A（推荐）：brew install pandoc / choco install pandoc
# 方式B：pip install python-docx
```

### 3. 准备真题

在项目根目录创建 `inputs/` 文件夹，放入真题文件：

```
inputs/
├── 2020-数据结构-期末.pdf
├── 老师重点.jpg
└── ...
```

### 4. 开始使用

在 Claude Code 中输入 `/exam-forge input`

---

## 依赖工具说明

| 工具 | 覆盖场景 | 安装方式 |
|------|---------|---------|
| PyMuPDF (fitz) | 文字型 PDF（中文完美） | `pip install PyMuPDF` |
| pdftotext | 文字型 PDF 备用 | 系统自带 |
| PyPDF2 | 文字型 PDF 二备 | `pip install PyPDF2` |
| python-docx | Word 文档提取 + 导出 | `pip install python-docx` |
| tesseract.js | 图片型 PDF / 照片 OCR | `npm install -g tesseract.js` |
| mammoth | Word 提取备用 (Node.js) | `npx mammoth`（免安装） |
| pandoc | Word 导出（排版最佳） | `brew/choco/apt install pandoc` |

> **设计原则**：渐进增强。不装任何工具也能用（手动粘贴真题），装了体验更好。

## 验证安装

```bash
# 检查 Skill 是否安装成功
ls ~/.claude/skills/exam-forge/SKILL.md

# 检查 Python 工具
python3 -c "import fitz; print('PyMuPDF ✅')"
python3 -c "import docx; print('python-docx ✅')"

# 检查 Node.js 工具
node -e "require('tesseract.js'); console.log('tesseract.js ✅')"

# 检查导出工具
pandoc --version | head -1 || echo "pandoc ❌ (Word导出不可用)"
```
