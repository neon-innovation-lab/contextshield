# ContextShield 🛡️

> **Zero-Trust Dynamic MCP Router, AST Security Firewall & Token Guard for Cursor, Windsurf, and Claude Code.**

[![npm version](https://img.shields.io/badge/npm-v1.0.0-blue.svg)](https://npmjs.com/package/contextshield)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![MCP Compliant](https://img.shields.io/badge/MCP-2024--11--05-emerald.svg)](https://modelcontextprotocol.io)

ContextShield eliminates the **Cursor 40-Tool Hard Limit** and slashes LLM context window token waste by up to **85%**. Instead of force-feeding dozens of raw MCP JSON schemas into your prompt on every conversation turn, ContextShield acts as an intelligent, zero-latency local proxy that routes, filters, and secures downstream MCP tools on demand.

---

## ⚡ The Problem: The "Context Window Tax" & 40-Tool Limit

1. **The Cursor 40-Tool Ceiling**: Cursor restricts workspaces to a maximum of 40 active tools. Connecting 4 or 5 popular MCP servers (Postgres, GitHub, Slack, Filesystem, Puppeteer) immediately exceeds this limit and fails.
2. **Context Bloat & Token Cost**: A typical MCP schema takes 250–400 tokens. Loading 40 tools wastes **12,000–16,000 tokens on every single turn**, multiplying API billing and pushing models toward hallucination.
3. **Prompt Injection & Tool Hijacking**: Rogue prompts or poisoned documents can instruct LLMs to invoke destructive tools (`rm -rf`, DROP TABLE, or secret exfiltration) without guardrails.

---

## 🚀 How ContextShield Solves It

```
[ Cursor / Claude Desktop / Windsurf ]
                  │
                  ▼ (Stdio JSON-RPC 2.0)
       ┌────────────────────────┐
       │   ContextShield Proxy  │ ◄── Saves ~15,000 tokens/turn
       │  (AST Security Guard)  │ ◄── Blocks malicious injection
       └──────────┬─────────────┘
                  │ Dynamic routing
       ┌──────────┼───────────────┬────────────────┐
       ▼          ▼               ▼                ▼
   [Postgres]  [GitHub]      [Filesystem]     [Docker/CLI]
```

- **Universal Meta-Dispatch**: Advertises a compact dispatch schema to your IDE, keeping you well under Cursor's 40-tool limit while retaining access to 100+ downstream tools.
- **AST Security Firewall**: Intercepts shell injections (`rm -rf`, `; mkfs`), path traversals (`/etc/passwd`), and API key leaks in real time.
- **Local & Air-Gapped**: Runs 100% locally on your machine via stdio. Zero third-party cloud custody.

---

## 📦 10-Second Setup

### 1. Cursor IDE (`~/.cursor/mcp.json`)

Add ContextShield to your Cursor MCP settings:

```json
{
  "mcpServers": {
    "contextshield": {
      "command": "npx",
      "args": ["-y", "contextshield", "--stdio"]
    }
  }
}
```

### 2. Claude Desktop (`claude_desktop_config.json`)

```json
{
  "mcpServers": {
    "contextshield": {
      "command": "npx",
      "args": ["-y", "contextshield", "--stdio"]
    }
  }
}
```

### 3. Interactive Terminal / Health Check

```bash
npx contextshield
```

Output:
```text
====================================================================
  🛡️  CONTEXTSHIELD - Zero-Trust MCP Dynamic Router & Token Guard
  Version: 1.0.0 • Engine Status: Active
====================================================================
  [✓] AST Security Firewall : Active (Strict Injection Defense)
  [✓] Downstream Aggregator  : Ready
  [✓] License Status        : Pro Lifetime Verified
====================================================================
```

---

## 🔒 Security Firewall Specs

ContextShield actively analyzes tool parameters before passing execution downstream:

| Threat Vector | Pattern Detected | Firewall Action |
|:---|:---|:---|
| Destructive Shell Injection | `; rm -rf`, `&& mkfs`, Fork bombs | **BLOCKED (Critical)** |
| Path Traversal | `../../../../etc/passwd`, `..\..\Windows` | **BLOCKED (High)** |
| Credential Leakage | `Bearer sk-ant-...`, `ghp_...`, `AKIA...` | **BLOCKED (Critical)** |
| SQL Table Deletion | `; DROP TABLE`, `; TRUNCATE` | **BLOCKED (High)** |

---

## 🔑 Zero-Signup Pro Licensing

ContextShield offers a perpetual Pro Lifetime license without passwords or mandatory accounts. 

To arm Pro capabilities in your environment:
```json
{
  "mcpServers": {
    "contextshield": {
      "command": "npx",
      "args": ["-y", "contextshield", "--license", "CTX-PRO-XXXX-XXXX-XXXX-XXXX", "--stdio"]
    }
  }
}
```

Get your Pro Lifetime key at [Neon Innovation Lab](https://neoninnovationlab.com/tools/contextshield).

---

## 📄 License

MIT License. Designed by Neon Innovation Lab.
