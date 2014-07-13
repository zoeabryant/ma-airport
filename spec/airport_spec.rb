require 'airport'

describe Airport do

	let(:gatwick) { Airport.new }
	let(:plane) { double :plane }

	# it 'can get the weather report' do
	# 	# allow(good_weather).to receive(:has_good_weather?).and_return(true)
	# 	expect(gatwick.weather_report).to eq true
	# end


	# it 'allows a plane to take off' do
	# end

	it "doesn't have any grounded planes" do
		expect(gatwick.planes).to be_empty
	end

	it 'allows a plane to land if the weather is good' do
		allow(gatwick).to receive(:has_good_weather?).and_return(true)

		expect(gatwick.planes).not_to include plane

		gatwick.allow_landing(plane)

		expect(gatwick.planes).to include plane
	end

	it 'does not allow a plane to land if the weather is bad' do
		allow(gatwick).to receive(:has_good_weather?).and_return(false)

		expect{ gatwick.allow_landing(plane) }.to raise_error(RuntimeError)

		expect(gatwick.planes).not_to include plane
	end

end

# » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ »