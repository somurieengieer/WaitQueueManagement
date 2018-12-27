# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## Usage
Follow these steps to set up this project on your local.
- Pull repository
- $ docker-compose build
- $ docker-compose run --rm app rails db:create
- $ docker-compose run --rm app rails db:migrate
- $ docker-compose up -d
