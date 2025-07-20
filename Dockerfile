# Use nginx as the base image
FROM nginx:alpine

# Install git and fetch Hextris code
RUN apk add --no-cache git \
    && git clone https://github.com/Hextris/hextris.git /usr/share/nginx/html \
    && rm -rf /var/cache/apk/*

# Inform Docker/Kubernetes that container listens on port 80
EXPOSE 80

# Start Nginx when container runs
CMD ["nginx", "-g", "daemon off;"]
