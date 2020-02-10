# This program uses a nested data structure that holds information about 
# rideshare drivers and rides.  It calls methods to perform calculations
# about rides, ratings, and earnings, and displays information to the user.

# Calculates total rides
def num_rides(drivers_par)
  total_rides = {}
  drivers_par.map do |driver, rides|
    total_rides[driver] = rides.length
  end
  return total_rides
end

# Calculates total earnings
def total_earnings(drivers_par)
  sum = 0
  total_earnings_hash = {}
  drivers_par.each do |driver_id, rides|
    rides.each do |ride|
      sum += ride[:cost]
      total_earnings_hash[driver_id] = sum
    end
    sum = 0
  end
  return total_earnings_hash
end

# Calculates average rating
def average_ratings(drivers_par)
  sum = 0
  average_ratings_hash = {}
  drivers_par.each do |driver_id, rides|
    total = rides.length
    rides.each do |ride|
      sum += ride[:rating]
      average_ratings_hash[driver_id] = sum.to_f / total.to_f
    end
    sum = 0
  end
  return average_ratings_hash
end

# Calculates highest earner
def highest_earner(drivers_par)
  max_earned = 0.0
  winner = ""
  total_earnings(drivers_par).map do |id, earnings|
    if earnings > max_earned
      max_earned = earnings
      winner = id
    end
  end
  return winner
end

# Calculates highest rating
def best_rating(drivers_par)
  max_rating = 0.0
  best_driver = ""
  average_ratings(drivers_par).map do |id, rating|
    if rating > max_rating
      max_rating = rating
      best_driver = id
    end
  end
  return best_driver
end

# Data Structure
drivers = {
  :DR0001 => [
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],
  :DR0002 => [
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],
  :DR0003 => [
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    },
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    }
  ],
  :DR0004 => [
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

# Displays total rides
puts "************"
puts "Total Rides:"
puts "************"
num_rides(drivers).each do |id, rides|
  puts "Driver #{id} drove #{rides} times."
end

# Displays total cost for each driver
puts "\n***************"
puts "Total Earnings:"
puts "***************"
total_earnings(drivers).each do |id, earnings|
  puts "Driver #{id} earned $#{earnings}."
end

# Displays average rating for each driver
puts "\n****************"
puts "Average ratings:"
puts "****************"
average_ratings(drivers).each do |id, rating|
  puts "Driver #{id}'s average rating is #{("%.2f") % rating}."
end

# Displays which driver made the most money
puts "\n***************"
puts "Highest Earner:"
puts "***************"
puts "Driver #{highest_earner(drivers)} made the most money."

# Displays which driver has the highest rating
puts "\n***************"
puts "Highest rating:"
puts "***************"
puts "Driver #{best_rating(drivers)} had the highest average rating."
