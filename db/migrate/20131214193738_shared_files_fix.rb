class SharedFilesFix < ActiveRecord::Migration
  def change
  	rename_column :file_items, :file_items_user_id, :shared_file_id
	rename_column :users, :file_items_user_id, :shared_file_id

  end
end
