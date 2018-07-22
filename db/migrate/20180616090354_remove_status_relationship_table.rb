class AddNewColumnStatusRelationshipTable < ActiveRecord::Migration[5.1]
  def change
  	remove_column :relationships , :status 
  end
end
