require "spec_helper"
require "pace_calculator"

describe PaceCalculator do
	cal = PaceCalculator.new(13.1, "2:15", "5:01")

	it "sets distance" do
		expect(cal.distance).to eq(13.1)
	end

	it "sets finish_time" do
		expect(cal.finish_time).to eq("2:15")
	end

	it "sets start_time" do
		expect(cal.start_time).to eq("5:01")
	end

	it "is a valid pace" do 
		expect(cal.get_pace).to eq(10.31)
	end

	it "is a valid hour" do 
		expect(cal.get_hour(cal.finish_time)).to eq(2)
	end

	it "is a valid minutes" do 
		expect(cal.get_min(cal.start_time)).to eq(01)
	end


end
