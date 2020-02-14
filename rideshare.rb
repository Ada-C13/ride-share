require 'awesome_print'
require 'chronic'

########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.

# Three layers: RIDES << DRIVER_ID << DATE, COST, RIDER_ID, RATING 

# Which layers are nested in each other?
# DATE, COST, RIDER_ID, RATING are nested in DRIVER_ID
# DRIVER_ID is nested in RIDES

# Which layers of data "have" within it a different layer?
# RIDES and DRIVER_ID

# Which layers are "next" to each other?
# DATE, COST, RIDER_ID, and RATING

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# RIDES = Hash
# DRIVER_ID = Array of hashes 
# DATE, RIDER_ID, COST, RATING: Key-value pairs in a hash 

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

all_rides = {
	DR0001: [
		{
			date: "3rd Feb 2016",
			rider_id: "RD0003",
			cost: 10,
			rating: 3
		},
		{
			date: "3rd Feb 2016",
			rider_id: "RD0015",
			cost: 30,
			rating: 4
		},
		{
			date: "5th Feb 2016",
			rider_id: "RD0003",
			cost: 45,
			rating: 2
		}
	],
	DR0002: [
		{
			date: "3rd Feb 2016",
			rider_id: "RD0073",
			cost: 25,
			rating: 5
		},
		{
			date: "4th Feb 2016",
			rider_id: "RD0013",
			cost: 15,
			rating: 1
		},
		{ 
			date: "5th Feb 2016",
			rider_id: "RD0066",
			cost: 35,
			rating: 3
		}
	],
	DR0003: [
		{
			date: "4th Feb 2016",
			rider_id: "RD0066",
			cost: 5,
			rating: 5
		},
		{
			date: "5th Feb 2016",
			rider_id: "RD0003",
			cost: 50,
			rating: 2
		}
	],
	DR0004: [
		{
			date: "3rd Feb 2016",
			rider_id: "RD0022",
			cost: 5,
			rating: 5
		},
		{
			date: "4th Feb 2016",
			rider_id: "RD0022",
			cost: 10,
			rating: 4
		},
		{
			date: "5th Feb 2016",
			rider_id: "RD0073",
			cost: 20,
			rating: 5
		}
	]
}

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration block to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?
# - OPTIONAL: For each driver, on which day did they make the most money?

# Define a method that takes two arguments (an array of hashes and the key whose values we want to compare) and returns a new array containing the values of the given key
def each_driver(array, key)
	new_array = array.map do |element|
		element[key]
	end
	
	return new_array
end

# Define a method that takes two arguments (an array of hashes and the key whose values we want to compare) and returns the element of the array (in this case, a hash) that contains the max value associated with the given key
def highest(array, key)
	element_with_max_value = array.max_by do |element|
		element[key]
	end

	return element_with_max_value
end

all_totals = all_rides.map do |driver, rides|
	totals = { 
		id: driver,
		rides: rides.length, 
		earnings: each_driver(rides, :cost).sum,
		avg_rating: each_driver(rides, :rating).sum(0.0) / rides.length,
		highest_earning: highest(rides, :cost)[:cost],
		highest_earning_date: Chronic.parse(highest(rides, :cost)[:date])
	}

	ap totals, plain: false, multiline: true, color: {integer: :green, float: :purple, time: :blue}
end

highest_earner = highest(all_totals, :earnings)
highest_rated = highest(all_totals, :avg_rating)

puts "The driver who made the most money is #{highest_earner[:id]} with $#{"%.2f" % highest_earner[:earnings]}. \nThe driver with the highest average rating is #{highest_rated[:id]} with #{"%.1f" % highest_rated[:avg_rating]}."
