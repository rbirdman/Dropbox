class CalenderItemsController < ApplicationController
	def show
		@user = CalendarItem.find(params[:id])
	end
	
	def calanderitemsxml
		headers['Content-Type'] = "text/xml"
		headers['Content-Disposition'] = 'attachment; filename="xml/cal-export.xml"'
		headers['Cache-Control'] = ''
		@citems=CalendarItem.where(user_id: params[:user_id])
	end
end
