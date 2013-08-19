class DaysController < ApplicationController
  def new
    @menu = Menu.find(params[:menu_id])
    day = Day.create(menu: @menu)
    day.move_to_bottom
    redirect_to menu_path(@menu)
  end
end
