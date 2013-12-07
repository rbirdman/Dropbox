class CreateToDoItems < ActiveRecord::Migration
  def change
    create_table :to_do_items do |t|
      t.string "title", :limit=>64
      t.string "details", :limit=>64
      t.datetime "date"
      t.string "resources"
      t.boolean "completed", :default=>false
      t.timestamps
    end
  end
end
