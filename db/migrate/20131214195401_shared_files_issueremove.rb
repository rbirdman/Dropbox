class SharedFilesIssueremove < ActiveRecord::Migration
  def change
  	remove_column :file_items, :shared_file_id
    remove_column :users, :shared_file_id
  	
  end
end
