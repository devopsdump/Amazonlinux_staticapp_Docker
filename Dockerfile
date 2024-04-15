FROM amazonlinux:latest

# Define the website URL and the directory name as build arguments
ARG WEBSITE_URL=https://www.free-css.com/assets/files/free-css-templates/download/page2/ost-magazine.zip
ARG WEBSITE_DIR=ost-magazine

# Update the package lists and install Nginx and unzip
RUN yum update -y && \
    yum install -y nginx unzip && \
    yum clean all

# Download and unzip the static website files
ADD $WEBSITE_URL /tmp/
RUN mkdir -p /usr/share/nginx/html && \
    cd /usr/share/nginx/html && \
    unzip /tmp/ost-magazine.zip && \
    rm /tmp/ost-magazine.zip

# Move contents of extracted directory to html root
RUN mv /usr/share/nginx/html/$WEBSITE_DIR/* /usr/share/nginx/html && \
    rm -rf /usr/share/nginx/html/$WEBSITE_DIR

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start Nginx in the foreground when the container starts
CMD ["nginx", "-g", "daemon off;"]
