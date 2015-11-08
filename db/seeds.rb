# read & parse the json file containing the locations and import them in our database
data = JSON.parse File.read('db/seeds/locations.json')
data['locations'].each do |a|
  Location.create
       vehicle_count:  a['vehicleCount'].to_i,
		   latitude:       a['latitude'].to_f,
		   longitude:      a['longitude'].to_f,
		   restrictedp:    a['restrictedP'],
		   market_id:      a['marketId'].to_i, 
		   location_id:    a['locationId'].to_i,
		   has_vans:       a['hasVans'].to_i, 
		   zipfleet_id:    a['zipfleetId'].to_i,
		   description:    a['description']
end 
   
   
