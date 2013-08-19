class AddNbDaysToMenus < ActiveRecord::Migration
  def change
    add_column :menus, :nb_days, :integer
    add_column :menus, :nb_meals_per_day, :integer
  end
end
