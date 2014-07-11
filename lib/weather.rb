class Weather

	def initialize(options = {})
		@weather = options.fetch(:good_weather, true)
	end

	def has_good_weather?
		@weather
	end

	def gods_roll_the_dice
		rand(1..7)
	end

	def determine
		@weather = gods_roll_the_dice != 3
	end

end