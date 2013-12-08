class AddingForeignKeysForOwnership < ActiveRecord::Migration
  def change
  	add_column :calendar_items, :user_id, :integer
  	
  	add_index("calendar_items","user_id")
  	add_column :to_do_items, :user_id, :integer
  	
  	add_index("to_do_items","user_id")
  	add_column :file_items, :user_id, :integer
  	
  	add_index("file_items","user_id")
  	create_table :calendar_items_viewers do |t|
      t.integer "calender_item_id"
      t.integer "user_id"
   end
    add_index("calendar_items_viewers","user_id")
    add_index("calendar_items_viewers","calender_item_id")
    
  end

end
