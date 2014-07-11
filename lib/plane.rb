class Plane

	def initialize(options = {})
		@status = options.fetch(:status, status)
	end

	def status
		@status
	end

	def land_at(airport)
		@status = :grounded if airport.land_request
	end

	def take_off_from(airport)
		@status = :flying if airport.take_off
	end

end