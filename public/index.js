
var recipeTemplate = document.querySelector("#recipe-card");
var recipeContainer = document.querySelector(".row");

axios.get("http://localhost:3000/recipes").then(function(response) {
  var recipes = response.data;
  recipes.forEach(function(recipe) {
    var recipeClone = recipeTemplate.content.cloneNode(true);
    recipeClone.querySelector(".card-title").innerText = recipe.title;
    recipeClone.querySelector(".prep-time").innerText = recipe.prep_time;
    recipeClone.querySelector(".ingredients").innerText = recipe.ingredients;
    recipeClone.querySelector(".directions").innerText = recipe.direction;
    recipeClone.querySelector(".card-img-top").src = recipe.image_url;
    recipeContainer.appendChild(recipeClone);    
  });
});




