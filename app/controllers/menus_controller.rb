class MenusController < ApplicationController
  def index
    @menus = Menu.all
  end

  def new
    @menu = Menu.create
    @menu.generate
    redirect_to menu_path(@menu)
  end

  def show
    @menu = Menu.find(params[:id])
    @recipes = @menu.recipes
  end

  def destroy
    menu = Menu.find(params[:id])
    menu.destroy
    redirect_to menus_path
  end

end
