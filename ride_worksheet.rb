Hash.new
drivers_data = {
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
    rating: 1}
  ],
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
    rating: 3}
  ],
  DR0003: [
    {date: "4th Feb 2016",
    rider_id: "RD0066",
    cost: 5,
    rating: 5},
    {date: "5th Feb 2016",
    rider_id: "RD0003",
    cost: 50,
    rating: 2}
  ],
  DR0004: [
    {date: "4th Feb 2016",
    rider_id: "RD0022",
    cost: 5, 
    rating: 5},
    {date: "5th Feb 2016", 
    rider_id: "RD0022",
    cost: 10,
    rating: 4},
    {date: "5th Feb 2016",
    rider_id: "RD0073",
    cost: 20,
    rating: 5}
  ]  
}



# 1. The number of rides each driver has given 
drivers_data.each do |driver_id, trips|
  puts "Driver #{driver_id}'s total trips: #{trips.length}"
end

# 2. The total amount of money each driver has made
drivers_data.each do |driver_id, trips|
  total = 0
  trips.each { |trip|
  total += trip[:cost]
}
  puts "Driver #{driver_id}'s total earnings: $#{total}"
  # puts "$#{total} and #{driver_id}"
end

# 3. The average rating for each driver
drivers_data.each do |driver_id, trips|
  ratings = 0
  trips.each { |trip|
  ratings += trip[:rating]
}
  avg_rating = ratings/trips.length
  puts "Average rating for #{driver_id} is: #{avg_rating}"
end

# 4. Which driver made the most money?
most_earned = 0;
driver_info = 0;
drivers_data.each do |driver_id, trips|
  total = 0
  trips.each { |trip|
  total += trip[:cost]
}
  if total > most_earned  
    most_earned = total;
    driver_info = driver_id;
  end
end

puts "#{driver_info} earned the most money, with a total of $#{most_earned}."

# 5. Calculate and display driver with the highest average rating
highest_avg_rating = 0;
driver_info = 0;
drivers_data.each do |driver_id, trips|
  ratings = 0;
  avg_rating = 0;
  trips.each { |trip|
  ratings += trip[:rating]
}
avg_rating = ratings/trips.length
  if avg_rating > highest_avg_rating
    highest_avg_rating = avg_rating;
    driver_info = driver_id;
  end
end

puts "#{driver_info} was rated the highest, with a average rating of #{highest_avg_rating}."
