class CalendarItem < ActiveRecord::Base
belongs_to :Users
has_and_belongs_to_many :Users
end
