require 'geocoder'
require 'csv'

hsh_start = {}
hsh_end = {}
hsh = {}
fleet = {}

location_driver = Geocoder.search("Rue Paul Bellamy, Nantes, France")
location_charrues = Geocoder.search("Dépendances de Persivien, 29800 Carhaix")

hsh_start[:name] = "Rue Paul Bellamy, Nantes, France"
hsh_start[:lat] = location_driver[0].latitude
hsh_start[:lng] = location_driver[0].longitude

hsh_end[:name] = "Les Vieilles Charues"
hsh_end[:lat] = location_charrues[0].latitude
hsh_end[:lng] = location_charrues[0].longitude


hsh[:start_location] = hsh_start
hsh[:end_location] = hsh_end
hsh[:shift_end] = "18:00"

fleet[:driver_1] = hsh

p hsh
