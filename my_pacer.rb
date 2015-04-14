#!/usr/bin/env ruby
#
# a simple program to print out your pace per hour based on distance and finish time
# created to play around with finishing time since Miwok100k changed the cutoff times
# @author ann wallace
#

require './lib/pace_calculator'

distance = ARGV[0] 
finish_time = ARGV[1]
unless distance && finish_time
	puts "usage: pace-calculator distance finish_time"
	exit 1
end

cal = PaceCalculator.new(distance, finish_time)
pace = cal.get_pace()
puts "your pace is #{pace} miutes per mile"
