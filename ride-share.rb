#ride share hash

drivers_rides_data =
{
  DR0001:
  [
    {
      DATE: "3rd Feb 2016",
      COST: 10,
      RIDER_ID: "RD0003",
      RATING: 3
    },
    {
      DATE: "3rd Feb 2016",
      COST: 30,
      RIDER_ID: "RD0015",
      RATING: 4
    },
    {
      DATE: "5th Feb 2016",
      COST: 45,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],
  DR0002:
  [
    {
      DATE: "3rd Feb 2016",
      COST: 25,
      RIDER_ID: "RD0073",
      RATING: 5
    },
    {
      DATE: "4th Feb 2016",
      COST: 15,
      RIDER_ID: "RD0013",
      RATING: 1
    },
    {
      DATE: "5th Feb 2016",
      COST: 35,
      RIDER_ID: "RD0066",
      RATING: 3
    }
  ],
  DR0003:
  [
    {
      DATE: "4th Feb 2016",
      COST: 5,
      RIDER_ID: "RD0066",
      RATING: 5
    },
    {
      DATE: "5th Feb 2016",
      COST: 50,
      RIDER_ID: "RD0003",
      RATING: 2
    }
  ],  
  DR0004:
  [
    {
      DATE: "3rd Feb 2016",
      COST: 5,
      RIDER_ID: "RD0022",
      RATING: 5
    },
    {
      DATE: "4th Feb 2016",
      COST: 10,
      RIDER_ID: "RD0022",
      RATING: 4
    },
    {
      DATE: "5th Feb 2016",
      COST: 20,
      RIDER_ID: "RD0073",
      RATING: 5
    }
  ]
}




# The number of rides each driver has given
drivers_rides_data.each do |driver, rides_array|
  puts "The driver with the ID #{driver} has given #{rides_array.length.to_s} ride(s)."
end


# The total amount of money each driver has made
drivers_earnings = {}
drivers_rides_data.each do |driver, rides_array|
  total_money = rides_array.reduce(0) { |sum, ride| sum + ride[:COST] }
  puts "The driver with the ID #{driver} made $#{total_money}."
  drivers_earnings[driver] = total_money
end


# The average rating for each driver
drivers_ratings = {}
drivers_rides_data.each do |driver, rides_array|
  total_of_ratings = rides_array.reduce(0) { |sum, ride| sum + ride[:RATING] }
  average_rating = (total_of_ratings.to_f / rides_array.length).round(2)
  puts "The driver with the ID #{driver} has an average rating of #{average_rating} stars."
  drivers_ratings[driver] = average_rating
end


# Which driver made the most money?
top_earner = drivers_earnings.reduce([0, 0]) do |best, (driver, earnings)|
  if earnings > best[1]
    best = [driver, earnings]
  else
    best
  end
end
puts "The driver with the ID #{top_earner[0]} had the highest earnings, at $#{top_earner[1]}."


# Which driver has the highest average rating?
top_rated = drivers_ratings.reduce([0, 0]) do |best, (driver, rating)|
  if rating > best[1]
    best = [driver, rating]
  else
    best
  end
end
puts "The driver with the ID #{top_rated[0]} had the highest average rating, at #{top_rated[1]} stars."


#For each driver, on which day did they make the most money?
drivers_rides_data.each do |driver, rides_array|
  my_daily_earnings = {}
  rides_array.each do |ride|
    date = ride[:DATE]
    if my_daily_earnings.include?(date)
      my_daily_earnings[date] += ride[:COST]
    else
      my_daily_earnings[date] = ride[:COST]
    end
  end

  my_best_day = my_daily_earnings.reduce( [0, 0] ) do |best, (date, money)|
    if money > best[1]
      best = [date, money]
    else
      best
    end
  end
  puts "The driver with the ID #{driver} had their highest earnings on #{my_best_day[0]}, with a total of $#{my_best_day[1]}."
end
