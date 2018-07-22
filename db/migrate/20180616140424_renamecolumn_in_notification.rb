class RenamecolumnAndAddindexInNotification < ActiveRecord::Migration[5.1]
  def change
  	rename_column :notifications , :to , :voted_id
  	rename_column :notifications , :from , :voter_id
  end
end
