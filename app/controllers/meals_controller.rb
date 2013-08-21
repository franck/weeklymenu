class MealsController < ApplicationController
  def create
    @menu = Menu.find(params[:menu_id])
    @day = @menu.days.find(params[:day_id])
    @day.meals << Meal.create_with_recipe
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @day = @menu.days.find(params[:day_id])
    meal = @day.meals.find(params[:id])
    meal.destroy
    redirect_to menu_path(@menu)
  end

  def add_tag
    @meal = Meal.find(params[:id])
    @tag = Tag.find(params[:tag_id])
    @meal.tags << @tag
    render nothing: true
  end

  def remove_tag
    meal_tag = MealTag.where(tag_id: params[:tag_id]).where(meal_id: params[:id]).first
    meal_tag.destroy
    render nothing: true
  end
end
