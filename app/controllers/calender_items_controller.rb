require 'builder'

class CalenderItemsController < ApplicationController
	def produce_xml (citems)
	  file = File.new("xml/cal_export.xml", "wb")
	  xml = Builder::XmlMarkup.new :target => file
	  xml.instruct! :xml, :encoding => "ASCII"
	  puts xml.data {
		  citems.each do |c|
			puts xml.event("id"=>c.id, "start_date"=>c.start_datetime, "end_date"=>c.end_datetime, "text"=>c.name, "details"=>"")
		  end
	  }
	  file.close
	end
	
	def calander
		citems=CalendarItem.where(user_id: params[:id])
		produce_xml(citems)
	end
end
