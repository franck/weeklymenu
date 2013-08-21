class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.new(nb_days: 5, nb_meals_per_day: 2)
  end

  def create
    @menu = Menu.new(params_menu)
    if @menu.save
      @menu.generate
      redirect_to menu_path(@menu)
    else
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
    @days = @menu.days.order('position')
    @tags = Tag.all
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path
  end

  def reset
    menu = Menu.find(params[:id])
    menu.reset!
    redirect_to menu_path(menu)
  end

  protected

  def params_menu
    params.require(:menu).permit!
  end

end
