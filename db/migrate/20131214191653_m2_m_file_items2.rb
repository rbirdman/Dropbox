class M2MFileItems2 < ActiveRecord::Migration
  def change
  	add_column :file_items, :file_items_user_id, :integer
  	add_column :users, :file_items_user_id, :integer
  	
    add_index :users ,["file_items_user_id"]
    add_index :file_items ,["file_items_user_id"]
   
  end
end
