class CreateCalendarItems < ActiveRecord::Migration
  def change
    create_table :calendar_items do |t|
      t.string "name", :limit=>64
      t.date "date"
      t.timestamps
    end
  end
end
