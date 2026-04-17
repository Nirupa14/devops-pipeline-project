# Stage 1 - Build
FROM node:18 AS build
WORKDIR /app
COPY app/ ./
RUN npm install

# Stage 2 - Lightweight image
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app .
CMD ["node", "app.js"]
