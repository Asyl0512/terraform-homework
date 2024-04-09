#!/bin/bash

sudo yum update -y
sudo yum install httpd -y
sudo systemctl start httpd
sudo systemctl enable httpd
echo "<html><body><h1>Hello, World!</h1></body></html>" | sudo tee /var/www/html/hello.html
sudo systemctl restart httpd
