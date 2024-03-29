help-default help:
	@echo "================================================================================"
	@echo " OPÇÕES"
	@echo "================================================================================"
	@echo "    dump: Executa o dump no banco de dados"
	@echo " restore: Executa o restore no banco de dados"
	@echo "    push: Executa o push no branch atual"
	@echo "    pull: Executa o pull no branch atual"
	@echo "  commit: Adiciona os arquivos ao índice e executa o commit"
	@echo ""

dump:
	mysqldump -h 45.79.92.163 -u root -pRoot-1982 -B --add-drop-database brgomes2 --skip-lock-tables | pv -s 2M > database.sql
	make restore

restore:
	cat database.sql | pv | docker exec -i mysql-server /usr/bin/mysql -u root --password=root --init-command="SET autocommit=0;"

push:
	git push origin $(shell git rev-parse --abbrev-ref HEAD)

pull:
	git pull origin $(shell git rev-parse --abbrev-ref HEAD)

commit:
	git add .
	git commit -m "$(m)"
