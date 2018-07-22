class AddindexInNotification < ActiveRecord::Migration[5.1]
  def change
  	add_index :notifications , :voted_id
  	add_index :notifications , :voter_id
  end
end
