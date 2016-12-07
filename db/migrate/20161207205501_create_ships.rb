class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
    	t.string :classification, null: false
    	t.integer :size, null: false
    	t.integer :x_coord
    	t.integer :y_coord
    	t.integer :hit_count
    	t.integer :orientation
    	t.integer :game_id
    	t.integer :user_id

      t.timestamps null: false
    end
  end
end
