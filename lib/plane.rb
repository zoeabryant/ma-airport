class Plane

	def initialize(options = {})
		@status = options.fetch(:status, status)
	end

	def status
		@status
	end

	def land_at(airport)
		@status = :grounded
	end

	def take_off_from(airport)
		@status = :flying
	end

end