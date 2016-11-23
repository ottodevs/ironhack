# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Sandwich.create(name: "Marcell's Pastrami", bread_type: "Awesome one")

Ingredient.create(name: "Ham", calories: "200")
Ingredient.create(name: "Lettucce", calories: "150")
Ingredient.create(name: "Onion", calories: "20")

Sandwich.first.ingredients.push(Ingredient.first)
