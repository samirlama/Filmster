class CreateNotifications < ActiveRecord::Migration[5.1]
  def change
    create_table :notifications do |t|
    	t.integer :to
    	t.integer :from
    	t.integer :status , default: 0
    	t.integer :event , default: 0
      t.timestamps
    end
  end
end
