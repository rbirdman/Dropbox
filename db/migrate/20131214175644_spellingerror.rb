class Spellingerror < ActiveRecord::Migration
  def change
  	rename_column :calendar_items_users, :calender_item_id, :calendar_item_id
  	
  end
end
