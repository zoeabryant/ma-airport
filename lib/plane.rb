class Plane

	def initialize(options = {})
		@status = options.fetch(:status, status)
	end

	def status
		@status ||= :flying
	end

	def land_at(airport)
		@status = :grounded if @status != :grounded && airport.allow_landing?(self)
	end

	def take_off_from(airport)
		@status = :flying if @status != :flying && airport.allow_take_off?(self)
	end

end