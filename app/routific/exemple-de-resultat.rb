
#Résultat Routific
<RoutificApi::Route:0x007fb0209bd570 @status="success", @fitness=nil, @unserved=nil,
  @vehicleRoutes={
    "Quentin"=>[
      <RoutificApi::WayPoint:0x007fb0209bd4f8 @location_id="Quentin_start", @arrival_time="08:00", @finish_time=nil, @location_name="Rue du Bosphore, Rennes">,
      <RoutificApi::WayPoint:0x007fb0209bd4a8 @location_id="passenger", @arrival_time="09:42", @finish_time="09:52", @location_name="Rue Lambily, 22230 Merdrignac, France">,
      <RoutificApi::WayPoint:0x007fb0209bd480 @location_id="Quentin_end", @arrival_time="12:22", @finish_time=nil, @location_name="Les Vieilles Charues">],
    "MC2S"=>[
      <RoutificApi::WayPoint:0x007fb0209bd430 @location_id="MC2S_start", @arrival_time="08:00", @finish_time=nil, @location_name="Rue de Nantes, Rennes">,
    <RoutificApi::WayPoint:0x007fb0209bd3e0 @location_id="MC2S_end", @arrival_time="12:04", @finish_time=nil, @location_name="Les Vieilles Charues">],
    "Dora"=>[
      <RoutificApi::WayPoint:0x007fb0209bd3b8 @location_id="Dora_start", @arrival_time="08:00", @finish_time=nil, @location_name="Rue Premartine, Le Mans">,
    <RoutificApi::WayPoint:0x007fb0209bd368 @location_id="Dora_end", @arrival_time="15:26", @finish_time=nil, @location_name="Les Vieilles Charues">],
    "Virtualflow"=>[
      <RoutificApi::WayPoint:0x007fb0209bd340 @location_id="Virtualflow_start", @arrival_time="08:00", @finish_time=nil, @location_name="Rue Duguesclin, Le Sel-de-Bretagne">,
    <RoutificApi::WayPoint:0x007fb0209bd2c8 @location_id="Virtualflow_end", @arrival_time="12:51", @finish_time=nil, @location_name="Les Vieilles Charues">],
    "Alix"=>[
      <RoutificApi::WayPoint:0x007fb0209bd250 @location_id="Alix_start", @arrival_time="08:00", @finish_time=nil, @location_name="Rue de la Fieffe, Mortain">,
    <RoutificApi::WayPoint:0x007fb0209bd200 @location_id="Alix_end", @arrival_time="14:14", @finish_time=nil, @location_name="Les Vieilles Charues">]}>

#Autres
{
  "status": "success",
  "fitness": 1450,
  "total_travel_time": 24.166666, #minutes
  "total_idle_time": 0, #Total number of minutes that the entire fleet in waiting idle.
  "num_unserved": 0,
  "unserved": null, #The optimized schedule
  "solution": {
    "vehicle_1": [
      {
        "location_id": "depot",
        "location_name": "800 Kingsway"
      },
      {
        "location_id": "order_3",
        "location_name": "800 Robson"
      },
      {
        "location_id": "order_2",
        "location_name": "3780 Arbutus"
      },
      {
        "location_id": "order_1",
        "location_name": "6800 Cambie"
      }
    ]
  }
}

"options": {
   "traffic": "slow",
   "min_visits_per_vehicle": 5,
   "balance": true,
   "min_vehicles": true,
   "shortest_distance": true,
   "squash_durations": 1
}

#Fleet
"fleet": {
  "driver_1": {
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
    "shift_end": "17:00",
    "min_visits": 14,
    "capacity": 10,
    "type": ["A", "B"],
    "strict_start": true,
    "break_start": "12:00",
    "break_end": "13:30",
    "break_duration": 30
  },
  "driver_2": {
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
    "shift_end": "17:00",
    "capacity": 5
  }
}
