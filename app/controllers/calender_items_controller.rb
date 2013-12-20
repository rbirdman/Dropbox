require 'builder'

class CalenderItemsController < ApplicationController
	def calendar
		if current_user != nil
			id=current_user.id
			@citems=CalendarItem.where("user_id = ?", id)
		end
	end
	def saveEvent
	  if current_user != nil
	    id = current_user.id
	    Rails.logger.warn id
	    Rails.logger.warn "Hello"
	    event_id = params[:event_id]
	    event_text = params[:event_text]
	    event_start = params[:event_start]
	    event_end = params[:event_end]
	    @new_event=CalendarItem.create(:name => event_text,:user_id => id, :start_datetime => event_start, :end_datetime => event_end, :created_at => DateTime.now, :updated_at => DateTime.now)
	    @new_event.save
	    Rails.logger.warn "OKAY!"
	  end
	  
	  
	  redirect_to "/calendar"
	end
	
	def deleteEvent
	  if current_user != nil
	    id = current_user.id
	    event_id = params[:event_id]
		@value=CalendarItem.find(event_id)
		@value.destroy
	  end
	  
	  redirect_to "/calendar"
	end
end
