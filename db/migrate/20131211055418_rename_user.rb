class RenameUser < ActiveRecord::Migration
  def change
  	rename_table :Users, :user
  end
end
