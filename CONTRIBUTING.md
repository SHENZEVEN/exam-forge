# 贡献指南

欢迎为 exam-forge 贡献！以下是一些参与方式：

## 贡献方式

### 🐛 报告 Bug
- 在 Issues 中描述：你做了什么、期望什么、实际发生了什么
- 附上错误信息和环境（OS、Claude Code 版本）

### 💡 提 Feature Request
- 描述你想要的场景（"我有一份手写笔记想提取"）
- 说明为什么现有方案不够

### 🔧 改进 Skill Prompt
Skill 的核心是 `skill/SKILL.md`。改进方向：
- **新题型支持**：你的学科有 exam-forge 不会出的题型？提 PR 加模板
- **分析维度**：有更聪明的分析真题的方法？欢迎贡献
- **提示词优化**：让 AI 出题更准/更少胡说的 prompt 改进

### 🌍 学科适配
帮 exam-forge 更好地支持你的专业：
1. 在 `commands/` 下加一个新的命令文件，描述你学科的特殊出题逻辑
2. 提供一份匿名真题样本（知识点脱敏）作为参考

### 📝 文档改进
- 翻译 README 到其他语言
- 补充更详细的示例
- 修正文档中的错误

## 提交 PR

1. Fork 本仓库
2. 创建你的 feature 分支：`git checkout -b feature/xxx`
3. 提交改动：`git commit -m 'feat: xxx'`
4. 推送到分支：`git push origin feature/xxx`
5. 打开 Pull Request

## 项目结构

```
exam-forge/
├── skill/SKILL.md      # ⭐ 核心 System Prompt
├── commands/           # 子命令说明
├── docs/               # 详细文档
├── README.md           # 项目首页
└── install.sh          # 一键安装
```

## 许可证
MIT License。贡献即同意你的代码以 MIT 协议发布。
