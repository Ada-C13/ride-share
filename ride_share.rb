########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?

# Drivers (array) -> driver (hash) -> rides (array) -> ride (hash)
# ( "->" represents nesting)

# Which layers of data "have" within it a different layer?

# Drivers is an array of hashes which hold data for each individual driver.
# Each driver hash includes an array of rides.
# Array of rides consist of hashes with data for each ride.

# Which layers are "next" to each other?

# Driver ID and an array of rides are on the same layer. 
# (within individual driver hashes)
# Ride ID, date, rider ID, cost and rating are on the same layer.
# (within individual ride hashes)

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# Drivers (array) -> driver (hash) -> driver_id (string)
#                                  -> rides (array) -> ride (hash) -> ride_id (integer)
#                                                                  -> date (string)
#                                                                  -> rider_id (string)
#                                                                  -> cost (integer)
#                                                                  -> rating (integer)
                                   
########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

drivers = [
  {
    driver_id: "DR0001",
    rides: [
      {
        ride_id: 1,
        date: "Feb 3 2016",
        rider_id: "RD0003",
        cost: 10,
        rating: 3
      },
      {
        ride_id: 2,
        date: "Feb 3 2016",
        rider_id: "RD0015",
        cost: 30,
        rating: 4
      },
      {
        ride_id: 3,
        date: "Feb 5 2016",
        rider_id: "RD0003",
        cost: 45,
        rating: 2
      }
    ]
  },
  {
    driver_id: "DR0002",
    rides: [
      {
        ride_id: 4,
        date: "Feb 3 2016",
        rider_id: "RD0073",
        cost: 25,
        rating: 5
      },
      {
        ride_id: 5,
        date: "Feb 4 2016",
        rider_id: "RD0013",
        cost: 15,
        rating: 1
      },
      {
        ride_id: 6,
        date: "Feb 5 2016",
        rider_id: "RD0066",
        cost: 35,
        rating: 3
      }     
    ]
  },
  {
    driver_id: "DR0003",
    rides: [
      {
        ride_id: 7,
        date: "Feb 4 2016",
        rider_id: "RD0066",
        cost: 5,
        rating: 5
      },
      {
        ride_id: 8,
        date: "Feb 5 2016",
        rider_id: "RD0003",
        cost: 20,
        rating: 5
      }     
    ]
  },
  {
    driver_id: "DR0004",
    rides: [
      {
        ride_id: 9,
        date: "Feb 3 2016",
        rider_id: "RD0022",
        cost: 5,
        rating: 5
      },
      {
        ride_id: 10,
        date: "Feb 4 2016",
        rider_id: "RD0022",
        cost: 10,
        rating: 4
      },
      {
        ride_id: 11,
        date: "Feb 5 2016",
        rider_id: "RD0073",
        cost: 10,
        rating: 4
      }  
    ]
  },
]

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# METHODS

# Adding the following stats for every driver in the data structure:
# 1: number of rides given
# 2: total amount of money made
# 3: average rating

def get_stats(drivers)
  drivers.each do |driver|
    driver[:stats] = {}
    # number of rides given
    driver[:stats][:rides_num] = driver[:rides].length 
    # total amount of money made
    driver[:stats][:income_total] = driver[:rides].sum do |ride|
      ride[:cost]
    end
    # average rating
    rating_sum = driver[:rides].sum do |ride| 
      ride[:rating]
    end
    driver[:stats][:average_rating] = (rating_sum.to_f/driver[:rides].length).round(2)
  end
  return drivers
end

# Finding drivers with the highest income total
def find_highest_income(drivers)
  highest_income = 0
  highest_income_drivers = []
  drivers.each do |driver|
    if driver[:stats][:income_total] > highest_income
      highest_income = driver[:stats][:income_total]
      highest_income_drivers.clear << driver[:driver_id]
    elsif driver[:stats][:income_total] == highest_income
      highest_income_drivers << driver[:driver_id]
    end
  end
  return highest_income_drivers
end

# Finding drivers with highest average rating
def find_highest_rating(drivers)
  highest_rating = 0
  highest_rating_drivers = []
  drivers.each do |driver|
    if driver[:stats][:average_rating] > highest_rating
      highest_rating = driver[:stats][:average_rating]
      highest_rating_drivers.clear << driver[:driver_id]
    elsif driver[:stats][:average_rating] == highest_rating
      highest_rating_drivers << driver[:driver_id]
    end
  end
  return highest_rating_drivers
end

# Printing data to the console
def print_data(drivers, highest_income_drivers, highest_rating_drivers)
  puts "DRIVERS DATA:\n\n"
  drivers.each do |driver|
    puts "Driver #{driver[:driver_id]} has given #{driver[:stats][:rides_num]} rides."
    puts "Their income total is $#{driver[:stats][:income_total]} and their average rating is #{driver[:stats][:average_rating]}.\n\n"
  end

  if highest_income_drivers.length == 1
    puts "Driver with the highest total income is #{highest_income_drivers[0]}."
  else
    message = "Drivers with the highest total income are"
    highest_income_drivers.each do |highest_income_driver|
      message << " #{highest_income_driver},"
    end
      message = message.chop
      message << ".\n\n"
      puts message
  end

  if highest_rating_drivers.length == 1
    print "Driver with the highest average rating is #{highest_rating_drivers[0]}."
  else
    message = "Drivers with the highest average rating are"
    highest_rating_drivers.each do |highest_rating_driver|
      message << " #{highest_rating_driver},"
    end
      message = message.chop
      message << "."
      puts message
  end
end

# Calling methods
get_stats(drivers)
highest_income_drivers = find_highest_income(drivers)
highest_rating_drivers = find_highest_rating(drivers)
print_data(drivers, highest_income_drivers, highest_rating_drivers)
