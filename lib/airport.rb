require_relative 'weather'

class Airport

	include Weather

	def weather_report
		has_good_weather?
	end

end