require 'csv'
#********************************************************************
#Manual input:
# trips = [
# {:driver_id=>"DR0004", :date=>"3rd Feb 2016", :cost=>5, :rider_id=>"RD0022", :rating=>5},
# {:driver_id=>"DR0001", :date=>"3rd Feb 2016", :cost=>10, :rider_id=>"RD0003", :rating=>3},
# {:driver_id=>"DR0002", :date=>"3rd Feb 2016", :cost=>25, :rider_id=>"RD0073", :rating=>5},
# {:driver_id=>"DR0001", :date=>"3rd Feb 2016", :cost=>30, :rider_id=>"RD0015", :rating=>4},
# {:driver_id=>"DR0003", :date=>"4th Feb 2016", :cost=>5, :rider_id=>"RD0066", :rating=>5},
# {:driver_id=>"DR0004", :date=>"4th Feb 2016", :cost=>10, :rider_id=>"RD0022", :rating=>4},
# {:driver_id=>"DR0002", :date=>"4th Feb 2016", :cost=>15, :rider_id=>"RD0013", :rating=>1},
# {:driver_id=>"DR0003", :date=>"5th Feb 2016", :cost=>50, :rider_id=>"RD0003", :rating=>2},
# {:driver_id=>"DR0002", :date=>"5th Feb 2016", :cost=>35, :rider_id=>"RD0066", :rating=>3},
# {:driver_id=>"DR0004", :date=>"5th Feb 2016", :cost=>20, :rider_id=>"RD0073", :rating=>5},
# {:driver_id=>"DR0001", :date=>"5th Feb 2016", :cost=>45, :rider_id=>"RD0003", :rating=>2}
# ]

#********************************************************************
#Wanted to explore a more efficient way to do this if we get a bigger data set later
#Used: https://ruby-doc.org/stdlib-2.6.1/libdoc/csv/rdoc/CSV.html#method-c-parse
#Converters are specific to csv. If column values are numbers, convert to numbers. This happens behind the scenes, I do not know how.

trips = []
CSV.parse(File.read("./rides.csv"),  headers:true,converters: :numeric,header_converters: :symbol) do |row|
  trips.push(row.to_h)
end  

#********************************************************************
#********************************************************************
#Step 4: Total Driver's Earnings and Number of Rides
#Iterate through the data structure to display, by printing in terminal, the following info:

#********************************************************************
# 1. The number of rides each driver has given
#Notes: trips array ---- trip_hash ----- inside this is another hash where key: driver_id (they are going to be unique keys) and value is count of trips

driver_number_trips_hash = {}
trips.each do |trip_hash|
  if driver_number_trips_hash.key?(trip_hash[:driver_id])
    driver_number_trips_hash[trip_hash[:driver_id]] += 1
  else
    driver_number_trips_hash[trip_hash[:driver_id]] = 1
  end
end
puts "The number of rides each driver has given."
driver_number_trips_hash.each do |key, value|
  puts "Driver:#{key}, Trips:#{value}."
end
#********************************************************************

# 2. The total amount of money each driver has made
# driver: 
driver_total_hash = {}

trips.each do |trip_hash|
  #this_cost = trip_hash[:cost]
  #this_driver = trip_hash[:driver_id]

  if driver_total_hash.key?(trip_hash[:driver_id])
    driver_total_hash[trip_hash[:driver_id]] = driver_total_hash[trip_hash[:driver_id]] + trip_hash[:cost]
  else
    driver_total_hash[trip_hash[:driver_id]] = trip_hash[:cost]
  end
end
puts "The total amount of money each driver has made."
driver_total_hash.each do |key, value|
  puts "Driver:#{key}, Total:$#{value}."
end

#********************************************************************

# 3. The average rating for each driver

driver_total_rating_hash = {}
driver_number_trips_hash = {}
driver_average_rating_hash = {}

trips.each do |trip_hash|
  if driver_total_rating_hash.key?(trip_hash[:driver_id])
    driver_total_rating_hash[trip_hash[:driver_id]] = driver_total_rating_hash[trip_hash[:driver_id]] + trip_hash[:rating]
  else
    driver_total_rating_hash[trip_hash[:driver_id]] = trip_hash[:rating]
  end

  if driver_number_trips_hash.key?(trip_hash[:driver_id])
    driver_number_trips_hash[trip_hash[:driver_id]] += 1
  else
    driver_number_trips_hash[trip_hash[:driver_id]] = 1
  end
end

#Calculation for total
# driver_total_rating_hash.each do |key, value|
#   puts "This is the total rating for each driver: Driver: #{key}, Total Rating: #{value}."
# end

puts "The average rating for each driver."
driver_total_rating_hash.each do |driver_id, total_rating|
  driver_average_rating_hash[driver_id] = total_rating.to_f/driver_number_trips_hash[driver_id]
  puts "Driver: #{driver_id}, Average Rating: #{total_rating.to_f/driver_number_trips_hash[driver_id]}."
end

#********************************************************************
# 4. Which driver made the most money?

most_money = 0
most_money_driver = ""
driver_total_hash.each do |driver_id, driver_cost|
#check the value if bigger than most_most
#if true, set it to most_money and save most_money_driver to driver_id 
  if driver_cost > most_money
    most_money = driver_cost
    most_money_driver = driver_id
  end
end
puts "Which driver made the most money?"
puts "Driver: #{most_money_driver} , Money: $#{most_money}."

#********************************************************************
# 5. Which driver has the highest average rating?

highest_average = 0
highest_average_driver = ""

driver_average_rating_hash.each do |driver_id, driver_average|
  if driver_average > highest_average
    highest_average = driver_average
    highest_average_driver = driver_id
  end
end

puts "Which driver has the highest average rating?"
puts "Driver: #{highest_average_driver}, Rating:#{highest_average}."

#********************************************************************
# Optionally, print in the terminal:
## For each driver, on which day did they make the most money?

#loop through trips
driver_date_cost_hash = {}

trips.each do |trip_hash|
#driver id = key, value = date_cost_hash {k:date => v:cost}
  driver_id = trip_hash[:driver_id]
  date = trip_hash[:date]
  cost = trip_hash[:cost]
  #if driver exist
  if driver_date_cost_hash.key?(driver_id)
    # get the hash from driver_id
    date_cost_hash = driver_date_cost_hash[driver_id]
    # check if date exist in has
    if date_cost_hash.key?(date)
      # if true, add previous cost to new cost
      date_cost_hash[date] = date_cost_hash[date] + cost
    else
      # else, add date to hash with new cost
      date_cost_hash[date] = cost
    end  
  else #doesn't exist, add the key and value(date hash where k:date, v:cost)
    driver_date_cost_hash[driver_id] = {date => cost}
              
  end
end

#Here is the data structure from 139-164 doing a loop to find out the most money & on what day for each driver.
puts "For each driver, on which day did they make the most money?"
driver_date_cost_hash.each do |driver, date_cost_hash|

  most_cost = 0
  most_date = ""
  date_cost_hash.each do |date, cost|
    if cost > most_cost
      most_cost = cost
      most_date = date
    end
  end
puts "Driver: #{driver}, Date: #{most_date}, Money: $ #{most_cost}."
end

#This is the data structure for the first loop Lines:139-164
#   driver_id  => hash 
#   "DR004" => {
#                 date => total_cost
#                 "3rd" => 5,
#                 "4th" => 10,
#                 "5th" => 20
#                 "6th" => 88
#   },
#   "DR003" => {
#                 "4th" => 5,
#                 "5th" => 50
#   }
#   {
#     "new driver"=> {
#                       3rd => 5
#     }
#   }
# }