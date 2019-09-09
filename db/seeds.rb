# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


andy = User.create(display_name: "Sandwich Junky", age: 39, username: "andyr", bio: "I am a person and from a place", img_url: 'https://www.newmarketgroup.com/images/default-source/logos/directlogo.png?sfvrsn=2', email: 'rosario.andrew@gmail.com')
ana = User.create(display_name: "Sandbitch", age: 24, username: "anaa", bio: "I like sandwiches and long walks on the beach", img_url: 'http://i.imgur.com/dIgHc.jpg', email: 'rosario.andrew@gmail.com')

ham = Ingredient.create(name: "Ham", type_of: 'filling', is_meat: true)
cheese = Ingredient.create(name: "Cheese", type_of: 'filling', is_dairy_or_egg: true)
bread = Ingredient.create(name: "Bread", type_of: 'bread')
mustard = Ingredient.create(name: "Mustard", type_of: 'condiment', is_gluten_free: true)


