# Use a lightweight web server
FROM nginx:alpine

# Remove default nginx static files
RUN rm -rf /usr/share/nginx/html/*

# Copy your project files into the nginx server folder
COPY . /usr/share/nginx/html

# Copy custom nginx config
COPY default.conf /etc/nginx/conf.d/default.conf


# Expose port 90
EXPOSE 90

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
