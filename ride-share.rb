# Data Structure:
drivers = {
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

# Total Driver's Earnings, Number of Rides, and Average Rating
drivers.each do |driver_key, details_array|
    puts "DATA FOR DRIVER #{driver_key}:\n"
    # the number of rides each driver has given
    puts "total rides: #{details_array.length}"
    # the total amount of money each driver has made
    total_earnings = 0
    details_array.each do |ride_hash|
        total_earnings += ride_hash[:cost]
    end
    puts "total earnings: $#{total_earnings}"
    # the average rating for each driver
    array_of_ratings = []
    details_array.each do |ride_hash|
        array_of_ratings << ride_hash[:rating]
    end
    puts "average rating: #{array_of_ratings.sum / array_of_ratings.length}\n"
end

# Highest Earner
highest_earnings = 0
highest_earner = ""

drivers.each do |driver_key, details_array| 
    total_earnings = 0 
    details_array.each do |ride_hash|
        total_earnings += ride_hash[:cost]
    end
    if total_earnings > highest_earnings # reassign vars to winner
        highest_earnings = total_earnings
        highest_earner = driver_key
    end
end

puts "The driver with the highest earnings is: #{highest_earner}"

# Highest Average Rating
highest_average_rating = 0
highest_rated_driver = ""

drivers.each do |driver_key, details_array| 
    array_of_ratings = []
    details_array.each do |ride_hash|
        array_of_ratings << ride_hash[:rating]
    end
    average_rating = array_of_ratings.sum / array_of_ratings.length
    if average_rating > highest_average_rating
        highest_average_rating = average_rating
        highest_rated_driver = driver_key
    end
end

puts "The driver with the highest average rating is: #{highest_rated_driver}"
