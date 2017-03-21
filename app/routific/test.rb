require 'routific'

routific = Routific.new('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1OGNmZTYwMmFhMGM3NDY4MGExY2FmY2QiLCJpYXQiOjE0OTAwOTAzMzB9.rRLtYR3UNixeilzKqcl1R2s6f-ONDsVQld06pv_EZcQ')

routific.setVisit("order_1", {
  "start" => "9:00",
  "end" => "12:00",
  "duration" => 10,
  "location" => {
    "name" => "6800 Cambie",
    "lat" => 49.227107,
    "lng" => -123.1163085,
  }
})

routific.setVehicle("vehicle_1", {
  "start_location" => {
    "name" => "800 Kingsway",
    "lat" => 49.2553636,
    "lng" => -123.0873365,
  },
  "end_location" => {
    "name" => "800 Kingsway",
    "lat" => 49.2553636,
    "lng" => -123.0873365,
  },
  "shift_start" => "8:00",
  "shift_end" => "12:00",
})

route = routific.getRoute()

p route
