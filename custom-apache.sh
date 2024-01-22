#!/bin/bash 

#updates, installs, and starts the Apache webservice
sudo yum update -y
sudo yum install httpd
sudo systemctl enable httpd
sudo systemctl start httpd

#sends the message to a created index.html file in the html directory
echo "<h1>Keep Pushing Green Team!!!<h1>" >> /var/www/html/index.html
