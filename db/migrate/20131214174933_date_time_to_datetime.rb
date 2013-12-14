class DateTimeToDatetime < ActiveRecord::Migration
  def change
  	rename_column :calendar_items, :start_date, :start_datetime
  	rename_column :calendar_items, :end_time, :end_datetime
  	
  end
end
