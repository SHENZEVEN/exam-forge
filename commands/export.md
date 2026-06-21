# /exam-forge export — 导出

## 做什么
将生成的模拟卷导出为文件。

## 格式

| 命令 | 格式 | 依赖 |
|------|------|------|
| `/exam-forge export md` | Markdown | 无 |
| `/exam-forge export docx` | Word 文档 | pandoc 或 python-docx |

## docx 导出链
1. 优先 pandoc：`pandoc output.md -o output.docx`
2. 备选 python-docx
3. 都没有 → 提示安装

## 关于 PDF
⚠️ 不支持直接导出 PDF（中文大概率乱码）。
建议路径：`.docx` → WPS/Word 另存为 PDF。

## 输出路径
`outputs/`
