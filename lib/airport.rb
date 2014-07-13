require_relative 'weather'

class Airport

	include Weather

	def planes
		@planes ||= []
	end

	def allow_landing?(plane)
		currently_good_weather = is_good_weather?

		if currently_good_weather
			puts "Landing successful! What a beautiful clear day!"
			planes << plane
		else
			puts "Landing not permitted, wait until the storm has passed."
		end
	end

	def allow_take_off?(plane)
		currently_good_weather = is_good_weather?

		if currently_good_weather
			puts "Take off successful! What a beautiful clear day!"
			planes.delete(plane)
		else
			puts "Take off not permitted, wait until the storm has passed."
		end
	end

end