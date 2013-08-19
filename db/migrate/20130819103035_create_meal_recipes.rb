class CreateMealRecipes < ActiveRecord::Migration
  def change
    create_table :meal_recipes do |t|
      t.integer :meal_id
      t.integer :recipe_id

      t.timestamps
    end
  end
end
