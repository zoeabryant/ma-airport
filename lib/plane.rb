class Plane

	def initialize(options = {})
		@status = options.fetch(:status, status)
	end

	def status
		@status
	end

	def land_at(airport)
		@status = :grounded if airport.has_good_weather?
	end

	def take_off_from(airport)
		@status = :flying if airport.has_good_weather?
	end

end