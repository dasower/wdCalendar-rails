module ApplicationHelper

	def datetime_to_m_d_y(datetime)
		"#{datetime.month}/#{datetime.day}/#{datetime.year}"
	end
	
	def datetime_to_h_m(datetime)
		t = Time.parse(datetime.to_s)
		t.strftime("%I:%M")
		#"#{datetime.hour}:#{datetime.min}"
	end
end
