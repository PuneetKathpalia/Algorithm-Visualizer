# Use an Nginx base image (Since it's a static HTML/JS app)
FROM nginx:alpine

# Copy your project files to the container
COPY . /usr/share/nginx/html

# Expose port 80 (Nginx default port)
EXPOSE 80

# Start Nginx when the container runs
CMD ["nginx", "-g", "daemon off;"]
