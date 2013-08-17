class MenusController < ApplicationController
  def index
  end

  def new
    @menu = Menu.create
    @menu.generate
    redirect_to menu_path(@menu)
  end

  def show
    @menu = Menu.find(params[:id])
  end

end
