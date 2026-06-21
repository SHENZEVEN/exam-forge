#!/usr/bin/env bash
set -e

echo "📝 exam-forge — AI 期末模拟卷生成器"
echo "===================================="
echo ""

# ── 1. Install Skill ──────────────────────
SKILL_DIR="$HOME/.claude/skills/exam-forge"
mkdir -p "$SKILL_DIR"
cp skill/SKILL.md "$SKILL_DIR/SKILL.md"
echo "✅ Skill 已安装到 $SKILL_DIR"

# ── 2. Python tools (recommended) ──────────
echo ""
echo "── Python 提取工具（推荐）──"
if command -v python3 &>/dev/null; then
    pip3 install PyMuPDF python-docx PyPDF2 2>&1 | tail -3
    echo "✅ Python 工具安装完成"
else
    echo "⚠️  未检测到 python3，跳过 Python 工具。"
    echo "   文字型 PDF 和 Word 提取将不可用（可手动粘贴代替）"
fi

# ── 3. Node.js tools (optional OCR) ────────
echo ""
echo "── Node.js OCR 工具（可选）──"
if command -v node &>/dev/null; then
    npm install -g tesseract.js 2>&1 | tail -3
    echo "✅ tesseract.js 安装完成"
else
    echo "⚠️  未检测到 Node.js，跳过 OCR 工具。"
    echo "   图片型 PDF 需手动截图或粘贴文字"
fi

# ── 4. Export tools (optional) ─────────────
echo ""
echo "── 文档导出工具（可选）──"
if command -v pandoc &>/dev/null; then
    echo "✅ pandoc 已可用（Word 导出）"
elif command -v python3 &>/dev/null; then
    echo "✅ python-docx 已可用（Word 导出备用方案）"
else
    echo "⚠️  未检测到 pandoc 或 python3，Word 导出不可用"
fi

echo ""
echo "===================================="
echo "安装完成！在 Claude Code 中输入 /exam-forge 开始使用。"
echo ""
echo "使用前准备："
echo "  1. 把你的真题 PDF/图片/Word 放入当前目录的 inputs/ 文件夹"
echo "  2. 在 Claude Code 中运行 /exam-forge input"
