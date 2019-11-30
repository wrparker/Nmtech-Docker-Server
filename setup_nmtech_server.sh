# install docker
curl -sS https://get.docker.com/ | sh

# install docker-compose
apt update
apt install docker-compose -y

# Make directories
mkdir /var/www/
mkdir -p /var/www/nginx-proxy/conf.d
mkdir -p /var/www/nginx-proxy/certs
mkdir -p /var/www/nginx-proxy/html
mkdir -p /var/www/nginx-proxy/vhost.d

# copy sites
cp -r ./sites/* /var/www

# Required network that all served containers must be added to.
docker network create nginx-proxy

systemctl enable docker
systemctl restart docker
cd /var/www/nginx-proxy && docker-compose up -d

docker container ls

# Need to install mysqli_close
#need to do secure_mysql_install


# Cheats:
# full db backup: mysqldump --all-databases --single-transaction --quick --lock-tables=false > ~/full-backup-$(date +%F).sql
# full file backup: cd /var/www && tar -cvf ~/full-backup-$(date +%F).tar.gz .
