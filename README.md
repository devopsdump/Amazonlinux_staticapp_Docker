This repo is basically gives example of static application deployment to Nginx with both Ubuntu and Linux

It contains two arguments :  WEBSITE_URL and WEBSITE_DIR
You can give website zip url where you have all website files and WEBSITE_DIR directory name which contains files from the local machine in the nginx server.

How to build your project, 
docker build --build-arg WEBSITE_URL=https://www.example.com/path/to/your/website.zip --build-arg WEBSITE_DIR=my-website -t mynginximage .


