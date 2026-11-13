# Multi-platform ultra-lightweight Node.js container for ContextShield MCP Gateway
FROM node:20-alpine AS runner

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=8080

# Copy package metadata and source
COPY package.json ./
COPY README.md ./
COPY bin ./bin

# Set executable permissions
RUN chmod +x ./bin/contextshield.js

# Expose standard Cloud Run port
EXPOSE 8080

# Launch in HTTP/SSE Gateway Mode
CMD ["node", "./bin/contextshield.js", "--http"]
