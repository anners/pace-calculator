class Miwok100k
	def get_aid_stations()
		aid_stations = { "Cardiac 1" => {:mile => 2.8}, 
		  "Muir Beach 1" => {:mile => 8}, 
		  "Tennessee Valley 1" => {:mile => 13.8}, 
			"Bridge View" => {:mile => 18.6}, 
			"Tennessee Valley 2" => {:mile => 26, :cutoff => "12:00"},
			"Muir Beach 2" => {:mile => 30.3},
			"Cardiac 2" => {:mile => 35.5, :cutoff => "13:45"}, 
			"Bolinas Ridge 1" => {:mile => 42.5}, 
			"Randall Trailhead" => {:mile => 49.2, :cutoff => "17:20"}, 
			"Bolinas Ridge 2" => {:mile => 55.9, :cutoff =>"18:30"}, 
			"Stinson Beach" => {:mile=> 62.2, :cutoff => "20:30"} }
		return aid_stations
	end
end
