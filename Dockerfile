# Use the official Nginx image from the Docker Hub
FROM nginx:alpine

# Copy the current directory contents into the Nginx web root
COPY . /usr/share/nginx/html
     

