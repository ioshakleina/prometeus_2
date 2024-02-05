# Stage 1: Build Stage
FROM node:14 AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build  # Assuming you have a build script, adjust as needed

# Stage 2: Production Stage
FROM node:14-alpine

WORKDIR /usr/src/app

# Copy only necessary files from the builder stage
COPY --from=builder /usr/src/app/dist ./dist
COPY package*.json ./

# Install only production dependencies
RUN npm install --production

# Expose the port the app runs on
EXPOSE 8080

# Start the application
CMD ["node", "dist/app.js"]

# Stage 3: Redis Stage
FROM redis:latest AS redis

# Expose the default Redis port
EXPOSE 6379
