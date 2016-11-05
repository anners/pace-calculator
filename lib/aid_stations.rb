class AidStations

	def get_aid_stations()
		aid_stations = {
			"Bertone" => {:mile => 9},
			"Bonatti" => {:mile =>14},
			"Arnouvaz" => {:mile => 17, :cutoff => "16:45"},
			"La Fouly" => {:mile => 26, :cutoff => "20:30"},
			"Champex-lac" => {:mile => 34, :cutoff => "23:30"},
			"Trient" => {:mile => 45, :cutoff => "4:00"},
			"Vallorcine" => {:mile => 51, :cutoff => "7:15"},
			"La Flegere" => {:mile => 58, :cutoff => "10:45"},
			"Chamonix" => {:mile => 63, :cutoff => "12:15"}		
		}
		return aid_stations
	end

end