.PHONY: reload go stop del

reload:
	make down && make del && make go
go:
	cd srcs && sudo mkdir -p /home/rhilda/data/wp && sudo mkdir -p /home/rhilda/data/db && sudo docker-compose up -d && cd ..
down:
	cd srcs && sudo docker-compose down && cd ..
del:
	sudo docker system prune --all --force
	sudo rm -rf /home/rhilda/data && sudo docker volume rm `sudo docker volume ls -q`