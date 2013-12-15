require 'builder'

class CalenderItemsController < ApplicationController
	def calendar
		@citems=CalendarItem.where("user_id = ?", params[:id])
	end
end
