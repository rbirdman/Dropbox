class M2MFileItems < ActiveRecord::Migration
  def change
  	create_table :file_items_users do |t|
  		t.integer "file_item_id"
        t.integer "user_id"
        t.string "permissions"
        t.timestamps
    end
    add_column :file_items, :file_items_user_id, :integer
  	add_column :users, :file_items_user_id, :integer
  	
    add_index :users ,["file_items_user_id"]
    add_index :file_items ,["file_items_user_id"]
    add_index :file_items_users ,["user_id","file_item_id"]
  end
end
