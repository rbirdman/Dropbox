class ReverseLastChange < ActiveRecord::Migration
  def change
  	
  	rename_column :shared_files, :User_id, :user_id
	rename_column :shared_files, :FileItem_id, :file_item_id
  end
end
