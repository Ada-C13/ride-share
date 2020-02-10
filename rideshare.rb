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
  ## 1 hash (drivers) with a string key (driver) with a value that is a hash (driver_info) containing rides, earnings, ratings

########################################################
# Step 3: Make the data structure!
# Setup the entire data structure:
########################################################

# Function to get the average rating
def get_average(total_rating, rides)

  if rides > 0
    average = total_rating.to_f / rides
  else
    average = 0
  end
  return average

end

# Create an array from the CSV file
require "csv"
rides = []
CSV.open("rides.csv", 'r', headers: true).each do |ride_array|
  ride_hash = Hash.new
  ride_hash[:driver_id]   = ride_array[0]
  ride_hash[:ride_date]   = ride_array[1]
  ride_hash[:ride_cost]   = ride_array[2].to_f
  ride_hash[:rider_id]    = ride_array[3]
  ride_hash[:ride_rating] = ride_array[4].to_f
  rides << ride_hash
end

# Create a hash for drivers with data from the rides
drivers = Hash.new
rides.each do |ride|
  driver = ride[:driver_id]
  cost   = ride[:ride_cost]
  rating = ride[:ride_rating]
  
# Create a hash for driver info if driver does not exist yet
  if !drivers.key?(driver)
    driver_info = Hash.new
    driver_info[:rides]    = 0
    driver_info[:earnings] = 0
    driver_info[:ratings]  = 0
    drivers[driver]        = driver_info
  end

  drivers[driver][:rides]    += 1
  drivers[driver][:earnings] += cost
  drivers[driver][:ratings]  += rating
end

#########################################################
# Step 4: Total Driver's Earnings and Number of Rides
# Use iteration blocks to print the following answers:
#########################################################

# 1. Number of rides each driver has given
drivers.each do |driver, driver_info|
  puts "The driver #{driver} had #{driver_info[:rides]} ride(s)."
end

# 2. Total amount of money each driver has made
drivers.each do |driver, driver_info|
  puts "The driver #{driver} made $%.2f." % [driver_info[:earnings]]
end

# 3. Average rating for each driver
drivers.each do |driver, driver_info|
  average = get_average(driver_info[:ratings], driver_info[:rides])
  puts "The driver #{driver} has an average rating of %.2f." % [average]
end

# 4. Which drivers made the most money? (handles ties)
most_earnings  = 0
drivers.each do |driver, driver_info|
  if driver_info[:earnings] > most_earnings
    most_earnings = driver_info[:earnings]
  end
end
puts "The drivers that made the most money were:"
drivers.each do |driver, driver_info|
  if driver_info[:earnings] == most_earnings
    puts "- #{driver}"
  end
end

# 5. Which drivers had the highest average rating? (handles ties)
most_average  = 0
drivers.each do |driver, driver_info|
  average = get_average(driver_info[:ratings], driver_info[:rides])
  if average > most_average
    most_average = average
  end
end
puts "The drivers with the highest average rating were:"
drivers.each do |driver, driver_info|
  average = get_average(driver_info[:ratings], driver_info[:rides])
  if average == most_average
    puts "- #{driver}"
  end
end
