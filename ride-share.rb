driver_info = [
      { 
        driver_id: "DR0001",
        trips: [
          {
            date: "3rd Feb 2016",
            cost: 10,
            rider_id: "RD0003",
            rating: 5.to_f
          },
        {
          date: "3rd Feb 2016",
          cost: 30,
          rider_id: "RD0015",
          rating: 4.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 45,
          rider_id: "RD0003",
          rating: 2.to_f
        },
    ]},
    { driver_id: "DR0002",
      trips: [
        {
          date: "3rd Feb 2016",
          cost: 25,
          rider_id: "RD0073",
          rating: 5.to_f
       },
        {
          date: "4th Feb 2016",
          cost: 15,
          rider_id: "RD0013",
          rating: 1.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 35,
          rider_id: "RD0066",
          rating: 3.to_f
        },
    ]},
    { driver_id: "DR0003",
      trips: [
        {
          date: "4th Feb 2016",
          cost: 5,
          rider_id: "RD0066",
          rating: 5.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 20,
          rider_id: "RD0003",
          rating: 2.to_f
        },
      ]},
    { driver_id: "DR0004", 
      trips: [
        {
          date: "3rd Feb 2016",
          cost: 5,
          rider_id: "RD0022",
          rating: 5.to_f
        },
        {
          date: "4th Feb 2016",
          cost: 10,
          rider_id: "RD0022",
          rating: 4.to_f
        },
        {
          date: "5th Feb 2016",
          cost: 20,
          rider_id: "RD0073",
          rating: 5.to_f
        },
      ]},
  ]

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

drivers_cost_totals = []
#this loop identifies  each driver(s) id
driver_info.each do |driver|

#outputs drivers id 
puts "This  puts driver id: #{driver[:driver_id]}"

# show the breakdown of each trip a driver to based on driver id 
trips_for_this_driver = driver[:trips]
trips_for_this_driver.map do |record|
end

# empty array gathering all 
num = 0
drivers_cost_totals = []
driver_total_ratings= []
trips_for_this_driver.map do |trip|
  puts "On #{trip[:date]} Trip #{num+=1} #{trip[:cost]}"
  trips_date = trip[:date]
  trips_cost = trip[:cost]
  trips_rating = trip[:rating]
  drivers_cost_totals << trips_cost
  driver_total_ratings << trips_rating 
end

#The number of rides each driver has given
puts "DRIVER  #{driver[:driver_id]} DROVE #{drivers_cost_totals.count} rides."
puts "On #{driver[:date]} driver made $#{drivers_cost_totals.max}"


# The total amount of money each driver has made
puts "DRIVERS TOTAL COST #{driver[:driver_id]} $#{drivers_cost_totals.sum}"

# The average rating for each driver
 puts "DRIVER  #{driver[:driver_id]} DROVE #{(driver_total_ratings.sum/driver_total_ratings.length).round(2)}"
end

  
# Which driver made the most money?
most_profitable_driver = driver_info.max_by do |driver|
  driver[:trips].sum do |trip|
   trip[:cost]
  end
end
puts
puts "Most profitable driver #{most_profitable_driver[:driver_id]}"
most_profitable_driver[:trips].each do |trip|
    puts "Date #{trip[:date]} Cost $#{trip[:cost]}"

end 

# Which driver has the highest average rating?
highest_average_rated_driver = driver_info.max_by do |driver|
   total_ratings = driver[:trips].sum do |trip|
    trip[:rating]
   end
   avg_rating = total_ratings / driver[:trips].length 
end 


sum_of_highest_rated_drivers_ratings =[]
# puts "Highest Average Rated Driver #{highest_average_rated_driver}"
puts
puts "Highest rated driver name #{highest_average_rated_driver[:driver_id]}"
highest_average_rated_driver[:trips].each do |trip|
puts "Date #{trip[:date]}Rating #{trip[:rating]}"
sum_of_highest_rated_drivers_ratings << trip[:rating]  
end
