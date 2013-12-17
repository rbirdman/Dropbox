require 'builder'

class CalenderItemsController < ApplicationController
	def calendar
		cidval=params[:id]
		cidval||=-1
		@citems=CalendarItem.where("user_id = ?", cidval)
	end
end
