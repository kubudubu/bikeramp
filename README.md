# Bikeramp

## Trips

### Create Trip
This endpoint logs the trip and automatically calculates the distance between start and destination addresses.

Request: `POST <host>/api/trips`

Request Parameters
```
start_address: Start address in format: "Plac Europejski 2, Warszawa, Polska"
destination_address: Destination address in format: "Plac Europejski 2, Warszawa, Polska"
price: Package price in PLN
date: Date of delivery
```

## Stats

### Get Weekly Stats

This endpoint retrieves how many kilometers did courier rode during current week and how much money he received on the rides.

Request: `GET <host>/api/stats/weekly`

The above command returns JSON structured like this:
```
{
  "total_distance": "40km",
  "total_price":    "49.75PLN"
}
```

### Get Monthly Stats

This endpoint retrieves summary of ride distances from current month, grouped by day. The summary should include sum of all rides distances from given day, average ride distance and average price for the ride.

Request: `GET <host>api/stats/monthly`

The above command returns JSON structured like this:
```
[
  {
    "day":            "July, 4th",
    "total_distance": "12km",
    "avg_ride":       "4km",
    "avg_price":      "22.75PLN"
  },
  {
    "day":            "July, 5th",
    "total_distance": "3km",
    "avg_ride":       "3km",
    "avg_price":      "15.5PLN"
  }
]
```

