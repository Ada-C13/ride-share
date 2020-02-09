# Find number of rides each driver has given
def find_num_of_rides(rideshare)
  num_of_rides = rideshare.map { |driver, rides| [driver, rides.length] }.to_h
  return num_of_rides
end

# Find driver ids' and total earnings from the dataset 
# and store these info as key-value (driver_id => earning) pairs in the hash
def drivers_earnings(rideshare)
  each_driver_earns = {}

  rideshare.each do |driver, rides|
    driver_total = 0
    rides.each do |ride|
      driver_total += ride[:cost]
    end
    each_driver_earns[driver.to_s] = driver_total
  end
  return each_driver_earns
end

# Find the highest valus from a hash
def find_highest_value(hash)
  highest_value = hash.max_by {|driver, value| value}[0]
end

# Find driver ids' and average rates from the dataset 
# and store these info as key-value (driver_id => average rate) pairs in the hash
def drivers_ratings(rideshare)
  drivers_avg_ratings = {}
  
  rideshare.each do |driver, rides|
    driver_total_rate = 0
    rides.each do |ride|
      driver_total_rate += ride[:rating]
    end
    # Total rates divided by the rides driver has give will return the average rate
    drivers_avg_ratings[driver.to_s] = (driver_total_rate.to_f / rides.length).round(1)
  end
  return drivers_avg_ratings
end

# Access only ONE DRIVER from the dataset, find dates and there total earnings 
# and store these info as key-value (date: earning) pairs in the hash
def dates_with_earnings(driver)
  earns_per_date = {}
  
  driver.each do |rides|
    # Add the date (key) if it does not exist in the hash, and assign a temporary value 0
    if !earns_per_date.has_key? rides[:date]
      earns_per_date[rides[:date]] = 0
    end
    # If there are more than one ride on a day, the eanring (value) will keep adding on
    earns_per_date[rides[:date]] += rides[:cost]
  end
  return earns_per_date
end

rideshare = {
  dr0001: [
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
  dr0002: [
    { 
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
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
  dr0003: [
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
  dr0004: [
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

puts "========== Total rides of each driver ==========\n\n"
# Call find_num_of_rides method, and iterate using its return value to print out message
rides_per_driver = find_num_of_rides(rideshare)
rides_per_driver.each do |driver, num_rides|
  if num_rides == 1
    puts "Driver ##{driver} has given a total of #{num_rides} ride"
  else
    puts "Driver ##{driver} has given a total of #{num_rides} rides"
  end
end

puts "\n========== Amount each driver made ==========\n\n"
# Call drivers_earnings method, and iterate using its return value to print out message
earning_per_driver = drivers_earnings(rideshare)
earning_per_driver.each do |driver, earning|
  puts "Driver ##{driver} made a total of $#{earning}" # p each_driver_earns[index][index]
end

# Call find_highest_value method, and use its return value to print out message
driver_earns_most = find_highest_value(drivers_earnings(rideshare))
puts "\nDriver ##{driver_earns_most} made the most money."

puts "\n======== Average rating of each driver ========\n\n"
# Call drivers_ratings method, and iterate using its return value to print out message
driver_avg_rate = drivers_ratings(rideshare)
driver_avg_rate.each do |driver, rate|
  puts "The average rating for driver ##{driver} is #{rate}"    
end

# Call find_highest_value method, and use its return value to print out message
highest_rate_driver = find_highest_value(drivers_ratings(rideshare))
puts "\nDriver ##{highest_rate_driver}  has the highest average rating."

puts "\n======== Date each driver made the most ========\n\n"
# Iterate through the dataset to retrieve each driver id 
rideshare.each do |driver, rides|
  # Call find_highest_value with dates_with_earnings method, to find the date each driver made the most money
  highest_date = find_highest_value(dates_with_earnings(rideshare[driver]))
  puts "Driver ##{driver} make the most money on #{highest_date}"
end
