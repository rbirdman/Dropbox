class RenamingM2MTable < ActiveRecord::Migration
  def change
  	rename_table :calendar_items_viewers, :calendar_items_users
  end
end
