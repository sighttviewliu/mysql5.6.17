docker volume create --driver local --opt type=none --opt device="$(pwd)"/var/lib/mysql --opt o=bind --name mysql_datadir

docker run -v mysql_datadir:/var/lib/mysql --name mysql5617 --rm mysql:5.6.17
docker exec -it mysql5617 /bin/bash
