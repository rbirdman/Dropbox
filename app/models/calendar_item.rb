class CalendarItem < ActiveRecord::Base
belongs_to :User
has_and_belongs_to_many :Users, :class_name => "User"
end
