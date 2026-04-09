# Stage 1: Build stage
FROM node:18 AS builder

WORKDIR /app

# Copy package files first (for caching)
COPY app/package*.json ./

# Install dependencies
RUN npm install

# Copy remaining app files
COPY app/ .

# Stage 2: Production stage
FROM node:18-alpine

WORKDIR /app

# Copy from builder
COPY --from=builder /app /app

EXPOSE 3000

CMD ["npm", "start"]
