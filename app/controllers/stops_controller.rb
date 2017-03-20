class StopsController < ApplicationController
  require 'routific'
  require 'json'

def create
end

def show
end

def routific
# Fetch the demo data and parse it to JSON
routific = Routific.new('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJfaWQiOiI1OGNmZTYwMmFhMGM3NDY4MGExY2FmY2QiLCJpYXQiOjE0OTAwMTk4NDJ9.-BHCgtwhQLFX3hkH-eAAKbuXoavg6yaSVnDj6ZOdCZY')

visits = {
  "order_1" => {
    "start" => "9:00",
    "end" => "12:00",
    "duration" => 10,
    "location" => {
      "name" => "6800 Cambie",
      "lat" => 49.227107,
      "lng" => -123.1163085
    }
  }
}

fleet = {
  "vehicle_1" => {
    "start_location" => {
      "name" => "800 Kingsway",
      "lat" => 49.2553636,
      "lng" => -123.0873365
    },
    "end_location" => {
      "name" => "800 Kingsway",
      "lat" => 49.2553636,
      "lng" => -123.0873365
    },
    "shift_start" => "8:00",
    "shift_end" => "12:00"
  }
}

data = {
  visits: visits,
  fleet: fleet
}

route = Routific.getRoute(data)
end

end
