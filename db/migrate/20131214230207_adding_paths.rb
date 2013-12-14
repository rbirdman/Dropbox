class AddingPaths < ActiveRecord::Migration
  def change
  	add_column :users, :root_directory,:string
  	add_column :file_items, :path,:string
  end
end
