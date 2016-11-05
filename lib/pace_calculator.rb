
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
require './lib/aid_stations'

class PaceCalculator

   attr_accessor :distance, :total_time, :start_time, :with_aid_stations



   def initialize(distance, total_time, start_time, with_aid_stations, pace_only)
	  @distance = distance
	  @total_time = total_time
	  @start_time = start_time
	  @with_aid_stations = with_aid_stations
	  @pace_only = pace_only
	end

	# TODO set_aid_stations
	def set_aid_stations
	end


	def get_pace() 
 		hour = get_hour(@total_time)
 		minutes = get_min(@total_time)
 		

 		if with_aid_stations 
 		# get the number of aid stations and removed the first and last one
 		number_of_aid_stations = get_aid_stations.length-2
 		# add 5 minutes per aid station 
	 		time_at_aid_stations = number_of_aid_stations * 5
	 		if time_at_aid_stations >= 60 
	 			minutes -= (time_at_aid_stations - 60)
	 			hour -= 1
	 		else
	 			minutes -= time_at_aid_stations
	 		end
	 	end

 		# convert to seconds
 		minutes = (hour.to_i * 60) + minutes.to_i

 		# fake pace the seconds need to be converted
 		fake_pace = (minutes / @distance.to_f).round(2)

 		# get seconds to convert
 		minutes, seconds = fake_pace.to_s.split('.')
 		seconds = "%02d"%((".#{seconds}".to_f * 60).to_s.split('.').first)

 		pace = "#{minutes}:#{seconds}"

 		return pace

	end

	# simplied version of old get_full_course - merging hashes and sorting on miles
	def full_course()
		all_miles = Hash.new
		

		(@distance.to_i+1).times do |i|
			all_miles.merge!({"mile #{i}" => {:mile => i}})
		end
		if with_aid_stations
			aid_stations = get_aid_stations
			all_miles.merge!(aid_stations)
		end
		

		course = all_miles.sort_by { |key,value| value[:mile]}

		return course
	end

	
	# adding course
	def mile_and_time()
		pace_min, pace_sec = get_pace.split(':')
		hour = get_hour(@start_time)
 		minutes = get_min(@start_time)
 		seconds = 0
 		miles_time = Hash.new 
 		course = full_course
 		
		course.each do |key,value|
			# format correcly
			formatted_mins = '%02d' % minutes
			formatted_secs = '%02d' % seconds
	  		time = "#{hour}:#{formatted_mins}:#{formatted_secs}"
	  		
	  		# create a new has with aid stations, running time and cutoff times
	  		# TODO add math for parial miles
	  		if key.index("mile")
	  			miles_time.merge!({key => {:mile => value[:mile], :time => time, :cutoff => value[:cutoff]}})
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
	  			if hour == 25
	  				hour = 01
	  			end
	  		else
	  			miles_time.merge!({key => {:mile => value[:mile], :cutoff => value[:cutoff]}})
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

