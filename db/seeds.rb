# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'open-uri'

puts 'clearing database...'
Ingredient.destroy_all

puts 'requesting new ingredients...'
response = URI.open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').string
json = JSON.parse(response)

puts 'inserting ingredients...'
# puts json["drinks"]

json['drinks'].each do |ingredient|
  new_ingredient = Ingredient.create({ name: ingredient['strIngredient1'] })
  puts "added ingredient: #{new_ingredient.name}"
end
puts 'completed ingredient population'

# todo add cocktail seeding
# puts 'Prepopulating database with cocktails...'
# Cocktail.destroy_all

# cocktail = Cocktail.create({name: 'Bloody Mary', photo: ''})
