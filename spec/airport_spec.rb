require 'airport'

describe Airport do

	let(:gatwick) { Airport.new }
	let(:weather) { double :weather }
	let(:plane) { double :plane }

	# it 'can get the weather report' do
	# 	allow(weather).to receive(:has_good_weather?).and_return(true)
	# 	expect(gatwick.weather_report).to eq true
	# end

	# it 'allows a plane to land' do
	# end

	# it 'allows a plane to take off' do
	# end

end

# » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ » ✈ »