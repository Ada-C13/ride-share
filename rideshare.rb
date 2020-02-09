# This program shows data on drivers, their earnings, ratings and trips
drivers =
  {
    DR0001: [
      {date: "3rd Feb 2016",
       rider_id: "RD0003",
       cost: 10,
       rating: 3},
      {date: "3rd Feb 2016",
       rider_id: "RD0015",
       cost: 30,
       rating: 4},
      {date: "5th Feb 2016",
       rider_id: "RD0003",
       cost: 45,
       rating: 2}],
    DR0002: [
      {date: "3rd Feb 2016",
       rider_id: "RD0073",
       cost: 25,
       rating: 5},
      {date: "4th Feb 2016",
       rider_id: "RD0013",
       cost: 15,
       rating: 1},
      {date: "5th Feb 2016",
       rider_id: "RD0066",
       cost: 35,
       rating: 3}],
    DR0003: [
      {date: "4th Feb 2016",
       rider_id: "RD0066",
       cost: 5,
       rating: 5},
      {date: "5th Feb 2016",
       rider_id: "RD0003",
       cost: 50,
       rating: 2}],
    DR0004: [
      {date: "3rd Feb 2016",
       rider_id: "RD0022",
       cost: 5,
       rating: 5},
      {date: "4th Feb 2016",
       rider_id: "RD0022",
       cost: 10,
       rating: 4},
      {date: "5th Feb 2016",
       rider_id: "RD0073",
       cost: 20,
       rating: 5}]
  }

# The number of rides each driver has given
def rides_number(drivers_hash)
  drivers_hash.reduce({}) { |rides_hash, driver_and_rides|
    rides_hash[driver_and_rides[0]] = driver_and_rides[1].length
    rides_hash
}
end

# The total amount of money each driver has made
def drivers_earnings(drivers_hash)
  earnings = {}
  drivers_hash.each do |id, array|
    earnings[id] = array.sum { |trip| trip[:cost] }
  end
  return earnings
end
earnings_hash = drivers_earnings(drivers)
# Which driver made the most money?
richest_driver = earnings_hash.max_by{ |driver_id, total| total}

# The average rating for each driver
def average_rating(drivers_hash)
  rating_sum = {}
  rating_average = {}
  drivers_hash.each do |driver_id, trips|
    rating_sum[driver_id] = trips.reduce(0) { |sum, trip| sum + trip[:rating] }
    rating_average[driver_id] = rating_sum[driver_id] / trips.length.to_f
  end
  return rating_average
end
ratings = average_rating(drivers)
# Which driver has the highest average rating?
highest_rated = ratings.max_by{ |driver_id, rating| rating}

# For each driver, on which day did they make the most money?
earnings_by_each_trip = {}
best_day = {}
drivers.each do |driver_id, trips_array|
  earnings_by_each_trip[driver_id] = trips_array.reduce({}) { |earnings_hash, day_info|
    if earnings_hash.key?(day_info[:date])
      earnings_hash[day_info[:date]] += day_info[:cost]
    else
      earnings_hash[day_info[:date]] = day_info[:cost]
    end
    earnings_hash
}
  best_day[driver_id] = earnings_by_each_trip[driver_id].max_by { |day, earnings| earnings}
end

puts
rides_number(drivers).each do |driver_id, rides_count|
  puts "A driver id #{driver_id} has given #{rides_count} rides, and has made #{earnings_hash[driver_id]}$. His average rating is %0.1f." % [ratings[driver_id]]
  puts "The most money #{best_day[driver_id][1]}$ the driver made was on the #{best_day[driver_id][0]}."
end
puts "----------------"
puts "The driver with driver id #{richest_driver[0]} made the most money #{richest_driver[1]}$."
puts "The driver with driver id #{highest_rated[0]} has the highest rating equal to %0.1f." % [highest_rated[1]]

