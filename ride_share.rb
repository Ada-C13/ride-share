# This is a hash of arrays and the arrays cont contains hashes
drivers = {

  DR0001: [

    {
      date: '3rd Feb 2016',    
      cost: 10,
      rider_id: 'RD0003',
      rating: 3
    },
    {
      date: '3rd Feb 2016',
      cost: 30,
      rider_id: 'RD0015',
      rating: 4
    },
    {
      date: '5th Feb 2016',
      cost: 45,
      rider_id: 'RD0003',
      rating: 2
    }
  ],

  DR0002: [

    {
      date: '3rd Feb 2016',
      cost: 25,
      rider_id: 'RD0073',
      rating: 5 
    },
    {
      date: '4th Feb 2016',
      cost: 15,
      rider_id: 'RD0013',
      rating: 1
    },
    {
    date: '5th Feb 2016',
    cost: 35,
    rider_id: 'RD0066',
    rating: 3
    } 
  ],

  DR0003: [

    {
      date: '4th Feb 2016',
      cost: 5,
      rider_id: 'RD0066',
      rating: 5
    },
    {
      date: '5th Feb 2016',
      cost: 50,
      rider_id: 'RD0003',
      rating: 2
    }
  ],

  DR0004: [

    {
      date: '3rd Feb 2016',
      cost: 5,
      rider_id: 'RD0022',
      rating: 5
    },
    {
      date: '4th Feb 2016',
      cost: 10,
      rider_id: 'RD0022',
      rating: 4
    },
    {
      date: '5th Feb 2016',
      cost: 20,
      rider_id: 'RD0073',
      rating: 5
    }
  ]
}
# ####################################################################

# # This method calculates the number of rides each driver has given.
puts "This is how many rides each driver has given."
def driver_info(drivers)
  drivers.each do |key, value|
     ride_count = drivers[key].length
     puts special_string = "This driver:#{key} has given a total of #{value.length} rides. "
  end
end

 driver_info(drivers)

# # #########################################################################

# # The total amount of money each driver has made!
puts "This is how much money each driver has made!"

def sum_drivers_income(drivers)

  driver_earnings = {}

  drivers.each do |driver_id, rides|
    total_money = rides.sum do |ride|
      ride[:cost]
    end
  driver_earnings[driver_id] = total_money
  end

  return driver_earnings

end

total_income_for_each_driver = sum_drivers_income(drivers)
total_income_for_each_driver.each do |driver, income|
puts "This driver: #{driver} made this much money: $#{income}"
end

#   #########################################################

# # This driver made the most money!
def highest_income(drivers)

each_money = sum_drivers_income(drivers)
most_made = each_money.max_by { |driver, earnings| earnings }[0]
puts "This driver: #{most_made} made the MOST money!"

end

highest_income(drivers)

# # ##########################################################

# # Which driver has the highest average rating?

def highest_avg_rating(drivers)

  avg_ratings_each_driver = {}

  drivers.each do |driver_id, rides|
    sum_of_ratings = rides.sum do |ride|
      ride[:rating]
    end
    avg_ratings_each_driver[driver_id] = sum_of_ratings / rides.length
  end

  return avg_ratings_each_driver.max_by do |driver, rating|
    rating
    end
  end

highest_rated =  [highest_avg_rating(drivers)].to_h
highest_rated.each do |driver, rating|
puts "The highest average rating of: #{rating} belongs to this driver: #{driver}!"
end
