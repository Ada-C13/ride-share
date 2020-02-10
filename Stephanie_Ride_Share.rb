
drivers = {
  DR0001: [
    {
      trip_date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      trip_date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      trip_date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0002: [
    {
      trip_date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      trip_date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      trip_date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],
  DR0003: [
    {
      trip_date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      trip_date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0004: [
    {
      trip_date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      trip_date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    },
    {
      trip_date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ]
}


driver_pay = 0 
max_driver = ""
max_pay = 0
driver_rating = 0.0 
best_driver = ""
best_rating = 0.0


drivers.each { |driver, drive|
  drive.each { |drives|
    driver_pay += drives[:cost]
    driver_rating += drives[:rating]
  }
  if driver_pay > max_pay
    max_pay = driver_pay
    max_driver = driver
  end
  driver_rating = (driver_rating / drive.length).round(2)
  if driver_rating > best_rating
    best_driver = driver
    best_rating = driver_rating
  end
  puts "Driver #{driver} gave #{drive.length} rides and made a total of $#{driver_pay}.00. 
  Their average rating is #{driver_rating}"
  driver_pay = 0 
  driver_rating = 0.0 
}

puts "Driver #{max_driver} made the most money with a total earnings of $#{max_pay}.00"
puts "Driver #{best_driver} has the highest rating at #{best_rating}"
