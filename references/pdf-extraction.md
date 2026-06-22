# PDF/图片/Word 文本提取流水线

当用户把真题文件放入 `inputs/` 文件夹后，按以下流程提取文本内容。

## 目录
- 提取策略总览
- PDF 文件提取
- 图片文件提取
- Word 文件提取
- 文本文件提取
- OCR 兜底方案
- 全部失败时的处理

---

## 提取策略总览

对 `inputs/` 下每个文件，按类型走对应提取路径，**优先用最可靠的工具，失败自动降级**。

核心原则：
- 先尝试直接提取（最快、最可靠）
- 直接提取失败 → OCR
- OCR 不可用 → 提示用户手动粘贴

---

## PDF 文件提取

按优先级依次尝试：

**第1步：PyMuPDF (fitz) — 最可靠，中文完美**
```bash
python3 -c "import fitz; doc=fitz.open('inputs/xxx.pdf'); [print(page.get_text()) for page in doc]"
```

**第2步：pdftotext -layout — 轻量备选**
```bash
pdftotext -layout inputs/xxx.pdf -
```

**第3步：PyPDF2 — 纯 Python 兜底**
```bash
python3 -c "from PyPDF2 import PdfReader; r=Reader('inputs/xxx.pdf'); [print(p.extract_text() or '') for p in r.pages]"
```

**第4步：tesseract.js OCR — 图片型 PDF 兜底**
```bash
node -e "const Tesseract=require('tesseract.js'); Tesseract.recognize('inputs/xxx.png','chi_sim').then(r=>console.log(r.data.text))"
```

---

## 图片文件提取 (.png/.jpg/.jpeg)

**第1步：Claude 视觉能力** — 直接用 Read 工具读取图片，Claude 能看懂

**第2步：tesseract.js OCR**
```bash
node -e "const Tesseract=require('tesseract.js'); Tesseract.recognize('inputs/xxx.png','chi_sim').then(r=>console.log(r.data.text))"
```

---

## Word 文件提取 (.docx)

**第1步：python-docx**
```bash
python3 -c "from docx import Document; doc=Document('inputs/xxx.docx'); [print(p.text) for p in doc.paragraphs]"
```

**第2步：mammoth (Node.js 备选)**
```bash
npx mammoth inputs/xxx.docx -
```

---

## 文本文件 (.txt/.md)

直接用 Read 工具读取，无需额外处理。

---

## OCR 兜底方案

当文字提取步骤全部返回空或明显不完整时，进入 OCR：

① 首先尝试 PyMuPDF 渲染为图片 + tesseract.js：
```bash
python3 -c "
import fitz; doc = fitz.open('inputs/xxx.pdf')
for i, page in enumerate(doc):
    page.get_pixmap(dpi=200).save(f'inputs/_ocr_page{i}.png')
"
```
然后对每张 `_ocr_page*.png` 执行 tesseract.js OCR。

② 若 tesseract.js 未安装，提示用户：
> "检测到图片型 PDF，需要 OCR 提取文字。请运行：
>  npm install tesseract.js
>  安装完成后我自动提取。或者你可以：
>  - 把 PDF 截图保存为 PNG，放回 inputs/ 文件夹
>  - 手动复制真题文本粘贴给我"

③ 若 Node.js 不可用，提示用户：
> "OCR 需要 Node.js 环境。你可以：
>  - 安装 Node.js：https://nodejs.org
>  - 或安装系统 tesseract：brew/choco/apt install tesseract
>  - 或手动复制真题文本粘贴给我"

---

## 全部失败时的处理

如果以上所有方法均失败，向用户说明情况并建议：
1. 截图真题粘贴到对话中（最快捷）
2. 手动输入真题文本
3. 尝试将 PDF 导出为纯文本后粘贴
