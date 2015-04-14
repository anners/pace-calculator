#!/usr/bin/env ruby
#
# pace calculator - takes in a distance and your desired finish time 
# and calculates your miles per minute and your time for each mile
# 
# TODO: add aid stations and account for elevation changes
#
# @author ann wallace
#

class PaceCalculator

	attr_accessor :distance, :finish_time

  def initialize(distance, finish_time)
	  @distance = distance
		@finish_time = finish_time
	end

	def get_pace() 
 		hours, minutes  = @finish_time.split(':')

 		# convert to seconds
 		seconds = (hours.to_i * 60**2) + (minutes.to_i * 60)

 		miles_per_minute = ((seconds / @distance.to_f) / 60 ).round(2)
 		return miles_per_minute

	end

	def mile_and_time(pace)
		@finish_time.to_i.times do |i|
	  	# do somoething
		end
	end

end

