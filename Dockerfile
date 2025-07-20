# Use nginx as the base image
FROM nginx:alpine

# Copy local Hextris game files into nginx's default public folder
COPY hextris/ /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Start nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

