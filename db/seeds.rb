# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Food.create(name: 'Lasagna', calories: 400)
Food.create(name: 'Ketchup', calories: 40)
Food.create(name: 'Snickers', calories: 420)
Food.create(name: 'Carrot', calories: 35)
Meal.create(name: 'Breakfast')
Meal.create(name: 'Lunch')
Meal.create(name: 'Dinner')
Meal.create(name: 'Snack')
