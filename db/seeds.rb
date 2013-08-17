# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Recipe.find_or_create_by_name("Saumon riz gluant")
Recipe.find_or_create_by_name("Steak tartare")
Recipe.find_or_create_by_name("Oeufs sur le plate")
