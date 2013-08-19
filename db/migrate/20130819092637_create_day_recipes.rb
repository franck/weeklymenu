class CreateDayRecipes < ActiveRecord::Migration
  def change
    create_table :day_recipes do |t|
      t.integer :day_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
