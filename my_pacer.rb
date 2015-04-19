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


mile_time.each do |mile, time|
#  puts "mile #{mile} : time #{time}"
end

pp cal.full_course
cal.get_full_course.each do |station, mile|
	#puts "station: #{station} mile #{mile}"
end
