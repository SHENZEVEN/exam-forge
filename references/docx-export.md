# Word 文档导出

## 目录
- 导出流程
- pandoc 导出（推荐）
- python-docx 导出（备选）
- 两个工具都不可用时
- Word 导出的排版要求
- 关于 PDF 导出

---

## 导出流程

按优先级尝试：

---

## pandoc 导出（推荐）

排版最佳，不加模板直接用默认样式即可：

```bash
pandoc outputs/模拟卷.md -o outputs/模拟卷.docx
```

安装方式：
- macOS: `brew install pandoc`
- Windows: `choco install pandoc`
- Linux: `apt install pandoc`

> 如果用户有自己学校的固定模板（如带校徽的表头），可以用 `--reference-doc=用户提供的模板.docx` 套用。不加这个参数也能正常导出。

---

## python-docx 导出（备选）

当 pandoc 不可用时，用 python-docx 编程生成：

```bash
pip install python-docx
python3 scripts/generate_docx.py outputs/模拟卷.md -o outputs/模拟卷.docx --course "数据结构"
```

脚本自动处理页眉、分页符、姓名学号填空区，详见 [scripts/generate_docx.py](../scripts/generate_docx.py)。

---

## 两个工具都不可用时

提示用户：
> "要导出 Word 文档，请安装以下任一工具：
>  A. pandoc（推荐）：brew install pandoc / choco install pandoc
>  B. python-docx：pip install python-docx"

---

## Word 导出的排版要求

导出时自动添加以下元素（不依赖外部模板）：

- **页眉**：课程名 + "模拟试卷（一）"
- **试卷头部**：姓名/学号填空区
- **分页符**：题型之间分页；试卷与答案之间分页
- **字体**：中文默认宋体，英文和数字默认 Times New Roman（pandoc 默认即可）

> 表格、代码块、公式等特殊元素的渲染由 pandoc 自动处理，一般无需额外配置。

---

## 关于 PDF 导出

⚠️ **已知问题**：pandoc/LaTeX 中文 PDF 导出大概率乱码，原因是中文字体配置复杂。**不推荐直接导出 PDF**。

建议导出 Word 后，在 Word / WPS 中另存为 PDF（排版无问题）。
