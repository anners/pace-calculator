class AidStations
	def get_aid_stations()
		aid_stations = {
			"Gold Lake" => {:mile => 7.4},
		  "Fuji 1" => {:mile => 12.4},
		  "Fuji 2" => {:mile => 14.9},
			"Mt Ray" => {:mile => 20.5},
			"The Twins 1" => {:mile => 27.1},
			"Charlton Lake" => {:mile => 32, :cutoff => "13:00"},
			"Rd 4290" => {:mile => 37.2, :cutoff => "14:15"},
			"The Twins 2" => {:mile => 44.7, :cutoff => "16:30"},
			"Maiden Peak" => {:mile => 49.9},
			"Maiden Lake" => {:mile => 55},
			"Finish" => {:mile=> 62.5, :cutoff => "21:00"} }
		return aid_stations
	end
end
