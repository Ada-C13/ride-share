# a method to add a driver to the driver hash
def add_driver_to_hash(ride_hash, drivers_hash)
  drivers_hash[ride_hash[:driver_id]] = {
    num_rides_given: 1,
    total_amt_made: ride_hash[:cost],
    total_of_ratings: ride_hash[:rating]
  }
end

# a method to update an existing driver's hash
def modify_driver_hash(ride_hash, drivers_hash)
  drivers_hash[ride_hash[:driver_id]][:num_rides_given] += 1
  drivers_hash[ride_hash[:driver_id]][:total_amt_made] += ride_hash[:cost]
  drivers_hash[ride_hash[:driver_id]][:total_of_ratings] += ride_hash[:rating]
end

# ride information copied from the rides.csv file, organized as an array of hashes, where each hash represents one ride
rides = [
  {
    driver_id: "DR0004",
    date: "3rd Feb 2016",
    cost: 5,
    rider_id: "RD0022",
    rating: 5
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: 10,
    rider_id: "RD0003",
    rating: 3
  },
  {
    driver_id: "DR0002",
    date: "3rd Feb 2016",
    cost: 25,
    rider_id: "RD0073",
    rating: 5
  },
  {
    driver_id: "DR0001",
    date: "3rd Feb 2016",
    cost: 30,
    rider_id: "RD0015",
    rating: 4
  },
  {
    driver_id: "DR0003",
    date: "4th Feb 2016",
    cost: 5,
    rider_id: "RD0066",
    rating: 5
  },
  {
    driver_id: "DR0004",
    date: "4th Feb 2016",
    cost: 10,
    rider_id: "RD0022",
    rating: 4
  },
  {
    driver_id: "DR0002",
    date: "4th Feb 2016",
    cost: 15,
    rider_id: "RD0013",
    rating: 1
  },
  {
    driver_id: "DR0003",
    date: "5th Feb 2016",
    cost: 50,
    rider_id: "RD0003",
    rating: 2
  },
  {
    driver_id: "DR0002",
    date: "5th Feb 2016",
    cost: 35,
    rider_id: "RD0066",
    rating: 3
  },
  {
    driver_id: "DR0004",
    date: "5th Feb 2016",
    cost: 20,
    rider_id: "RD0073",
    rating: 5
  }, 
  {
    driver_id: "DR0001",
    date: "5th Feb 2016",
    cost: 45,
    rider_id: "RD0003",
    rating: 2
  }
]

# initiliaze the new drivers hash where information per driver will be stored
drivers = {}

# loop through the rides array of hashes
rides.each do |ride|
  if !drivers.keys.include? ride[:driver_id] # if the driver's id does not already exist in the drivers' hash, call the add_driver_to_hash method to add it
    add_driver_to_hash(ride, drivers)
  else # if the driver's id already exists in the drivers' hash, call the modify_driver_hash method to add it
    modify_driver_hash(ride, drivers)
  end
end

highest_amt_money_made = 0 # create the variable to store the highest amount of money made and set it to 0
driver_with_highest_amt_money = "" # create the variable to store the driver id for the driver who earned the most amount of money
highest_average_rating = 0 # create the variable to store the highest average rating and set it to 0
driver_with_highest_rating = "" # create the variable to store the driver id for the driver who had the highest average rating

# loop through the drivers hash
drivers.each do |driver_id, driver_info|
  avg_rating = driver_info[:total_of_ratings].to_f / driver_info[:num_rides_given] # calculate the drivers average rating 
  driver_info[:avg_rating] = avg_rating # add the driver's average rating to their hash
  # print driver's information
  puts "Driver #{driver_id} Information:
  Number of rides given: #{driver_info[:num_rides_given]}
  Total amount of money made: $#{driver_info[:total_amt_made]}
  Average rating: #{driver_info[:avg_rating].round(2)}
  ......................."
  # set the highest_amt_money_made variable to the driver's total amt made if it's higher than the current highest_amt_money_made
  if driver_info[:total_amt_made] > highest_amt_money_made 
    highest_amt_money_made = driver_info[:total_amt_made] 
    driver_with_highest_amt_money = driver_id # also set the driver_with_highest_amt_money variable to the driver's id
  end
  # set the highest_average_rating variable to the driver's average rating if it's higher than the current highest_average_rating
  if driver_info[:avg_rating] > highest_average_rating
    highest_average_rating = driver_info[:avg_rating]
    driver_with_highest_rating = driver_id # also set the driver_with_highest_rating variable to the driver's id
  end
end

puts "The driver with the highest amount of money made was #{driver_with_highest_amt_money} who made $#{highest_amt_money_made}." # output driver w/ highest amt money made
puts "The driver with the highest rating was #{driver_with_highest_rating} with a rating of #{highest_average_rating.round(2)}." # output driver w/ highest avg rating
