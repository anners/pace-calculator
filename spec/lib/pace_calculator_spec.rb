require "spec_helper"
require "pace_calculator"

describe PaceCalculator do
	cal = PaceCalculator.new(13.1, "2:15", "5:01", true)

	it "sets distance" do
		expect(cal.distance).to eq(13.1)
	end

	it "sets total_time" do
		expect(cal.total_time).to eq("2:15")
	end

	it "sets start_time" do
		expect(cal.start_time).to eq("5:01")
	end

	it "is a valid pace" do 
		expect(cal.get_pace).to eq("6:52")
	end

	it "is a valid hour" do 
		expect(cal.get_hour(cal.total_time)).to eq(2)
	end

	it "is a valid minutes" do 
		expect(cal.get_min(cal.start_time)).to eq(01)
	end

	it "is a valid has" do
		expect(cal.mile_and_time).to include("mile 4" => {:mile => 4, :time => "5:28:28", :cutoff=>nil})
	end
	


end
