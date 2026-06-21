# exam-forge — AI 期末模拟卷生成器

## 一句话

上传往年真题 + 老师划的重点 → AI 自动分析出题规律 → 生成风格一致的全新模拟卷（含答案、解题步骤、常见错误、知识点覆盖报告）。

## 核心洞察

本科生期末复习最大的痛点是**没题练**——学校近年不再公开真题，只有几套旧题。学生翻来覆去做烂熟的那几道旧题，上考场发现题型不熟、考点没覆盖。

和直接问 ChatGPT "帮我出一套卷子"的区别：exam-forge 先"读"真题——分析题型分布、知识点权重、难度曲线、出题风格、措辞习惯——再按规律生成新卷。不是随机出题，是风格复刻。

## 形态

Claude Code Skill。核心是一个 System Prompt（`skill/SKILL.md`），所有 AI 推理由用户已有的 Claude 完成，零额外 API 调用。

## 项目结构

```
exam-forge/
├── skill/SKILL.md      # ⭐ 核心：Skill 系统 Prompt
├── commands/           # 子命令说明
│   ├── input.md
│   ├── analyze.md
│   ├── generate.md
│   └── export.md
├── docs/
│   └── INSTALL.md      # 详细安装说明
├── README.md           # GitHub 首页
├── CONTRIBUTING.md     # 贡献指南
├── LICENSE             # MIT
├── install.sh          # 一键安装
└── CLAUDE.md           # 本文件
```

## 设计原则

- **渐进增强**：不装任何额外工具也能用（手动粘贴真题），装了体验更好
- **学科自适应**：自动识别理工/文商/语言，切换出题模板
- **学生视角**：出卷是复习工具，解题步骤 + 常见错误比题目本身更有价值
- **零依赖发行**：Skill 模式下零 API 调用、零后端、零数据库

## 安装

```bash
bash install.sh
```

或手动：`cp skill/SKILL.md ~/.claude/skills/exam-forge/SKILL.md`

## 使用

在 Claude Code 中：
```
/exam-forge input     → 输入真题
/exam-forge analyze   → 分析规律
/exam-forge generate  → 生成模拟卷
/exam-forge export md → 导出 Markdown
/exam-forge export docx → 导出 Word
```

## 项目矩阵

```
面试模拟器（Web App）─── AI 消费品，完整前后端
oss-scout（Skill）    ─── AI 工具链，开发者生态
exam-forge（Skill）   ─── AI 教育产品，学生场景
```

三个项目三个方向，面试时串联讲：
> "面试模拟器是 Web App，后面两个我选了 Skill 形态——因为产品形态应该跟着用户走。"
