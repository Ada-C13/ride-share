########################################################
# Step 1: Establish the layers

# In this section of the file, as a series of comments,
# create a list of the layers you identify.
# Which layers are nested in each other?
# Which layers of data "have" within it a different layer?
# Which layers are "next" to each other?
    #at the top is all the trips
    #next layer down is each driver
    #next layer under each driver is each trip they did
    #each trip for each driver will be next to each other in the innermost layer
    #each driver will be next to each other in the middle layer
    #the "umbrella" layer holds everything from the middle and innermost layer inside of it


########################################################
# Step 2: Assign a data structure to each layer

# Copy your list from above, and in this section
# determine what data structure each layer should have
    #outer most layer is an array that will hold all the info
    #middle layer will be of hashes that belong to each individual driver
    #inside the hash of each indiv. driver, there is a hash for each trip

########################################################
# Step 3: Make the data structure!

# Setup the entire data structure:
# based off of the notes you have above, create the
# and manually write in data presented in rides.csv
# You should be copying and pasting the literal data
# into this data structure, such as "DR0004"
# and "3rd Feb 2016" and "RD0022"

all_drivers_all_trips = [
  { DR0001: 
    [{
      date_of_trip: "3 Feb 2016",
      cost: 10,
      rider_id: "RD0003",
      rating: 3
      },
      { 
      date_of_trip: "3 Feb 2016",
      cost: 30,
      rider_id: "RD0015",
      rating: 4
      },
      {
      date_of_trip: "5 Feb 2016",
      cost: 45,
      rider_id: "RD0003", 
      rating: 2
      }]
  }, 

  {DR0002: 
    [{
      date_of_trip: "3 Feb 2016",
      cost: 25,
      rider_id: "RD0073",
      rating:  5
    }, 
    {
      date_of_trip: "4 Feb 2016",
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    }, 
    {
      date_of_trip: "5 Feb 2016",
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }]
  }, 

  {DR0003: 
    [{
      date_of_trip: "4 February 2016",
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    }, 
    {
      date_of_trip: "5 Feb 2016",
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }]
  }, 

  {DR0004:
    [{
      date_of_trip: "3 Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    }, 
    {
      date_of_trip: "4 Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    }, 
    {
      date_of_trip: "5 Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }]
  }
]

########################################################
#Step 4: Total Driver's Earnings and Number of Rides

## Iterate through the data structure to display, by printing in terminal, the following info:
## - The number of rides each driver has given
## - The total amount of money each driver has made
## - The average rating for each driver
## - Which driver made the most money?
## - Which driver has the highest average rating?
## You may create and/or use as many variables, loops, and methods as you need.

def overview(array, key, overall)
  array.each do |driver|
    driver.map do |k, v|
      avg = v.map {|trip| trip[key].to_f}.reduce(0, :+)
      
      if key == :rating
        avg = (avg / (v.length - 2)).round(1)
      elsif key == :cost
        avg = '%.2f' % avg
      end

      driver[k] << {overall => avg}
    end
  end
end

all_drivers_all_trips.each do |driver|
  driver.each do |key, trips|
    num_trips = trips.length
  
    driver[key] << {:total_trips => num_trips}
  end
end

overview(all_drivers_all_trips, :cost, :total_earn)
overview(all_drivers_all_trips, :rating, :avg_rating)

total_earns_array = []
avg_ratings_array = []

#Display information
all_drivers_all_trips.each do |driver|
  driver.each do |k, v|
    puts "Driver ##{k}" 
    puts "     Total Rides - #{v[-3][:total_trips]}"
    puts "     Total Earnings - $#{v[-2][:total_earn]}"
    puts "     Average Rating - #{v[-1][:avg_rating]}⭐"
    puts "\n"

    total_earns_array << v[-2][:total_earn]
    avg_ratings_array << v[-1][:avg_rating]
  end
end

all_drivers_all_trips.each do |driver|
  driver.each do |k, v|
    if v[-2][:total_earn] == total_earns_array.max
      puts "Driver #{k} earned the most."
    end

    if v[-1][:avg_rating] == avg_ratings_array.max
      puts "Driver #{k} had the highest rating."
    end
  end
end
