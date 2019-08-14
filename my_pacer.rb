#!/usr/bin/env ruby
#
# a simple program to print out your pace per hour based on distance and finish time
# created to play around with finishing time since Miwok100k changed the cutoff times
# @author ann wallace
#

require './lib/pace_calculator'

distance = ARGV[0]
total_time = ARGV[1]
start_time = ARGV[2]
with_aid_stations = false;
pace_only = false;
with_aid_stations = true if ARGV[3].eql?("with_aid_stations")
unless distance && total_time && start_time
	puts "usage: pace-calculator distance total_time start_time (optional with_aid_stations)"
	exit 1
end

cal = PaceCalculator.new(distance, total_time, start_time, with_aid_stations, pace_only)
pace = cal.get_pace()

mile_time = cal.mile_and_time
puts "mile,time,aid station,cutoff time"
mile_time.each do |key, value|
  if key.index("mile")
    puts "mile #{value[:mile]},#{value[:time]}"
	elsif value[:cutoff].nil?
	  puts "mile #{value[:mile]}, ,#{key}"
	else
	  puts "mile #{value[:mile]} , ,#{key},#{value[:cutoff]} "
	end
end
puts "your pace is #{pace} minutes per mile"

#pp cal.full_course
