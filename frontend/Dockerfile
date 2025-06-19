### STAGE 1: Build ###

FROM node:20-alpine AS builder
WORKDIR /app

# 1. Installer les dépendances
COPY package*.json ./
RUN npm install

# 2. Copier la config Vite, le HTML, et le code source
COPY vite.config.js ./
COPY index.html ./
COPY public ./public
COPY src ./src

# 3. Lancer le build
RUN npm run build

### STAGE 2: Serve ###
FROM nginx:stable-alpine

# Copy the build output from the builder stage
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy the custom Nginx configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
