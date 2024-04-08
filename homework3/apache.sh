#!/bin/bash

sudo apt update
sudo apt install apache2 -y
sudo systemctl start apache2
sudo systemctl enable apache2
echo "<html><body><h1>Hello, World!</h1></body></html>" | sudo tee /var/www/html/hello.html
sudo systemctl restart apache2


