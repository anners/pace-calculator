
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

require 'pp'

class PaceCalculator

   attr_accessor :distance, :total_time, :start_time

   def initialize(distance, total_time, start_time)
	  @distance = distance
	  @total_time = total_time
	  @start_time = start_time
	end

	def get_pace() 
 		hour = get_hour(@total_time)
 		minutes = get_min(@total_time)

 		# convert to seconds
 		minutes = (hour.to_i * 60) + minutes.to_i

 		# fake pace the seconds need to be converted
 		fake_pace = (minutes / @distance.to_f).round(2)

 		# get seconds to convert
 		minutes, seconds = fake_pace.to_s.split('.')
 		seconds = (".#{seconds}".to_f * 60).to_s.split('.').first

 		pace = "#{minutes}:#{seconds}"

 		return pace

	end

#
# TODO return a hash and make single minutes 0X and do seconds math
#
	def mile_and_time()
		pace_min, pace_sec = get_pace.split(':')
		hour = get_hour(@start_time)
 		minutes = get_min(@start_time)
 		seconds = 0
 		miles_time = Hash.new 

		(@distance.to_i+1).times do |i|
			# format correcly
			formatted_mins = '%02d' % minutes
			formatted_secs = '%02d' % seconds
	  		time = "#{hour}:#{formatted_mins}:#{formatted_secs}"
	  		#puts "mile #{i} : time #{time}"
	  		miles_time[i] = time
	  		# time math is fun!
	  		seconds += pace_sec.to_i
	  		if seconds >= 60 
	  			seconds -= 60
	  			minutes += 1
	  		end
	  		minutes += pace_min.to_i
	  		if minutes >= 60 
	  			minutes -= 60
	  			hour += 1
	  		end
		end
		return miles_time
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

