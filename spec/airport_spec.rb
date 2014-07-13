require 'airport'

describe Airport do

	let(:gatwick) { Airport.new   	}
	let(:plane)   { double :plane 	}

	def set_good_weather
		allow(gatwick).to receive(:is_good_weather?).and_return(true)
	end

	def set_bad_weather
		allow(gatwick).to receive(:is_good_weather?).and_return(false)
	end

	context 'management' do

		it "doesn't have any grounded planes" do
			expect(gatwick.planes).to be_empty
		end

	end

	context 'plane trying to land' do

		it 'allows a plane to land if the weather is good' do
			set_good_weather

			expect(gatwick.planes).not_to include plane

			expect(gatwick).to receive(:puts).with("Landing successful! What a beautiful clear day!")

			gatwick.allow_landing?(plane)

			expect(gatwick.planes).to include plane
		end

		it 'does not allow a plane to land if the weather is bad' do
			set_bad_weather

			expect(gatwick).to receive(:puts).with("Landing not permitted, wait until the storm has passed.")

			gatwick.allow_landing?(plane)

			expect(gatwick.planes).not_to include plane
		end

	end

	context 'plane trying to take off' do

		before do
			set_good_weather
			gatwick.allow_landing?(plane)
		end

		it 'allows a plane to take off' do
			expect(gatwick).to receive(:puts).with("Take off successful! What a beautiful clear day!")

			gatwick.allow_take_off?(plane)

			expect(gatwick.planes).not_to include plane
		end

		it 'does not allow a plane to take off if the weather is bad' do
			set_bad_weather

			expect(gatwick).to receive(:puts).with("Take off not permitted, wait until the storm has passed.")

			gatwick.allow_take_off?(plane)

			expect(gatwick.planes).to include plane
		end

	end

end

# » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ »