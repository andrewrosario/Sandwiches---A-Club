# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


andy = User.create(display_name: "Sandwich Junky", age: 39, username: "andyr", bio: "I am a person and from a place", img_url: 'https://www.newmarketgroup.com/images/default-source/logos/directlogo.png?sfvrsn=2', email: 'rosario.andrew@gmail.com')
ana = User.create(display_name: "Sandbitch", age: 24, username: "anaa", bio: "I like sandwiches and long walks on the beach", img_url: 'splat.png', email: 'ana@ana.com')
bill = User.create(display_name: "The Sandwich Snob", age: 21, username: 'billb', bio: "Don't you dare make me a bad sandwich", email: 'bill@bill.com')

ham = Ingredient.create(name: "Ham", type_of: 'filling', is_meat: true)
cheese = Ingredient.create(name: "Cheese", type_of: 'filling', is_dairy_or_egg: true)
bread = Ingredient.create(name: "Bread", type_of: 'bread')
mustard = Ingredient.create(name: "Mustard", type_of: 'condiment', is_gluten_free: true)


Sandwich.create(title: "Ham and Cheese", instructions: "Put the bread on either side of the ham and the cheese. Grill", description: "The moment I fell in love with my husband was when he made me this sandwich", user_id: 1)
Sandwich.create(title: "Cheese Sandwich", instructions: "Put the bread on either side of the cheese.", description: "Cheese is perfect", user_id: 2)
Sandwich.create(title: "Just Bread Sandwich", instructions: "Eat the bread.", description: "So dry.", user_id: 3)

SandwichIngredient.create(sandwich_id: 1, ingredient_id: 1, quantity: "some")
SandwichIngredient.create(sandwich_id: 1, ingredient_id: 2, quantity: "a lot")
SandwichIngredient.create(sandwich_id: 1, ingredient_id: 3, quantity: "some more")
SandwichIngredient.create(sandwich_id: 1, ingredient_id: 4, quantity: "some more still")

SandwichIngredient.create(sandwich_id: 2, ingredient_id: 2, quantity: "add some")
SandwichIngredient.create(sandwich_id: 2, ingredient_id: 3, quantity: "two pieces")

SandwichIngredient.create(sandwich_id: 3, ingredient_id: 3, quantity: "two or more pieces")

Comment.create(title: "I hate ham", rating: 1, content: "Ham is the grossest meat ever", user_id: 2, sandwich_id: 1)
Comment.create(title: "I love ham", rating: 4, content: "Ham is the best meat ever", user_id: 3, sandwich_id: 1)

Reply.create(content: "You are wrong", user_id: 1, comment_id: 1)
Reply.create(content: "No, I am not", user_id: 2, comment_id: 1)
