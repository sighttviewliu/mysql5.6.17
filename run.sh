## For volume explicit
docker volume create --driver local --opt type=none --opt device="$(pwd)"/var/lib/mysql --opt o=bind --name mysql_datadir

## For mount 
docker run -v mysql_datadir:/var/lib/mysql --name mysql5617 --rm mysql:5.6.17

## For testing
docker run --name mysql5617 --rm mysql:5.6.17

## For testing
docker run -e MYSQL_ROOT_PASSWORD='a' --name mysql5617 --rm mysql:5.6.17

## For testing
docker stop mysql5617
docker run -e MYSQL_ROOT_PASSWORD='a' --name mysql5617 --rm mysql:5.6.17
docker exec -it mysql5617 mysql -uroot -pa
