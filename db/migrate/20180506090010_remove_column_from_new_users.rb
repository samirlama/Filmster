class RemoveColumnFromNewUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :new_users , :login
  end
end
