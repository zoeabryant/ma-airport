require 'plane'

describe Plane do

	let(:flying_plane) { Plane.new(:status => :flying) }
	let(:grounded_plane) { Plane.new(:status => :grounded) }
	let(:airport) { double :airport }

	it 'first has a status of flying' do
		expect(flying_plane.status).to eql :flying
	end

	it 'can land in airport' do
		flying_plane.land_at(airport)
		# expect(airport).stub(:land_request)
		expect(flying_plane.status).to eql :grounded
	end

	it 'can take off from airport' do
		grounded_plane.take_off_from(airport)
		expect(flying_plane.status).to eql :flying
	end

	# it 'stays grounded if weather is bad' do	end
	# it 'knows that it is flying after it takes off' do	end
	# it 'can fly' do	end
	# it 'stays flying if the weather is bad' do	end
	# it 'knows that it is not flying after it lands' do	end

end

 #              -=\`\
 #          |\ ____\_\__
 #        -=\c`""""""" "`)
 #           `~~~~~/ /~~`
 #             -==/ /
 #               '-'
 #
 #  ______________\`\______________
 #          |\ ____\_\__
 #  --------\c`""""""" "`)---------
 #           `-----/ /--`
 #  _____________ / /______________
 #               '-'
 # © http://www.asciiworld.com/-Planes-.html :)