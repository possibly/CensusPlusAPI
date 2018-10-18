# 1.12.1 CensusPlus JSON Api

Takes 1.12.1 CensusPlus.lua files and saves them to a SQLite database with a JSON API.

## Requirements

Core to the project is having an environment properly set up to convert LUA tables to Ruby objects. Follow instructions here: https://github.com/possibly/censusplus-db-reader

## Getting started

Currently, the only way to test the API is to run a local version yourself.

* Install Ruby (I used 2.5.1 for this project)
* `bundler install` in the censusplus_api main directory.
* `rails s` to start the rails server

I use Postman's native OSX client to make properly formatted requests easily.