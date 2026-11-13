---
name: contextshield-mcp-router
description: Bypass Cursor's 40-tool hard limit, cut MCP schema token bloat by 85%, and block SQL/shell/PII threats with ContextShield AST firewall.
---

# ContextShield Dynamic MCP Router & Zero-Trust Firewall

Use this skill when connecting more than 40 MCP tools in Cursor, Claude Desktop, Windsurf, or Cline, or when auditing tool payloads for CWE-78 command injection and PII leaks.

## 1. Local Zero-Dependency Stdio Router (`npx`)
Run immediately without installation:
```bash
npx -y contextshield --stdio
```

Cursor configuration (`~/.cursor/mcp.json`):
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

## 2. Hosted Zero-Trust Streamable HTTP MCP Endpoint (25 Free Calls/Day)
Connect directly to Neon Innovation Lab's hosted gateway:
- **Endpoint:** `https://neoninnovationlab.com/api/mcp-gateway`
- **Live Playground:** `https://neoninnovationlab.com/tools/mcp-gateway-hub`
- **Tools Exposed:** `inspect_tool_call_security`, `redact_pii_dlp`, `proxy_secure_tool_call`, `get_gateway_status`

## 3. Production Upgrades (Direct PayPal - Zero Subscription Lock-In)
- **Lifetime Zero-Trust Gateway License ($99):** `https://neoninnovationlab.com/checkout?item=mcp_gateway`
- **Starter API Pack (500 calls - $19):** `https://neoninnovationlab.com/checkout?item=starter_mcp`
- **Custom OAuth 2.1 MCP Server Build ($299 / $1,499):** `https://neoninnovationlab.com/mcp-development`
