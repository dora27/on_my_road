require 'geocoder'
require 'csv'
require 'routific'

Routific.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1OGNmZTYwMmFhMGM3NDY4MGExY2FmY2QiLCJpYXQiOjE0OTAwOTAzMzB9.rRLtYR3UNixeilzKqcl1R2s6f-ONDsVQld06pv_EZcQ')


hsh_start = {}
hsh_end = {}
hsh = {}
fleet = {}

location_driver = Geocoder.search("Rue de la Noë, Nantes, France")
location_charrues = Geocoder.search("Dépendances de Persivien, 29800 Carhaix")

hsh_start[:name] = "Rue de la Noë, Nantes, France"
hsh_start[:lat] = location_driver[0].latitude
hsh_start[:lng] = location_driver[0].longitude

hsh_end[:name] = "Les Vieilles Charues"
hsh_end[:lat] = location_charrues[0].latitude
hsh_end[:lng] = location_charrues[0].longitude


hsh[:start_location] = hsh_start
hsh[:end_location] = hsh_end
hsh[:shift_start] = "8:00"

fleet[:driver_1] = hsh

visits = {
  "stop_1": {
    "duration": 10,
    "location": {
      "name": "Rue Paul Bellamy, Nantes",
      "lat": 47.227239,
      "lng": -1.560836
    }
  },
  "stop_2": {
  "duration": 10,
  "location": {
    "name": "Rue de Dinan, Bédée",
    "lat": 48.181880,
    "lng": -1.945098
    }
  }
}

data = {
  visits: visits,
  fleet: fleet
}

route = Routific.getRoute(data)

p route

