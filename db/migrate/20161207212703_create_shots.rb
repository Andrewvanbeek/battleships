class CreateShots < ActiveRecord::Migration
  def change
    create_table :shots do |t|
      t.integer :user_id
      t.integer :game_id
      t.integer :x_coord
      t.integer :y_coord
      t.integer :ship_id
      t.timestamps null: false
    end
  end
end
