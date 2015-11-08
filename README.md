# Cars API

An endpoint to provide the 10 nearest GPS positions ordered by distance given a set of data.
This example code uses the Kdtree algorithm and stores the tree in a static file in the db directory.

## Requirements

Ruby on Rails

## Test

````
run "rspec" in the main directory of the app

````

## Start the Rails app

````
rake db:create db:migrate db:seed
rails s

````

## How to use the static Kdtree

- make sure to delete the files named kdtree_* in db/ after you have modified the database, this will generate a new static kdtree file
- Visit localhost:3000/cars?location=0,0
