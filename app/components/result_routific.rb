# require 'geocoder'
require 'csv'

# address_passenger = "Rue Lambily, 22230 Merdrignac, France"

def result_routific(address_passenger)
Routific.setToken(ENV['ROUTIFIC'])

#Upload Drivers
fleet = {}
depart_time = "8:00"


CSV.foreach("#{Rails.root.to_s}/public/sample-driver.csv", {:col_sep => ";"}) do |row|
  hsh_start = {}
  hsh_end = {}
  hsh = {}

  address = row[1]

  location_driver = Geocoder.search(address)
  location_charrues = Geocoder.search("Dépendances de Persivien, 29800 Carhaix")

  hsh_start[:name] = address
  hsh_start[:lat] = location_driver[0].latitude
  hsh_start[:lng] = location_driver[0].longitude

  hsh_end[:name] = "Les Vieilles Charues"
  hsh_end[:lat] = location_charrues[0].latitude
  hsh_end[:lng] = location_charrues[0].longitude


  hsh[:start_location] = hsh_start
  hsh[:end_location] = hsh_end
  hsh[:shift_start] = depart_time

  fleet[row[0].to_sym] = hsh
end
fleet


#My passenger
visits = {}
hsh_location = {}
hsh_stop = {}
hsh = {}

duration = 10

location_passenger = Geocoder.search(address_passenger)

hsh_location[:name] = address_passenger
hsh_location[:lat] = location_passenger[0].latitude
hsh_location[:lng] = location_passenger[0].longitude

hsh_stop[:duration] = duration
hsh_stop[:location] = hsh_location

hsh[:passenger] = hsh_stop

visits = hsh


#The best traject
data = {
  visits: visits,
  fleet: fleet
}

route = Routific.getRoute(data)
return route
end


