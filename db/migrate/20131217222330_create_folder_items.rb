class CreateFolderItems < ActiveRecord::Migration
  def change
    create_table :folder_items do |t|
      t.string "permissions"
      t.string "path"
      t.string "name"
      t.integer "user_id"
      t.timestamps
    end
    add_index :folder_items ,["user_id"]
  end
end
