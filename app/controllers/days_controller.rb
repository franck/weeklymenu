class DaysController < ApplicationController
  def create 
    @menu = Menu.find(params[:menu_id])
    @menu.add_day!
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    day = @menu.days.find(params[:id])
    @menu.remove_day!(day)
    redirect_to menu_path(@menu)
  end
end
