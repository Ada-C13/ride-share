
trips = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating:5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ]
}

# Method to print out the info per driver.
def driver_info (trips)
  rides_per_driver = []
  trips.map do |ride_number,count|
    rides_per_driver << "#{ride_number}: #{count.length}"
  end
  return rides_per_driver
end

# Hash to hold the total value per driver, key: driver_id value: sum of all trips.
$money_per_driver = {}
# To calculate the total money per driver.
def driver_total_money (trips)
  trips.map do |driver_id, trip|
    total_cost = trip.map{ |p| p[:cost]}
    sum = total_cost.inject(:+)
    $money_per_driver[driver_id] = sum
    puts "#{driver_id}: #{sum}"
  end
  return $money_per_driver
end
# Hash to hold the key: driver_id with the average of rating per driver as a value.
$rating_per_driver = {}
# Method to calculate the average of rating per driver.
def driver_average (trips)
  trips.map do |driver_id, trip|
    total_cost = trip.map{ |p| p[:rating]}
    sum = total_cost.inject(:+)
    average = sum.to_f / total_cost.size
    $rating_per_driver[driver_id] = average
    puts "#{driver_id}: #{average.round(2)}"
  end
  return $rating_per_driver
end

# Method to get the highest value in a hash. 
def largest_hash_key(hash)
  max = nil
  hash.max_by do |driver_id,values|
    max = "#{driver_id}: #{values.round(2)}"
  end
  return max
end

# Print out the infomation and invoking the methdos.
puts "\n"
puts "🚗 ----Total Driver's Earnings and Number of Rides--- 🚗"
puts "\n"
puts "- The number of rides each driver has given: -"
puts driver_info(trips)
puts "\n"
puts "- The total amount of money each driver has made: -"
driver_total_money(trips)
puts "\n"
puts "- The average rating for each driver: -"
puts "       ★★★★★"
driver_average(trips)
puts "\n"
puts "- Driver made the most money: -"
puts largest_hash_key($money_per_driver)
puts "\n"
puts "- Driver has the highest average rating: "
puts "        ★★★★★"
puts largest_hash_key($rating_per_driver)
