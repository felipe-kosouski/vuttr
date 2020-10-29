# README

## Vuttr - Very Useful Tools to Remember

This project is based on the challenge proposed by the [Bossabox](https://bossabox.com/) company.
The goal was to write an API that can serve as a repository to manage registered tools,
whit their names, links, descriptions, and tags.

There was no limitation on technology stack that was needed, it could be any language,
any database, any framework, libraries, and tools.

I already built a .NET Core Version of this API, you can find it here [Vuttr.NetCore](https://github.com/felipe-kosouski/Vuttr.API)
This Ruby/Rails version is being built for study/work purposes

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
