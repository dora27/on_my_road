require 'routific'

routific = Routific.new('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1OGNmZTYwMmFhMGM3NDY4MGExY2FmY2QiLCJpYXQiOjE0OTAwOTAzMzB9.rRLtYR3UNixeilzKqcl1R2s6f-ONDsVQld06pv_EZcQ')


  visits = {
    "order_1": {
      "location": {
        "name": "6800 Cambie",
        "lat": 49.227107,
        "lng": -123.1163085
      },
      "start": "9:00",
      "end": "12:00",
      "duration": 10
    },
    "order_2": {
      "location": {
        "name": "3780 Arbutus",
        "lat": 49.2474624,
        "lng": -123.1532338
      },
      "start": "9:00",
      "end": "12:00",
      "duration": 10
    },
    "order_3": {
      "location": {
        "name": "800 Robson",
        "lat": 49.2819229,
        "lng": -123.1211844
      },
      "start": "8:00",
      "end": "9:00",
      "duration": 10
    }
  }

  fleet = {
    "vehicle_1": {
      "start_location": {
        "id": "depot",
        "name": "800 Kingsway",
        "lat": 49.2553636,
        "lng": -123.0873365
      },
      "end_location": {
        "id": "depot",
        "name": "800 Kingsway",
        "lat": 49.2553636,
        "lng": -123.0873365
      },
      "shift_start": "8:00",
      "shift_end": "12:00"
    }
  }

data = { visits: visits, fleet: fleet}
route = Routific.getRoute(data)

puts route
# visits = {
#   "stop_1" => {
#     "duration" => 10,
#     "location" => {
#       "name" => "Rue Paul Bellamy, Nantes",
#       "lat" => 47.227239,
#       "lng" => -1.560836
#     }
#   },
#   "stop_2" => {
#   "duration" => 10,
#   "location" => {
#     "name" => "Rue de Dinan, Bédée",
#     "lat" => 48.181880,
#     "lng" => -1.945098
#     }
#   }
# }

# fleet = {
#   "vehicle_1" => {
#     "start_location" => {
#       "name" => "Rue du Bosphore, Rennes",
#       "lat" => 48.083982,
#       "lng" => -1.676955
#     },
#     "end_location" => {
#       "name" => "Les Vieilles Charues",
#       "lat" => 48.271149,
#       "lng" => -3.550576
#     },
#     "shift_end" => "18:00"
#   }
# }
