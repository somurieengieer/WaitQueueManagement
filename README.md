# About system
This system control "waiting queue" and "people waiting queue".
Administrator(e.g. restraunt, hospital reception, any kind of shop...) can create "waiting queue" instead of conventional paper's waiting list.
Customer can go anywhere after entry "waiting queue" when that place crowded.

# System Configuration
This system is created by bellow versions.

 - Docker v18.09.0
 - Ruby 2.5.3p105
 - Rails 5.2.2
 - MySQL 15.1 Distrib 10.1.37-MariaDB
 - bootstrap 4.1.3

## Usage
Follow these steps to set up this project on your local.
- Pull repository
- $ docker-compose build
- $ docker-compose run --rm app rails db:create
- $ docker-compose run --rm app rails db:migrate
- $ docker-compose up -d
