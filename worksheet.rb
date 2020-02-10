########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
  # driver_id, date, cost, rider_id, rating, array of Trips, trip hash (11 total)

# Which layers are nested in each other?
  #- Hashes of individual trips with { keys: driver_id, date, cost, rider_id, and rating} that are nested inside a larger array called Trips = []

# Which layers of data "have" within it a different layer? (nested): 
  # There are two: an array that's comprised of hashes

# Which layers are "next" to each other? 
  #The elements that are next to one another or on the same level are comprised of the keys in the hash: {key: driver_id, date, cost, rider_id, and rating}

########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have

# # trips = 
#   [ 
#     { driver_id => DR0004,
#       date => 3rd Feb 2016,
#       cost => 5,
#       rider_id => RD0022,
#       rating => 5
#   }
#   ]
 #- Hashes of trip with { keys: driver_id, date, cost, rider_id, and rating} are nested inside a larger array called trips = []

########################################################
# Step 3: Make the data structure! - Ok! 

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