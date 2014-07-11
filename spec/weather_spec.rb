require 'weather'

describe Weather do

	let(:the_weather) { Weather.new }
	let(:bad_weather) { Weather.new(:good_weather => false) }

	it 'will tell me if is good today' do
		expect(the_weather.has_good_weather?).to be true
	end

	it 'will tell me if is bad today' do
		expect(bad_weather.has_good_weather?).to be false
	end

	it 'can generate a random number' do
		expect(the_weather).to receive(:rand)
		the_weather.gods_roll_the_dice
	end

	it 'this random number is a number between 0 and 8' do
		expect(the_weather.gods_roll_the_dice).to be_a Fixnum
		expect(the_weather.gods_roll_the_dice).to be > 0
		expect(the_weather.gods_roll_the_dice).to be < 8
	end

	it 'will be stormy if that number is 3' do
		allow(the_weather).to receive(:gods_roll_the_dice).and_return(3)
		the_weather.determine
		expect(the_weather.has_good_weather?).to eq(false)
	end

	it 'will be sunny if that number is not 3' do
		allow(bad_weather).to receive(:gods_roll_the_dice).and_return(6)
		bad_weather.determine
		expect(bad_weather.has_good_weather?).to eq(true)
	end

end

# ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼ ☂ ☼