#!/bin/bash
# ADD Framework — Project Scaffold Script
# Usage: ./init.sh [target-directory]
# Creates an .add/ directory structure with all standard templates.

set -e

TARGET="${1:-.}"
ADD_DIR="$TARGET/.add"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
TEMPLATE_DIR="$(dirname "$SCRIPT_DIR")/templates"

if [ -d "$ADD_DIR" ]; then
    echo "⚠️  .add/ directory already exists in $TARGET"
    echo "   Use --force to overwrite templates (preserves existing artifacts)."
    if [ "$2" != "--force" ]; then
        exit 1
    fi
fi

echo "🔧 Initializing ADD structure in $TARGET..."

# Create directory structure
mkdir -p "$ADD_DIR"/{briefs,context,constraints,executions,validations,reviews,metrics,templates}

# Copy templates
if [ -d "$TEMPLATE_DIR" ]; then
    cp "$TEMPLATE_DIR"/*.md "$ADD_DIR/templates/" 2>/dev/null || true
    echo "✅ Templates copied to $ADD_DIR/templates/"
else
    echo "⚠️  Template directory not found at $TEMPLATE_DIR"
    echo "   Creating empty template directory."
fi

# Create .gitkeep files to preserve empty directories
for dir in briefs context constraints executions validations reviews metrics; do
    touch "$ADD_DIR/$dir/.gitkeep"
done

# Create ADD manifest
cat > "$ADD_DIR/ADD.md" << 'EOF'
# ADD — Agent-Driven Development

This project follows the ADD methodology.

## Quick Reference

**Cycle**: SCOPE → FRAME → CONSTRAIN → EXECUTE → VERIFY → CONSOLIDATE

**Five Nevers**:
1. Never execute without explicit validation criteria
2. Never prompt without structured context
3. Never iterate without formalized feedback
4. Never ship without an execution log
5. Never trust without a verification gate

**Templates**: See `.add/templates/`

**Documentation**: https://github.com/Pyro-IV/Agent-Driven-Development

## Structure

```
.add/
├── briefs/        — Agent Briefs (SCOPE phase)
├── context/       — Context Packs (FRAME phase)
├── constraints/   — Constraint Sheets (CONSTRAIN phase)
├── executions/    — Execution Logs (EXECUTE + CONSOLIDATE)
├── validations/   — Validation Checklists (VERIFY phase)
├── reviews/       — Failure Reviews (on FAIL)
├── metrics/       — Aggregated metrics
└── templates/     — Project-specific templates
```
EOF

echo ""
echo "✅ ADD structure initialized in $ADD_DIR"
echo ""
echo "   Next steps:"
echo "   1. Read $ADD_DIR/ADD.md"
echo "   2. Before your next agent task, create a brief:"
echo "      cp $ADD_DIR/templates/agent-brief.md $ADD_DIR/briefs/001-my-task.md"
echo "   3. Commit the .add/ directory to version control."
echo ""
