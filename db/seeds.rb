# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Cleaning database...'
Cocktail.destroy_all
Dose.destroy_all

puts 'Creating restaurants...'

# target_file = open('http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
# result = JSON.parse(target_file)
#
# result["drinks"].each do |d|
#   n = d["strIngredient1"]
#   Ingredient.create(name: n)
# end

20.times do
target_cocktail = open(
'http://www.thecocktaildb.com/api/json/v1/1/random.php').read
result = JSON.parse(target_cocktail)
  n = result["drinks"][0]["strDrink"]
  l = result["drinks"][0]["strInstructions"]
  Cocktail.create(name: n)

  x = rand(20..40)
  y = rand(20..40)
  Dose.create(description: l, cocktail_id: x, ingredient_id: y)
end
