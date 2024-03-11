#!/bin/bash
yum install httpd -y
systemctl restart httpd
systemctl enable httpd
cd /var/www/html
echo "<html><body> <h1> Hi from $(hostname -f) </html></body></h1>" > index.html
cd ~
yum install docker -y
systemctl restart docker
systemctl enable docker
usermod -aG docker ec2-user

docker run -p 8080:80 -itd nginx
docker run -p 8081:80 -itd nginx