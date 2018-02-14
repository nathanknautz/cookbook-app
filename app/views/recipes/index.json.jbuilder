json.array! @recipes.each do |recipe|
  json.title recipe.title
  #json.chef recipe.user.name
  json.ingredients recipe.ingredients_list
  json.direction recipe.directions_list
  json.image_url recipe.image_url
  json.created_at recipe.friendly_created_at
  json.prep_time recipe.friendly_prep_time
end