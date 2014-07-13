module Weather

	def initialize(options = {})
		@weather = options.fetch(:good_weather, true)
	end

	def has_good_weather?
		@weather
	end

	def gods_dice_roll
		rand(1..7)
	end

	def determine
		@weather = gods_dice_roll != 3
	end

end