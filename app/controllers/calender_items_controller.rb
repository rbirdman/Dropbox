require 'builder'

class CalenderItemsController < ApplicationController
	def produce_xml (citems)
	  File.delete("/assets/calendar-events.xml") if File.exist?("/assets/calendar-events.xml")
	  file = File.new("/assets/calendar-events.xml", "w")
	  xml = Builder::XmlMarkup.new(:target=>file, :indent => 2)

		xml.instruct! :xml, :encoding => "UTF-8",  :version => "1.0"

		xml.data do |data|
			data.event("id"=>c.id, "start_date"=>c.start_datetime, "end_date"=>c.end_datetime, "text"=>c.name, "details"=>"")
		end
	  file.close
	end
	
	def calendar
		Rails.logger.warn "This is a test"
		Rails.logger.warn params[:id]
		@citems=CalendarItem.where(user_id: params[:id])
		Rails.logger.warn "This is a test2"
	end
end
