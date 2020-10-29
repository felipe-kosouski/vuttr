# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  2.6.5

* Rails version
  6.0.3

* System dependencies
  docker
  docker-compose

* Configuration
  docker-compose build

* Database creation
  docker-compose run --rm web rails db:create

* Database initialization
  docker-compose run --rm web rails db:migrate

* How to run the test suite
  docker-compose run --rm web rspec
