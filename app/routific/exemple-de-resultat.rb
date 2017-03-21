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
