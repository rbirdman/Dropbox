class M2Mfileitemsissue < ActiveRecord::Migration
  def change
  	rename_column :shared_files, :user_id, :User_id
	rename_column :shared_files, :file_item_id, :FileItem_id
  end
end
