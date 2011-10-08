module ApplicationHelper

	def datetime_to_m_d_y(datetime)
		return "#{Time.now.month}/#{Time.now.day}/#{Time.now.year}" unless datetime
		"#{datetime.month}/#{datetime.day}/#{datetime.year}"
	end
	
	def datetime_to_h_m(datetime)
		return "12:00" unless datetime
		t = Time.parse(datetime.to_s)
		t.strftime("%I:%M")
	end
end
