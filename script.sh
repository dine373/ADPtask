wget https://get.docker.com/ -O /tmp/script.sh
chmod 755 /tmp/script.sh
/bin/bash /tmp/script.sh
service docker start

echo "127.0.0.1 myfirstpage.com" >> /etc/hosts
echo "127.0.0.1 mysecondpage.com" >> /etc/hosts
echo "127.0.0.1 mythirdpage.com" >> /etc/hosts

docker pull dine373/nginxadptask 

cat <<EOT >> /usr/lib/systemd/system/mynginx.service
Unit]
Description=The nginx HTTP and reverse proxy server
After=network.target remote-fs.target nss-lookup.target

[Service]
ExecStart=/bin/docker run -dt --privileged=true -p 80:80 --name nginx dine373/nginxadptask
ExecStop=/bin/docker stop nginx

[Install]
WantedBy=multi-user.target
EOT


ln -s /usr/lib/systemd/system/mynginx.service /etc/systemd/system/multi-user.target.wants/mynginx.service
service mynginx start
