class CreateFileItems < ActiveRecord::Migration
  def change
    create_table :file_items do |t|
      t.string "name", :limit=>64
      t.binary "file"
      t.string "permissions"
      t.string "file_extension", :limit=>10
      t.timestamps
    end
  end
end
