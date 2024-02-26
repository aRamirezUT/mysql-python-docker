# How to Run..

## Ensure you are able to run docker containers locally with 'docker compose'

## First
	docker login

## Second
	docker compose up -d --build
	docker compose up app

## You should get something similar to the following:
	✔ Container docker-py-mysql-mysql-1  Running                                                                                                                                                          0.0s 
	Tables created successfully!
	Tables seeded successfully!
	Tenant Name: arenR, Room Name: 100, Apartment Name: apartment1
	Tenant Name: arenR, Room Name: 200, Apartment Name: apartment2
	Tenant Name: annieN, Room Name: 102, Apartment Name: apartment1
	Tenant Name: zachF, Room Name: 103, Apartment Name: apartment1
	Tenant Name: zachF, Room Name: 300, Apartment Name: apartment3

## Using the Makefile..
	make clean-up
