# gem install routific
require 'routific'
require 'json'

Routific.setToken('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1OGNmZTYwMmFhMGM3NDY4MGExY2FmY2QiLCJpYXQiOjE0OTAwOTAzMzB9.rRLtYR3UNixeilzKqcl1R2s6f-ONDsVQld06pv_EZcQ')


# Fetch the demo data and parse it to JSON
file = File.read('demo.json')
data = JSON.parse(file)


visits = {
  "stop_1" => {
    "duration" => 10,
    "location" => {
      "name" => "Rue Paul Bellamy, Nantes",
      "lat" => 47.227239,
      "lng" => -1.560836
    }
  },
  "stop_2" => {
  "duration" => 10,
  "location" => {
    "name" => "Rue de Dinan, Bédée",
    "lat" => 48.181880,
    "lng" => -1.945098
    }
  }
}

fleet = {
  "vehicle_1" => {
    "start_location" => {
      "name" => "Rue du Bosphore, Rennes",
      "lat" => 48.083982,
      "lng" => -1.676955
    },
    "end_location" => {
      "name" => "Les Vieilles Charues",
      "lat" => 48.271149,
      "lng" => -3.550576
    },
    "shift_end" => "18:00"
  }
}

data = {
  visits: visits,
  fleet: fleet
}

route = Routific.getRoute(data)

p route
