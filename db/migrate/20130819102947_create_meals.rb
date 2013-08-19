class CreateMeals < ActiveRecord::Migration
  def change
    create_table :meals do |t|
      t.integer :position
      t.integer :day_id

      t.timestamps
    end
  end
end
