require_relative 'weather'

class Airport

	include Weather

	def planes
		@planes ||= []
	end

	def allow_landing(plane)
		raise "Landing not permitted, wait until the storm has passed" if !has_good_weather?
		planes << plane
	end

end