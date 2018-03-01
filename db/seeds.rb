
User.create!([
  {name: "bob", email: "bobert@dilbert.org", password: "password", password_confirmation: "password"},
  {name: "nathan", email: "natthan@aol.com", password: "password", password_confirmation: "password"},
  {name: "nathan", email: "nathan@aol.com", password: "password", password_confirmation: "password"},
  {name: "nathan", email: "nathan2@aol.com", password: "password", password_confirmation: "password"}
])

Category.create!([
  {name: "Cheap"},
  {name: "Junk Food"},
  {name: "Edible"}
])

Recipe.create!([
  {title: "Hand Sandwich", chef: "Bad Josh", ingredients: "left hand, right hand", directions: "put your hands together, Wisconsin!", image_url: "http://occ144datkn3vrjlq7r63p19.wpengine.netdna-cdn.com/wp-content/uploads/2012/06/Hand-Sandwiches.jpeg", prep_time: 1, user_id: 1},
  {title: "Fava Bean side dish", chef: "Hannibal", ingredients: "ice, tap water, 2 lbs fresh fava beans in the pod, 1 tablespoon butter, 1 teaspoon olive oil, 2 garlic cloves", directions: "boil 4 cups of water, add salt, place fava beans in the boiling water for 5 min, remove fava beans and place in ice water, add seasoning to taste", image_url: "http://bijouxs.com/wp-content/uploads/2011/05/Favabordercropsmall.jpg", prep_time: 125, user_id: 3},
  {title: "Cookies", chef: "Cookie Monster", ingredients: "cookie mix, milk, eggs", directions: "pour mix into bowl, add milk and eggs, stir well, bake", image_url: "http://1.bp.blogspot.com/-w-i7-dRn_V0/TeZP9aAxPBI/AAAAAAAAAR4/8E_-JCJlEmQ/s1600/Apri2011+055pwm.jpg", prep_time: 480, user_id: 2},
  {title: "Egg", chef: "Josh", ingredients: "chicken", directions: "squeeze chicken", image_url: "https://boost-rankedboost.netdna-ssl.com/wp-content/uploads/2016/07/Pokemon-Go-Egg.png", prep_time: 4, user_id: 1},
  {title: "Lasagna", chef: "Garfield", ingredients: "noodles, tomato paste, meat, onions, garlic, other stuff", directions: "layer noodles, add sauce, layer noodles, add meat, layer noodles, add onions, layer noodles, add other stuff, finish with a layer of noodles", image_url: "https://m.popkey.co/1e0d43/Vo6a3.gif", prep_time: 60, user_id: 3},
  {title: "Duck Soup", chef: nil, ingredients: "Groucho, Zeppa, and idk something else", directions: "Make a movie, don't make money", image_url: "https://static.rogerebert.com/uploads/movie/movie_poster/duck-soup-1933/large_bFxealD6vcYr4sPOrJF0pvZ95ff.jpg", prep_time: 80, user_id: 3},
  {title: "Burger", chef: "Mac Tonight", ingredients: "car, money", directions: "drive to Mcdondal's, order burger from fiberglass clown, pull up to the window, exchange burger for money", image_url: "http://mcdonalds.hr/content/uploads/2014/03/big-mac1.png", prep_time: 5, user_id: 2},
  {title: "Egg", chef: "Josh", ingredients: "One live chicken", directions: "grasp chicken firmly, squeeze... gently", image_url: "http://www.seriouseats.com/recipes/images/2017/08/5708631471_06fed03518_o-1500x1125.jpg", prep_time: 115, user_id: 1},
  {title: "frogs legs", chef: nil, ingredients: "left leg, right leg", directions: "some sort of song", image_url: "https://pbs.twimg.com/profile_images/839900475205955585/FMzXSOkV_400x400.jpg", prep_time: 175, user_id: 3}
])

CategoryRecipe.create!([
  {category_id: 2, recipe_id: 4},
  {category_id: 2, recipe_id: 1},
  {category_id: 3, recipe_id: 4},
  {category_id: 1, recipe_id: 12},
  {category_id: 2, recipe_id: 8},
  {category_id: 2, recipe_id: 9},
  {category_id: 2, recipe_id: 10},
  {category_id: 2, recipe_id: 11},
  {category_id: 3, recipe_id: 13},
  {category_id: 3, recipe_id: 14}
])

