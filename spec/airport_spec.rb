require 'airport'

describe Airport do

	let(:gatwick) { Airport.new }
	let(:plane) { double :plane }

	context 'management' do

		it "doesn't have any grounded planes" do
			expect(gatwick.planes).to be_empty
		end

	end

	context 'plane trying to land' do

		it 'allows a plane to land if the weather is good' do
			allow(gatwick).to receive(:has_good_weather?).and_return(true)

			expect(gatwick.planes).not_to include plane

			gatwick.allow_landing?(plane)

			expect(gatwick.planes).to include plane
		end

		it 'does not allow a plane to land if the weather is bad' do
			allow(gatwick).to receive(:has_good_weather?).and_return(false)

			expect{ gatwick.allow_landing?(plane) }.to raise_error(RuntimeError)

			expect(gatwick.planes).not_to include plane
		end

	end

	context 'plane trying to take off' do

		before do
			allow(gatwick).to receive(:has_good_weather?).and_return(true)
			gatwick.allow_landing?(plane)
		end

		it 'allows a plane to take off' do
			gatwick.allow_take_off?(plane)
			expect(gatwick.planes).not_to include plane
		end

		it 'does not allow a plane to take off if the weather is bad' do
			allow(gatwick).to receive(:has_good_weather?).and_return(false)
			expect{ gatwick.allow_take_off?(plane) }.to raise_error(RuntimeError)
		end

	end

end

# » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ »