Rails.logger.warn "Starting Calendar.xml"
xml.instruct!
xml.data do |data|
	@citems.each do |c|
		data.event("id"=>c.id, "start_date"=>c.start_datetime, "end_date"=>c.end_datetime, "text"=>c.name, "details"=>"")
	end
end
Rails.logger.warn "Was in Calendar.xml"