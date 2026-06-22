# exam-forge — AI 期末模拟卷生成器

上传往年真题 + 老师划的重点，自动分析出题规律，生成风格一致的模拟卷（含答案、解题步骤、常见错误、知识点覆盖报告）。

## 快速开始

### 1. 准备材料

在项目根目录创建 `inputs/` 文件夹，把以下材料全丢进去（混放也没关系）：

- 往年真题（PDF / 手机照片 / Word / 截图都行）
- 老师划的重点（PPT 截图 / Word / 文字都行）

### 2. 触发 Skill

```
/exam-forge input
```

然后告诉 Claude：
- 这是什么课、什么考试
- 材料在 `inputs/` 里（或直接粘贴）
- 有什么特殊要求（题量、难度、格式）

### 3. 生成的模拟卷

模拟卷会写入 `outputs/` 文件夹：

```
outputs/
├── 模拟卷（一）-[课程名].md           # 试卷 Markdown 原版
├── 模拟卷（一）-[课程名]-答案与解析.md  # 答案分册
└── 模拟卷（一）-[课程名].docx          # Word 版（可选）
```

每道题包含：**正确答案 + 解题步骤 + 关键 Insight + 常见错误 + 关联知识点**。

## 所有命令

| 命令 | 做什么 |
|------|--------|
| `/exam-forge input` | 输入材料（真题 + 重点） |
| `/exam-forge analyze` | 分析出题规律 |
| `/exam-forge generate` | 生成模拟卷 |
| `/exam-forge regenerate` | 重新出一份（换题保持风格） |
| `/exam-forge export md` | 导出 Markdown |
| `/exam-forge export docx` | 导出 Word 文档 |

## CLI 脚本

```bash
# Markdown → Word 导出（pandoc 的备选方案）
pip install python-docx
python3 scripts/generate_docx.py outputs/模拟卷.md -o outputs/模拟卷.docx --course "数据结构"
```

## 支持学科

自动适配，不需要手动选择：

| 学科类型 | 题型倾向 | 示例 |
|---------|---------|------|
| 理工科 | 计算、算法、证明、公式推导 | CS/数学/物理/工程 |
| 经管商科 | 概念辨析、模型应用、案例分析 | 经济/金融/会计/管理 |
| 文科社科 | 名词解释、简答、论述、材料分析 | 法学/教育/新闻 |
| 语言类 | 选择、完形、阅读、翻译、写作 | 英语/日语 |

## 文件结构

```
exam-forge/
├── SKILL.md
├── README.md                          # 本文件
├── scripts/
│   └── generate_docx.py               # Markdown → Word 导出脚本
└── references/
    ├── pdf-extraction.md              # 文本提取流水线
    ├── docx-export.md                 # Word 导出流程
    └── test-cases.md                  # 测试用例
```

## 注意事项

- 真题从 `inputs/` 读取，首次使用需手动创建该文件夹
- 模拟卷写入 `outputs/`，自动创建
- 不推荐直接导出 PDF（中文易乱码），建议导出 Word 后在 WPS/Word 中另存为 PDF
