require 'builder'

class CalenderItemsController < ApplicationController
	def calendar
		cidval=params[:id]
		cidval||=-1
		@citems=CalendarItem.where("user_id = ?", cidval)
	end
	def saveEvent
	  id = current_user.id
	  event_id = params[:event_id]
	  event_text = params[:event_text]
	  event_start = params[:event_start]
	  event_end = params[:event_end]
	  
	  
	  
	  redirect_to "/calendar"
	end
end
