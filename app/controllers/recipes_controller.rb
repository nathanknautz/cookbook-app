class RecipesController < ApplicationController
  def index
    search_term = params[:search]
    recipes = Recipe.all
    sort_by = params[:sort]
    if search_term
      recipes = recipes.where("chef iLIKE ? OR ingredients iLIKE ?",
                                "%#{search_term}%",
                                "%#{search_term}%")
    end

    if sort_by
      recipes = recipes.order("#{sort_by}") 
    end
    
    render json: recipes.as_json  
  end

  def create
    recipe = Recipe.new(
                        title: params[:title],
                        chef: params[:chef],
                        ingredients: params[:ingredients],
                        directions: params[:directions])
    recipe.save 
    render json: recipe.as_json 
  end

  def show
    recipe = Recipe.find(params[:id])
    render json: recipe.as_json
  end

  def update
    recipe = Recipe.find(params[:id]) 
    recipe.title = params[:title] || recipe.title
    recipe.chef = params[:chef] || recipe.chef
    recipe.ingredients = params[:ingredients] || recipe.ingredients
    recipe.directions = params[:directions] || recipe.directions
    recipe.prep_time = params[:prep_time] || recipe.prep_time
    recipe.save
    render json: recipe.as_json
  end

  def destroy
    recipe = Recipe.find(params[:id]) 
    recipe.destroy
    render json: {message: "successfully destroyed recipe ##{params[:id]}"}
  end

end
