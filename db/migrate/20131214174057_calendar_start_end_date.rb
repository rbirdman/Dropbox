class CalendarStartEndDate < ActiveRecord::Migration
  def change
  	add_column :calendar_items, :end_time, :datetime
  	rename_column :calendar_items, :date, :start_date
  	change_column :calendar_items, :start_date, :datetime

  end
end
