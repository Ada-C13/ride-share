########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.

# DriverID array > Rides array > HASH :Date :Cost :Rider_ID :Rating

# Drivers [driver_data] - array
# drives - array
# hash of ride info (:Date :Cost :Rider_ID :Rating)

# Which layers are nested in each other?

# ride data (date/cost/rider/rating) inside of drives inside of drivers

# Which layers of data "have" within it a different layer?

# QUESTION how is this question different than above?

# Which layers are "next" to each other?

# The ride info is next to each other on the same level

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# Drivers [driver_data] - array
# drives - array
# hash of ride info (:Date :Cost :Rider_ID :Rating)

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

driver_data = {
  DR0001: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3,
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider_id: "RD0003",
      rating: 2,
    },
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1,
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3,
    },
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5,
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2,
    },
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5,
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4,
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5,
    },
  ],
}

# puts "This code is working."

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use iteration blocks to print the following answers:
# - the number of rides each driver has given

driver_calcs = []
driver_data.each do |driver, rides|
  money_earned = 0
  total_rating = 0.0
  rides.each do |ride|
    money_earned += ride[:cost]
    total_rating += ride[:rating]
  end
  driver_calcs << { driver_data: driver, num_rides: rides.size, driver_money: money_earned, driver_rating: (total_rating / rides.size) }
end

def print_variables(array, variable, descriptor)
  array.each do |key, value|
    puts "- ID #{key[:driver_data]}: #{key[variable]} #{descriptor}"
  end
end

puts "How many rides has each driver given?"
print_variables(driver_calcs, :num_rides, "rides")

# - the total amount of money each driver has made

puts "How much total money has each driver earned?"
print_variables(driver_calcs, :driver_money, "dollars")

# - the average rating for each driver

rating_sentences = []
puts "What's each driver's average rating?"
driver_calcs.each do |key, value|
  puts "- The driver with ID #{key[:driver_data]} has an average rating of #{key[:driver_rating].round(1)}."
end

# - Which driver made the most money?
top_money = 0
top_money_id = ""
driver_calcs.each do |key, value|
  if key[:driver_money] > top_money
    top_money_id = key[:driver_data]
    top_money = key[:driver_money]
  end
end

puts "The driver with the highest earnings has ID # #{top_money_id}. They earned $#{top_money}."

# - Which driver has the highest average rating?

top_rating = 0.0
top_rating_id = ""
driver_calcs.each do |key, value|
  if key[:driver_rating] > top_rating
    top_rating_id = key[:driver_data]
    top_rating = key[:driver_rating]
  end
end

puts "The driver with the highest average rating has ID # #{top_rating_id}. They earned #{top_rating.round(1)} stars."
