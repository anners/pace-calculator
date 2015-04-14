#!/usr/bin/env ruby
#
# pace calculator - takes in a distance and your desired finish time 
# and calculates your miles per minute and your time for each mile.
# 
# @mile_and_time - based on your pace, distance and start time creates a list of
#                  of what time it should be every mile
# 
# TODO: add aid stations and account for elevation changes
#
# @author ann wallace
#

class PaceCalculator

   attr_accessor :distance, :finish_time, :start_time

   def initialize(distance, finish_time, start_time)
	  @distance = distance
	  @finish_time = finish_time
	  @start_time = start_time
	end

	def get_pace() 
 		hour = get_hour(@finish_time)
 		minutes = get_min(@finish_time)

 		# convert to seconds
 		seconds = (hour.to_i * 60**2) + (minutes.to_i * 60)

 		miles_per_minute = ((seconds / @distance.to_f) / 60 ).round(2)
 		return miles_per_minute

	end

	def mile_and_time()
		pace = get_pace
		hour = get_hour(@start_time)
 		minutes = get_min(@start_time)

		@finish_time.to_i.times do |i|
	  	# do somoething
		end
	end

	def get_hour(time)
		t = time.split(':',2)
		return t[0].to_i
	end

	def get_min(time)
		t = time.split(':',2)
		return t[1].to_i
	end

end

