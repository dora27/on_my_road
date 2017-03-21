require 'geocoder'
require 'json'
require 'csv'

fleet = {}
arrival_time = "18:00"

#Chargement des drivers
CSV.foreach("file.csv") do |row|
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
  hsh[:shift_end] = arrival_time

  fleet[row[0].to_sym] = hsh
end



#   fleet = {
#     "vehicle_1" => {
#       "start_location" => {
#         "name" => "Rue du Bosphore, Rennes",
#         "lat" => 48.083982,
#         "lng" => -1.676955
#       },
#       "end_location" => {
#         "name" => "Les Vieilles Charues",
#         "lat" => 48.271149,
#         "lng" => -3.550576
#       },
#       "shift_end" => "18:00"
#     }
#   }

#   "fleet": {
#   "driver_1": {
#     "start_location": {
#       "id": "depot",
#       "name": "800 Kingsway",
#       "lat": 49.2553636,
#       "lng": -123.0873365
#     },
#     "end_location": {
#       "id": "depot",
#       "name": "800 Kingsway",
#       "lat": 49.2553636,
#       "lng": -123.0873365
#     },
#     "shift_start": "8:00",
#     "shift_end": "17:00",
#     "min_visits": 14,
#     "capacity": 10,
#     "type": ["A", "B"],
#     "strict_start": true,
#     "break_start": "12:00",
#     "break_end": "13:30",
#     "break_duration": 30
#   },
#   "driver_2": {
#     "start_location": {
#       "id": "depot",
#       "name": "800 Kingsway",
#       "lat": 49.2553636,
#       "lng": -123.0873365
#     },
#     "end_location": {
#       "id": "depot",
#       "name": "800 Kingsway",
#       "lat": 49.2553636,
#       "lng": -123.0873365
#     },
#     "shift_start": "8:00",
#     "shift_end": "17:00",
#     "capacity": 5
#   }
# }


# file = File.read('demo.json')
# data = JSON.parse(file)


