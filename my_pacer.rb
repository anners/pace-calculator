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
unless distance && total_time && start_time
	puts "usage: pace-calculator distance total_time start_time"
	exit 1
end

cal = PaceCalculator.new(distance, total_time, start_time)
pace = cal.get_pace
puts "your pace is #{pace} miutes per mile"

mile_time = cal.mile_and_time

pp mile_time

mile_time.each do |key, value|
  if key.index("mile")
    puts "mile #{value[:mile]} : time #{value[:time]}"
	elsif value[:cutoff].nil?
	  puts "mile #{value[:mile]} : aid station #{key}"
	else
	  puts "mile #{value[:mile]} : aid station #{key} : cutoff time #{value[:cutoff]}"
	end
end

#pp cal.full_course
