run-sql:
	docker compose up -d --build mysql
	sleep 5
	docker compose run --rm  app
	docker compose down
