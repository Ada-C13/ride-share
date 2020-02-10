########################################################
# Diana Nguyen - Space
# Ride Share
########################################################
# (0) Setting up the entire data structure:
# Level 1: master hash "rides"
# Level 2: 4 sub hashes for each of the drivers
#         driver id is the key and the values are different
#         variables (e.g. date of ride they gave)
# Level 3: within the values hold the array for the
#         variables, this is so the variables line up,
#         (e.g. for Driver 1, they had a date of ride of
#          Feb 3rd, with a rating of 3, earning $10, and 
#          the rider had an id of RD0003)

rides = {
  :DR0001 => {
  date_of_ride: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
  rating: [3, 4, 2],
  money_earned: [10, 30, 45],
  rider_of_drive: ["RD0003", "RD0015", "RD0003"]
  },
  :DR0002 => {
  date_of_ride: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
  rating: [5, 1, 3],
  money_earned: [25, 15, 35],
  rider_of_drive: ["RD0073", "RD0013", "RD0066"]
  },
  :DR0003 => {
  date_of_ride: ["4th Feb 2016", "5th Feb 2016"],
  rating: [5, 2],
  money_earned: [5, 50],
  rider_of_drive: ["RD0066", "RD0003"]
  },
  :DR0004 => {
  date_of_ride: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
  rating: [5, 4, 5],
  money_earned: [5, 10, 20],
  rider_of_drive: ["RD0022", "RD0022", "RD0073"]
  }
}

# Welcome statement of data report

puts "Here is the Ride Share Data analysis from February 3rd, 2016 to February 5th, 2016: "
puts "\n"

########################################################
# (1) Number of rides each driver has given
# Based off of the "date_of_rides" array, finding the 
# length of this array will give the total amount of rides

# Strategy - first try to find amount for one driver first, 
# then iterate. 
# Came up with the following code for a single driver
## puts "Driver 1 gave #{(rides[:DR0001][:date_of_ride]).length} rides"

# To iterate the above code to give all drivers amount of rides
# use the ".map" enumerable
# to access the correct array, must include both key (driver) and value (data) 
# as arguments for the block


rides.map {|driver, data| 
  puts "Driver #{driver} has given #{(data[:date_of_ride]).length} rides"
}

puts "\n"

########################################################
# (2) Earnings for each driver

# Came up with the following code to calculate 
# earnings for one driver:
# ".inject(:+)" enumerable used to combine all elements in the 
# array through addition, giving the total amount of 
# $ a driver earned
# puts "Driver 1 made: $#{(rides[:DR0001][:money_earned]).inject(:+)}"

# When iterating, used same logic as (1), taking note of accessing the
# proper value, ":money_earned"


rides.map {|driver, data| 
  puts "Driver #{driver} made a total of: $#{(data[:money_earned]).inject(:+)}"
}

puts "\n"

########################################################
# (3) Average rating for each driver
# Came up with the following code to calculate 
# average rating for one driver:
# After accessing rating value array, first use ".inject(:+)"
# to get the total ratings
# Then divided by the length of the rating array
# Then converted the total to a float
# puts "Driver 3's average rating is 
# #{(rides[:DR0003][:rating]).inject(:+) / (rides[:DR0003][:rating]).length.to_f}"

# When iterating, wanted a nonrepeating decimal and used sprintf("%.2f", <average rating>)
# to output only 2 decimal places

rides.map {|driver, data| 
  puts "Driver #{driver}'s average rating is: 
  #{ sprintf("%.2f", ((data[:rating]).inject(:+) / ((data[:rating]).length).to_f))}"
}

puts "\n"

########################################################
# (4) Driver who made the most money
# Add on to code from (2)
# create new variable highest_earnings, set equal to zero
# will use to hold as a placeholder and ultimately find the highest earning

# Will also have variable highest_earner to hold the string
# of the driver with the most earnings, for the final puts statement
# Use .each to iterate and a conditional to compare current and previous earnings
# replace highest_earnings value if current value is higher
# print highest earner by using puts "#{driver}"

highest_earnings = 0.0
highest_earner = " "

rides.each { |driver, data|
  current_earning = data[:money_earned].inject(0, :+)
  if  current_earning > highest_earnings
    highest_earner = "#{driver}"
    highest_earnings = current_earning
  end
}

puts "Driver, #{highest_earner}, is the highest earner."

########################################################
# (5) Driver with the highest average rating
# Add on to code from (3)
# same logic as (4) but with ratings

highest_average_rating = 0.0
highest_rated_driver = " "

rides.each { |driver, data|
  current_rating = (data[:rating].reduce(:+) / (data[:rating].length.to_f))
  if current_rating > highest_average_rating
    highest_rated_driver = "#{driver}"
    highest_average_rating = current_rating
  end
}

puts "\n"
puts "Driver, #{highest_rated_driver}, is the highest rated driver."
