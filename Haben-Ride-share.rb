
# creat nested arrays and hash to collect the ride share information
rideshare = {
  DR0001: [
    {date: "3rd Feb ", cost: 10, rating: 3, Rider_ID: "RD0003"},
    {date: "3rd Feb ", cost: 30, rating: 4, Rider_ID: "RD0015"},
    {date: "5th Feb" , cost: 45, rating: 2, Rider_ID: "RD0003"},
  ],
  DR0002: [
    {date: "3rd Feb ", cost: 25, rating: 5, Rider_ID: "RD0073"},
    {date: "4th Feb ", cost: 15, rating: 1, Rider_ID: "RD0013"},
    {date: "5th Feb" , cost: 35, rating: 3, Rider_ID: "RD0066"},
  ],
  DR0003: [
    {date: "4th Feb ", cost: 5, rating: 5, Rider_ID: "RD0066"},
    {date: "5th Feb ", cost: 50, rating: 2, Rider_ID: "RD0003"},
  ],
  DR0004: [
    {date: "3rd Feb ", cost: 5, rating: 5, Rider_ID: "RD0022"},
    {date: "4th Feb ", cost: 10, rating: 4, Rider_ID: "RD0022"},
    {date: "5th Feb" , cost: 20, rating: 5, Rider_ID: "RD0073"}
  ]
}

# 1.The number of rides each driver has given

# define the method
def ride_numbers(rideshare)
# itirate through the values to find the number of rides for each driver
 rideshare.each do |driver, value|
  puts "Driver #{driver} has given #{value.length} rides."
 end
end
# call the method
ride_numbers(rideshare)


#2.The total amount of money each driver has made

#define the method
def money_made(rideshare)
  # initilaize an empty hash to store the total earned
  total_earned = {}
  total = 0
  # itirate through the values throught the first hash
  rideshare.each do |driver, trips| 
    #itirate through the second hash
    trips.each do |trip| 
      total += trip[:cost]
      total_earned[driver] = total 
    end
    total = 0
  end
  return total_earned
end
# call method to find average rating 
total_money = money_made(rideshare)
# and iritate and print
total_money.each do |key, value|
  puts "The total money made by #{key} was $#{value}."
end


# 3.The average rating for each driver

# define method
def average_rating(rideshare)
  # set variables for total rating and total sum
  total_rating = {}
  sum = 0
  # loop through
  rideshare.each do |driver, trips|
    trips.each do |trip|
      # calculate total rating 
      sum += trip[:rating]
      avg_rating = sum / trips.length.to_f
      total_rating[driver] = avg_rating
    end 
    sum = 0
  end
  return total_rating
end

# call method to find average rating 
total_rating = average_rating(rideshare)

# and iritate and print
total_rating.each do |driver, rating|
puts "The average rating for each driver was: #{driver} was #{rating.round(2)}."
end 


# 4.Which driver made the most money?

# define method
def most_money(rideshare)
  highest_earned = 0.0
  high_earner = ""
  # call method from #2
  money_made(rideshare).map do |driver, cost|
    if cost > highest_earned
      highest_earned = cost
      high_earner = driver
    end
  end
  return high_earner
end
puts "The driver who made the most money was #{most_money(rideshare)}."


# 5.Which driver has the highest average rating?

# define method
def highest_average_rating(rideshare)
  highest_rating = 0.0
  best_driver = ""
  # call the method from #3
  average_rating(rideshare).map do |driver, rating|
    if rating > highest_rating
      highest_rating = rating
     best_driver = driver
    end
  end
  return best_driver
end
puts "The driver with the hightst average rating is driver #{highest_average_rating(rideshare)}."



