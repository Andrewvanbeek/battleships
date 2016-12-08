class CreateShips < ActiveRecord::Migration
  def change
    create_table :ships do |t|
    	t.string :classification, null: false
    	t.integer :size, null: false
    	t.integer :x_coord, null: false
    	t.integer :y_coord, null: false
    	t.integer :hit_count, default: 0
    	t.integer :game_id
    	t.integer :user_id
    	t.integer :orientation

      t.timestamps null: false
    end
  end
end

