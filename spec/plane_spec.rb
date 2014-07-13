require 'plane'

describe Plane do

	let(:flying_plane) { Plane.new }
	let(:grounded_plane) { Plane.new(:status => :grounded) }
	let(:gatwick) { double :airport }

	context 'is either flying or grounded' do

		it 'is first set as flying' do
			expect(flying_plane.status).to eql :flying
		end

		it 'can be specified as grounded' do
			expect(grounded_plane.status).to eql :grounded
		end

	end

	context 'landing in an airport' do

		it 'can land in airport' do
			allow(gatwick).to receive(:allow_landing?).with(flying_plane).and_return(true)
			flying_plane.land_at(gatwick)
			expect(flying_plane.status).to eql :grounded
		end

		it 'stays flying if the weather is bad' do
			allow(gatwick).to receive(:allow_landing?).with(flying_plane).and_return(false)
			flying_plane.land_at(gatwick)
			expect(flying_plane.status).to eql :flying
		end

	end

	context 'taking off from airport' do

		it 'can take off from airport' do
			allow(gatwick).to receive(:allow_take_off?).with(grounded_plane).and_return(true)
			grounded_plane.take_off_from(gatwick)
			expect(flying_plane.status).to eql :flying
		end

		it 'stays grounded if weather is bad' do
			allow(gatwick).to receive(:allow_take_off?).with(grounded_plane).and_return(false)
			grounded_plane.take_off_from(gatwick)
			expect(grounded_plane.status).to eql :grounded
		end

	end

end

# ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈ ✈