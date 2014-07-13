require 'weather'

class TheWeather; include Weather; end

describe Weather do

	let(:the_weather) { TheWeather.new }
	let(:bad_weather) { TheWeather.new(:good_weather => false) }

	context 'communicating state of being' do

		it 'will tell me if is good today' do
			expect(the_weather.has_good_weather?).to be true
		end

		it 'will tell me if is bad today' do
			expect(bad_weather.has_good_weather?).to be false
		end

	end

	context 'determining the weather' do

		it 'can generate a random number' do
			expect(the_weather).to receive(:rand)
			the_weather.gods_dice_roll
		end

		it 'this random number is a number between 0 and 8' do
			expect(the_weather.gods_dice_roll).to be_a Fixnum
			expect(the_weather.gods_dice_roll).to be > 0
			expect(the_weather.gods_dice_roll).to be < 8
		end

		it 'will be stormy if that number is 3' do
			allow(the_weather).to receive(:gods_dice_roll).and_return(3)
			the_weather.determine
			expect(the_weather.has_good_weather?).to eq(false)
		end

		it 'will be sunny if that number is not 3' do
			allow(bad_weather).to receive(:gods_dice_roll).and_return(6)
			bad_weather.determine
			expect(bad_weather.has_good_weather?).to eq(true)
		end

	end

end

# ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼