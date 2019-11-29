# install docker
curl -sS https://get.docker.com/ | sh

# install docker-compose
apt update
apt install docker-compose -y

mkdir /var/www/
cp -r ./sites/* /var/www
