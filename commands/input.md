# /exam-forge input — 真题输入

## 做什么
引导用户输入至少一份往年真题，准备好出卷素材。

## 流程
1. 确认课程名和考试类型（期末/期中/单元测验）
2. 真题怎么给：放 `inputs/` 文件夹 或 直接粘贴
3. 自动检测文件类型 → 调用对应提取工具
4. 问老师有没有划重点（可选）
5. 问特殊要求（题量、难度、格式）
6. 总结画像，确认无误后进入分析

## 提取工具链
```
PDF（文字型）→ PyMuPDF → pdftotext → PyPDF2
PDF（图片型）→ tesseract.js OCR
图片 (.png/.jpg) → tesseract.js OCR
Word (.docx) → python-docx → mammoth
文本 (.txt/.md) → 直接读取
```

## 下一步
→ `/exam-forge analyze`
