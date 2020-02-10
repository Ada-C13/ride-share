# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

# the dates needed a bit of tweeking to be apropriately ordinalized.

# based on layering (nesting) method 3:
all_rides = {
  :DR0001 => [
    {:DATE => "3rd Feb 2016", :COST => 10, :RIDER_ID => "RD0003", :RATING => 3},
    {:DATE => "3rd Feb 2016", :COST => 30, :RIDER_ID => "RD0015", :RATING => 4},
    {:DATE => "5th Feb 2016", :COST => 45, :RIDER_ID => "RD0003", :RATING => 2}
  ],
  :DR0002 => [
    {:DATE => "3rd Feb 2016", :COST => 25, :RIDER_ID => "RD0073", :RATING => 5},
    {:DATE => "4th Feb 2016", :COST => 15, :RIDER_ID => "RD0013", :RATING => 1},
    {:DATE => "5th Feb 2016", :COST => 35, :RIDER_ID => "RD0066", :RATING => 3}
  ],
  :DR0003 => [
    {:DATE => "4th Feb 2016", :COST =>  5, :RIDER_ID => "RD0066", :RATING => 5},
    {:DATE => "5th Feb 2016", :COST => 50, :RIDER_ID => "RD0003", :RATING => 2}
  ],
  :DR0004 => [
    {:DATE => "3rd Feb 2016", :COST =>  5, :RIDER_ID => "RD0022", :RATING => 5},
    {:DATE => "4th Feb 2016", :COST => 10, :RIDER_ID => "RD0022", :RATING => 4},
    {:DATE => "5th Feb 2016", :COST => 20, :RIDER_ID => "RD0073", :RATING => 5}
  ]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

rides_num = {} 
all_rides.each do |driver, rides|
  rides_num[driver] = rides.length
end

driver_total_income = {}
all_rides.each do |driver, rides|
  driver_income = rides.map do |each_ride|
    each_ride [:COST]
  end
  driver_total_income[driver] = driver_income.sum
end

driver_average_rating = {}
all_rides.each do |driver, rides|
  driver_rating = rides.map do |each_ride|
    each_ride[:RATING].to_f
  end
  driver_average_rating[driver] = ( driver_rating.sum / rides.length ).round(2)
end
# I had found #.round(2) on stackoverflow.com when I was researching for the technical challenge part of the application. 

# Use an iteration blocks to print the following answers:
puts "Faezeh's Ride Share Report:"
puts ""

# The number of rides each driver has given:
puts "The number of rides each driver has given:"
rides_num.each do |driver, rides|
  puts "Driver #{driver[-1]} has given #{rides} rides."
end
puts ""

# The total amount of money each driver has made:
puts "The total amount of money each driver has made:"
driver_total_income.each do |driver, money|
  puts "Driver #{driver[-1]} has made $#{money}."
end
puts ""

# - the average rating for each driver
puts "The average rating for each driver:"
driver_average_rating.each do |driver, rating|
  puts "The average rating for driver #{driver[-1]} is #{rating} "
end
puts ""

# - Which driver made the most money?
puts "Which driver made the most money?"
puts "Driver #{driver_total_income.key(driver_total_income.values.max)[-1]} has made the most money which is $#{driver_total_income.values.max}."  
puts ""

# - Which driver has the highest average rating?
puts "Which driver has the highest average rating?"
puts "Driver #{driver_average_rating.key(driver_average_rating.values.max)[-1]} has the highest average rating which is #{driver_average_rating.values.max}."  
puts ""

# Optionally, print in the terminal:
puts "For each driver, on which day did they make the most money?"

all_rides.each do |driver, rides|
  driver_income = rides.map do |each_ride|
    each_ride [:COST]
  end
  puts "Driver #{driver[-1]}'s highest paying ride was on #{rides[driver_income.rindex(driver_income.max)][:DATE]}."
end
