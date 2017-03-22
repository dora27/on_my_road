require 'geocoder'


visits = {}
hsh_location = {}
hsh_stop = {}
hsh = {}

address_passenger = "Rue Lambily, 22230 Merdrignac, France"
duration = 10

location_passenger = Geocoder.search(address_passenger)

hsh_location[:name] = address_passenger
hsh_location[:lat] = location_passenger[0].latitude
hsh_location[:lng] = location_passenger[0].longitude

hsh_stop[:duration] = duration
hsh_stop[:location] = hsh_location

hsh[:passenger] = hsh_stop

visits = hsh

p visits
