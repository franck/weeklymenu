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
end
