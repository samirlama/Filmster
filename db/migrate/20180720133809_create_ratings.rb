class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
    	t.integer :movie_id
    	t.integer :user_id
    	t.integer  :rate_number
      t.timestamps
    end
    add_index :ratings , :movie_id
    add_index :ratings , :user_id
  end
end
