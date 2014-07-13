module Weather

	def has_good_weather?
		determine
	end

	def gods_dice_roll
		rand(1..7)
	end

	def determine
		gods_dice_roll != 3
	end

end