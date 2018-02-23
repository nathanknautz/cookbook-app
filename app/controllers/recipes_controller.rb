class RecipesController < ApplicationController
  before_action :authenticate_user, only: [:create]
  def index
    search_term = params[:search]
    @recipes = Recipe.all
    sort_by = params[:sort]
    if search_term
      @recipes = @recipes.where("chef iLIKE ? OR ingredients iLIKE ?",
                                "%#{search_term}%",
                                "%#{search_term}%")
    end

    if sort_by
      @recipes = @recipes.order("#{sort_by}") 
    end
    
    render 'index.json.jbuilder'
  end

  def create
    @recipe = Recipe.new(
                        title: params[:title],
                        user_id: current_user.id,
                        ingredients: params[:ingredients],
                        directions: params[:directions],
                        prep_time: params[:prep_time],
                        image_url: params[:image_url])
    @recipe.save 
    render 'show.json.jbuilder'
  end

  def show
    @recipe = Recipe.find(params[:id])
    render 'show.json.jbuilder'
  end

  def update
    @recipe = Recipe.find(params[:id]) 
    @recipe.title = params[:title] || @recipe.title
    #@recipe.chef = params[:chef] || @recipe.chef
    @recipe.ingredients = params[:ingredients] || @recipe.ingredients
    @recipe.directions = params[:directions] || @recipe.directions
    @recipe.prep_time = params[:prep_time] || @recipe.prep_time
    @recipe.image_url = params[:image_url] || @recipe.image_url
    if @recipe.save
      render 'show.json.jbuilder'
    else
      puts @recipe.errors.full_messages
    end
  end

  def destroy
    recipe = Recipe.find(params[:id]) 
    recipe.destroy
    render json: {message: "successfully destroyed recipe ##{params[:id]}"}
  end

end
