class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params_recipe)
    if @recipe.save
      redirect_to recipes_path
    else
      render :new
    end
  end

  protected

  def params_recipe
    params.require(:recipe).permit!
  end
end
