require_relative 'weather'

class Airport

	include Weather

	def planes
		@planes ||= []
	end

	def allow_landing?(plane)
		raise "Landing not permitted, wait until the storm has passed" if !has_good_weather?
		planes << plane
	end

	def allow_take_off?(plane)
		raise "Take off is not permitted, wait until the storm has passed" if !has_good_weather?
		@planes.delete(plane)
	end

end