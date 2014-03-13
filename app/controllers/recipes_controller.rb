class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.includes(:recipe_items)
    
    if params[:skill].present?
      @recipes = @recipes.where("skill like ?","%"+params[:skill]+"%").order("level")
    end
    
    @recipes_grid = initialize_grid(@recipes,:per_page => 40)
  end
  

  
  def new
    
  end
  
end