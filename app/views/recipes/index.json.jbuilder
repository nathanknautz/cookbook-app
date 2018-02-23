json.array! @recipes.each do |recipe|
  json.id recipe.id
  json.title recipe.title
  #json.chef recipe.user.name
  json.ingredients recipe.ingredients
  json.directions recipe.directions
  json.created_at recipe.friendly_created_at
  json.prep_time recipe.prep_time
  json.image_url recipe.image_url
  json.formatted do 
    json.prep_time recipe.friendly_prep_time
    json.directions recipe.directions_list
    json.ingredients recipe.ingredients_list
  end
end