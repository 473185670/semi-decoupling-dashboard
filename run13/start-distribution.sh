#!/usr/bin/env bash
# ============================================================
# Arbitrage Asset Hub — One-Click Distribution Startup
# Run: bash dist/run13/start-distribution.sh
# ============================================================
set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "╔══════════════════════════════════════════════════════╗"
echo "║       Arbitrage Asset Hub — Distribution Setup       ║"
echo "║           44 Assets · 7 Tasks · 0 Middlemen          ║"
echo "╚══════════════════════════════════════════════════════╝"
echo -e "${NC}"

ASSETS_DIR="$(cd "$(dirname "$0")/../.." && pwd)/assets"
echo -e "${YELLOW}📂 Asset base: ${ASSETS_DIR}${NC}"
echo ""

# -----------------------------------------------------------
# Check prerequisites
# -----------------------------------------------------------
echo -e "${CYAN}[1/7] Checking prerequisites...${NC}"
MISSING=""

command -v python3 >/dev/null 2>&1 || MISSING+=" python3"
command -v git >/dev/null 2>&1 || MISSING+=" git"

if [ -n "$MISSING" ]; then
    echo -e "  ${YELLOW}⚠ Missing:${MISSING}${NC}"
    echo "  Some features may be limited."
else
    echo -e "  ${GREEN}✅ All core tools available${NC}"
fi

# Check gh auth
if command -v gh >/dev/null 2>&1; then
    gh auth status 2>/dev/null && echo -e "  ${GREEN}✅ GitHub CLI authenticated${NC}" || echo -e "  ${YELLOW}⚠ GitHub CLI not authenticated — run 'gh auth login'${NC}"
else
    echo -e "  ${YELLOW}⚠ gh CLI not installed${NC}"
fi

# Check if Gumroad credentials exist
if [ -f "${ASSETS_DIR}/.gumroad_token" ]; then
    echo -e "  ${GREEN}✅ Gumroad token found${NC}"
else
    echo -e "  ${YELLOW}⚠ No Gumroad token — create account at gumroad.com${NC}"
fi

echo ""

# -----------------------------------------------------------
# Task 1: Zhihu Publishing (P0)
# -----------------------------------------------------------
echo -e "${CYAN}[2/7] P0: Zhihu Publishing — MCP Migration Article${NC}"
MCP_ARTICLE="${ASSETS_DIR}/zhihu-mcp-urgent-20260721.md"
if [ -f "$MCP_ARTICLE" ]; then
    echo -e "  ${GREEN}✅ Article ready at: ${MCP_ARTICLE}${NC}"
    echo -e "  ${YELLOW}  → Open https://zhuanlan.zhihu.com/write in your browser${NC}"
    echo -e "  ${YELLOW}  → Copy-paste the content and publish${NC}"
    echo -e "  ${RED}  ⚠ Deadline: July 28, 2026 (7 days)${NC}"
else
    echo -e "  ${RED}❌ MCP article not found${NC}"
fi
echo ""

# -----------------------------------------------------------
# Task 2: Gumroad Setup (P0)
# -----------------------------------------------------------
echo -e "${CYAN}[3/7] P0: Gumroad Setup — Prompt Pack + n8n Template${NC}"
PROMPT_PACK="${ASSETS_DIR}/run12-zero-dep-distributor/gumroad-listing.md"
N8N_LISTING="${ASSETS_DIR}/run11-n8n-deployer/dist/gumroad-listing.md"
if [ -f "$PROMPT_PACK" ]; then
    echo -e "  ${GREEN}✅ Prompt Pack listing ready: ${PROMPT_PACK}${NC}"
    echo -e "  ${YELLOW}  → Create Gumroad account → Create product → Paste listing${NC}"
    echo -e "  ${YELLOW}  → Upload prompt-pack-v1.0.md + prompt-pack-v1.0.json${NC}"
    echo -e "  ${YELLOW}  → Pricing: Individual \$5 / Team \$20 / Enterprise \$50${NC}"
fi
if [ -f "$N8N_LISTING" ]; then
    echo -e "  ${GREEN}✅ n8n Template listing ready: ${N8N_LISTING}${NC}"
    echo -e "  ${YELLOW}  → Create product on Gumroad → Pricing: \$49 Pro / \$199 Enterprise${NC}"
    echo -e "  ${YELLOW}  → Upload workflow.json + docker-compose.yml + .env.example + deploy-agent.sh${NC}"
fi
echo ""

# -----------------------------------------------------------
# Task 3: Deploy Asset Hub (P1)
# -----------------------------------------------------------
echo -e "${CYAN}[4/7] P1: Deploy Self-Hosted Asset Hub${NC}"
HUB_HTML="${ASSETS_DIR}/../dist/run13/arbitrage-asset-hub-v2.html"
if [ -f "$HUB_HTML" ]; then
    echo -e "  ${GREEN}✅ Asset Hub HTML ready: ${HUB_HTML}${NC}"
    echo -e "  ${YELLOW}  Option 1: Cloudflare Pages — drag & drop${NC}"
    echo -e "  ${YELLOW}  Option 2: Netlify — drag & drop${NC}"
    echo -e "  ${YELLOW}  Option 3: GitHub Pages — push to repo, enable Pages${NC}"
    echo -e "  ${YELLOW}  Option 4: python3 -m http.server 8080 (local preview)${NC}"
fi
echo ""

# -----------------------------------------------------------
# Task 4: n8n Article to Zhihu (P1)
# -----------------------------------------------------------
echo -e "${CYAN}[5/7] P1: n8n Tutorial Article to Zhihu${NC}"
N8N_ARTICLE="${ASSETS_DIR}/run11-n8n-deployer/dist/zhihu-article.md"
if [ -f "$N8N_ARTICLE" ]; then
    echo -e "  ${GREEN}✅ n8n article ready: ${N8N_ARTICLE}${NC}"
    echo -e "  ${YELLOW}  → Open https://zhuanlan.zhihu.com/write${NC}"
    echo -e "  ${YELLOW}  → Copy-paste and publish${NC}"
fi
echo ""

# -----------------------------------------------------------
# Task 5: CSDN + 掘金 (P1)
# -----------------------------------------------------------
echo -e "${CYAN}[6/7] P1: CSDN + 掘金 Publishing${NC}"
echo -e "  ${YELLOW}  → Mirror MCP article to CSDN: https://mp.csdn.net/${NC}"
echo -e "  ${YELLOW}  → Mirror MCP article to 掘金: https://juejin.cn/editor${NC}"
echo -e "  ${YELLOW}  → Mirror n8n article to CSDN + 掘金${NC}"
echo ""

# -----------------------------------------------------------
# Task 6: Sponsorship Infrastructure (P2)
# -----------------------------------------------------------
echo -e "${CYAN}[7/7] P2: Sponsorship Infrastructure${NC}"
echo -e "  ${YELLOW}  → Create GitHub Sponsors profile${NC}"
echo -e "  ${YELLOW}  → Set up Buy Me a Coffee / Ko-fi${NC}"
echo -e "  ${YELLOW}  → Create real crypto wallets (BTC/ETH/SOL)${NC}"
echo -e "  ${YELLOW}  → Update all 44 assets with real addresses${NC}"
echo ""

# -----------------------------------------------------------
# Summary
# -----------------------------------------------------------
echo -e "${CYAN}══════════════════════════════════════════════════════${NC}"
echo -e "${GREEN}  Distribution plan complete.${NC}"
echo -e "  ${YELLOW}  Total tasks: 7${NC}"
echo -e "  ${RED}  P0 (must do): 3${NC}"
echo -e "  ${YELLOW}  P1 (should do): 3${NC}"
echo -e "  ${CYAN}  P2 (nice to do): 1${NC}"
echo -e "${CYAN}══════════════════════════════════════════════════════${NC}"
echo ""
echo -e "${GREEN}  Estimated time to complete all: 30 minutes${NC}"
echo -e "${GREEN}  First revenue possible: Today (Gumroad \$5 Prompt Pack)${NC}"
echo -e "${GREEN}  Highest ROI: Gumroad \$49 n8n template (1 sale = 216x token cost)${NC}"
echo ""

# -----------------------------------------------------------
# Quick preview
# -----------------------------------------------------------
echo -e "${CYAN}Preview: Asset Hub HTML (first 20 lines)${NC}"
head -20 "$HUB_HTML" 2>/dev/null || echo "  (no hub file)"
echo ""
echo -e "${CYAN}To view the Asset Hub: open dist/run13/arbitrage-asset-hub-v2.html in your browser${NC}"
echo -e "${CYAN}To start local preview: python3 -m http.server 8080 --directory dist/run13/${NC}"