
# GoWabi Code Challenges

The project about displaying markers in google map using rails 6.

## Installation

```bash
  docker-compose up
```
## Setup Database

```bash
  docker exec -it gowabi-code-challenges_app_1 /bin/bash
  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:seed
```

## 


# GoWabi Code Challenges

The project about displaying markers in google map using rails 6.

## Installation

```bash
  docker-compose up
```
## Setup Database

```bash
  docker exec -it gowabi-code-challenges_app_1 /bin/bash
  bundle exec rake db:create
  bundle exec rake db:migrate
  bundle exec rake db:seed
```

## 


## Demo Link

Using Ec2 free tier to create, will remove by 06/02/2023

http://3.67.197.44:3000/
## Features

- Contains more than 1000 stores as a markers display in GoogleMap
- Redis to cache SQL queries
- Rails v6
- PostgreSQL
- dockerize project


## Optimizations

Currently, cannot connect between "app" container and redis container, since the firewall from iptable is blocking the connection, this happens when using WSL Window 11.

Changing to EC2, and setup iptable would solve the issue. With this SQL caching would working well.

Stores data were pulled directly from GoogleAPI

## Will improve
- Setup webpacker for new rails version
- Caching with redis won't work in docker container in WSL Win11
