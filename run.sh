#docker run -v $(pwd)/mysql_datadir:/var/lib/mysql:ro -it --name mysql5617 --rm mysql:5.6.17
#docker run -it --name mysql5617 --rm mysql:5.6.17
#docker run --mount src="$(pwd)/mysql_datadir",target=/var/lib/mysql,type=bind -it --name mysql5617 --rm mysql:5.6.17
docker volume create --driver local --opt type=none --opt=device="$(pwd)"/mysql_datadir --opt o=bind --name mysql_datadir
docker run -v mysql_datadir:/var/lib/mysql:ro -it --name mysql5617 --rm mysql:5.6.17
