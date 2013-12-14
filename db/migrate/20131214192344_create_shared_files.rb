class CreateSharedFiles < ActiveRecord::Migration
  def change
  	drop_table :file_items_users
    create_table :shared_files do |t|
	  t.integer "file_item_id"
      t.integer "user_id"
      t.string "permissions"
      t.timestamps
    end
    add_index :shared_files ,["user_id","file_item_id"]
  end
end
