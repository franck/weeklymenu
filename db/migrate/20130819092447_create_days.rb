class CreateDays < ActiveRecord::Migration
  def change
    create_table :days do |t|
      t.integer :menu_id
      t.integer :position

      t.timestamps
    end
  end
end
