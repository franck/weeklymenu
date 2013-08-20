class RecipesController < ApplicationController

  respond_to :js, only: [:add_tag, :remove_tag]

  def index
    @recipes = Recipe.all
    @tags = Tag.all
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

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params_recipe)
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to recipes_path
  end

  def add_tag
    @recipe = Recipe.find(params[:id])
    @tag = Tag.find(params[:tag_id])
    @recipe.tags << @tag
    render nothing: true
  end

  def remove_tag
    recipe_tag = RecipeTag.where(tag_id: params[:tag_id]).where(recipe_id: params[:id]).first
    recipe_tag.destroy
    render nothing: true
  end

  protected

  def params_recipe
    params.require(:recipe).permit!
  end
end
