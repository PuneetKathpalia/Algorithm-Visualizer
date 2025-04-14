# Use Nginx to serve static files
FROM nginx:alpine

# Copy HTML/CSS into the default Nginx public directory
COPY . /usr/share/nginx/html

# Expose port 80
EXPOSE 80
