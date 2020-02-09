#!/usr/bin/ruby
# 
# Title  : Project Ride Share - Ada Cohort 13
# Author : Suely Barreto
# Date   : February 2020

##########################################################
# Step 1: Establish the layers
# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?
########################################################## 

## Solution
    ## There is 1 CSV file with ride information (11 lines and 5 columns)
    ## Each line has information for 1 ride (driver_id, ride_date, ride_cost, rider_id, ride_rating)
    ## You can summarize driver information for the 4 drivers (rides, earnings, and ratings)

########################################################
# Step 2: Assign a data structure to each layer
# Copy your list from above, and in this section
# determine what data structure each layer should have
########################################################

## Solution
  ## 1 array (rides) with 11 hashes (ride), each with 5 keys (driver_id, ride_date, ride_cost, rider_id, ride_rating)
  ## 3 hashes (drivers_ride, drivers_earnings, drivers_rating)

########################################################
# Step 3: Make the data structure!
# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"
########################################################

# Create a hash with all the information about the rides
rides = [
  {
    driver_id:   "DR0004",
    ride_date:   "3rd Feb 2016",
    ride_cost:   5,
    rider_id:    "RD0022",
    ride_rating: 5
  },
  {
    driver_id:   "DR0001",
    ride_date:   "3rd Feb 2016,",
    ride_cost:   10,
    rider_id:    "RRD0003",
    ride_rating: 3
  },
  {
    driver_id:   "DR0002",
    ride_date:   "3rd Feb 2016",
    ride_cost:   25,
    rider_id:    "RD0073",
    ride_rating: 5
  },
  {
    driver_id:   "DR0001",
    ride_date:   "3rd Feb 2016",
    ride_cost:   30,
    rider_id:    "RD0015",
    ride_rating: 4
  },
  {
    driver_id:   "DR0003",
    ride_date:   "4th Feb 2016",
    ride_cost:   5,
    rider_id:    "RD0066",
    ride_rating: 5
  },
  {
    driver_id:   "DR0004",
    ride_date:   "4thFeb 2016",
    ride_cost:   10,
    rider_id:    "RD0022",
    ride_rating: 4
  },
  {
    driver_id:   "DR0002",
    ride_date:   "4th Feb 2016",
    ride_cost:   15,
    rider_id:    "RD0013",
    ride_rating: 1
  },
  {
    driver_id:   "DR0003",
    ride_date:   "5th Feb 2016",
    ride_cost:   50,
    rider_id:    "RD0003",
    ride_rating: 2
  },
  {
    driver_id:   "DR0002",
    ride_date:   "5th Feb 2016",
    ride_cost:   35,
    rider_id:    "RD0066",
    ride_rating: 3
  },
  {
    driver_id:   "DR0004",
    ride_date:   "5th Feb 2016",
    ride_cost:   20,
    rider_id:    "RD0073",
    ride_rating: 5
  },
  {
    driver_id:   "DR0001",
    ride_date:   "5th Feb 2016",
    ride_cost:   45,
    rider_id:    "RD0003",
    ride_rating: 2
  }
]

# Create a hash with the drivers and how many rides they had
drivers_ride = Hash.new(0) 
rides.each do |ride|
  driver = ride[:driver_id]
  drivers_ride[driver] += 1
end

# Create a hash with the drivers and how much money they made
drivers_earnings = Hash.new(0) 
rides.each do |ride|
  driver = ride[:driver_id]
  cost   = ride[:ride_cost]
  drivers_earnings[driver] += cost
end

# Create a hash with the drivers and their total rating
drivers_rating = Hash.new(0) 
rides.each do |ride|
  driver = ride[:driver_id]
  rating = ride[:ride_rating]
  drivers_rating[driver] += rating
end

#########################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use iteration blocks to print the following answers:
#########################################################

# 1. Number of rides each driver has given
drivers_ride.each do |driver, rides|
  puts "The driver #{driver} had #{rides} ride(s)."
end

# 2. Total amount of money each driver has made
drivers_earnings.each do |driver, earnings|
  puts "The driver #{driver} made $#{earnings}."
end

# 3. Average rating for each driver
drivers_rating.each do |driver, rating|
  average = rating.to_f / drivers_ride[driver]
  puts "The driver #{driver} has an average rating of %.2f." % [average]
end

# 4. Which driver made the most money?
most_driver = ""
most_cost   = 0
drivers_earnings.each do |driver, cost|
  if cost > most_cost
    most_cost   = cost
    most_driver = driver
  end
end
puts "The driver that made the most money was #{most_driver}."

# 5. Which driver has the highest average rating?
most_driver  = ""
most_average = 0
drivers_rating.each do |driver, rating|
  average = rating.to_f / drivers_ride[driver]
  if average > most_average
    most_average = average
    most_driver  = driver
  end
end
puts "The driver that had the highest average rating was #{most_driver}."
