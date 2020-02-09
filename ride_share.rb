DRIVERS_INFO = [
  {
    driver_id: "DR0001",
    ride_info: [
      {
        ride_date: "3rd Feb 2016",
        ride_cost: 10,
        rider_id: "RD0003",
        rating: 3,
      },
      {
        ride_date: "3rd Feb 2016",
        ride_cost: 30,
        rider_id: "RD0015",
        rating: 4,
      },
      {
        ride_date: "5th Feb 2016",
        ride_cost: 45,
        rider_id: "RD0003",
        rating: 2,
      },
    ],
  },

  {
    driver_id: "DR0002",
    ride_info: [
      {
        ride_date: "3rd Feb 2016",
        ride_cost: 25,
        rider_id: "RD0073",
        rating: 5,
      },
      {
        ride_date: "4th Feb 2016",
        ride_cost: 15,
        rider_id: "RD0013",
        rating: 1,
      },
      {
        ride_date: "5th Feb 2016",
        ride_cost: 35,
        rider_id: "RD0066",
        rating: 3,
      },
    ],
  },

  {
    driver_id: "DR0003",
    ride_info: [
      {
        ride_date: "4th Feb 2016",
        ride_cost: 5,
        rider_id: "RD0066",
        rating: 5,
      },
      {
        ride_date: "5th Feb 2016",
        ride_cost: 50,
        rider_id: "RD0003",
        rating: 2,
      },
    ],
  },

  {
    driver_id: "DR0004",
    ride_info: [
      {
        ride_date: "3rd Feb 2016",
        ride_cost: 5,
        rider_id: "RD0022",
        rating: 5,
      },
      {
        ride_date: "4th Feb 2016",
        ride_cost: 10,
        rider_id: "RD0022",
        rating: 4,
      },
      {
        ride_date: "5th Feb 2016",
        ride_cost: 20,
        rider_id: "RD0073",
        rating: 5,
      },
    ],
  },
]

# 1. Calculates the number of rides each driver has given
def output_number_of_rides_per_driver(list_of_drivers = DRIVERS_INFO)
  list_of_drivers.each do |driver|
    puts "Driver #{driver[:driver_id]} has given #{driver[:ride_info].length} rides."
  end
end

# 2. Calculates the total amount of money each driver has made
def calculate_total_earnings_per_driver(list_of_drivers = DRIVERS_INFO)
  total_earnings_per_driver = list_of_drivers.map do |driver|
    current_driver = {}
    current_driver[:driver_id] = driver[:driver_id]

    driver_earned = driver[:ride_info].reduce(0) do |sum, current_ride|
      sum + current_ride[:ride_cost]
    end

    current_driver[:driver_earned] = driver_earned

    puts "Driver #{current_driver[:driver_id]} has earned $#{current_driver[:driver_earned]}."

    current_driver
  end

  return total_earnings_per_driver
end

# 3. Calculates the average rating for each driver
def calculate_average_rating_per_driver(list_of_drivers = DRIVERS_INFO)

  average_ratings = list_of_drivers.map do |driver|
    current_driver = {}
    current_driver[:driver_id] = driver[:driver_id]

    driver_total_rating = driver[:ride_info].reduce(0) do |sum, current_ride|
      sum + current_ride[:rating]
    end
    
    average_rating = (driver_total_rating.to_f / driver[:ride_info].length).round(2)

    current_driver[:average_rating] = average_rating

    puts "Driver #{driver[:driver_id]} has an average rating of #{average_rating}."

    current_driver
  end

  return average_ratings
end

# 4. Finds and outputs the driver who made the most money
def output_driver_with_most_money(earned_per_each_driver)
  max_earned = earned_per_each_driver.max_by do |current_driver|
    current_driver[:driver_earned]
  end

  puts "\nDriver #{max_earned[:driver_id]} earned the most money $#{max_earned[:driver_earned]}."
end

# 5. Finds and outputs the driver with the highest average rating
def output_highest_average_rating(list_of_average_ratings)
  highest = list_of_average_ratings.max_by do |rating|
    rating[:average_rating]
  end

  puts "\nDriver with the highest average rating is #{highest[:driver_id]}."
end

# 6. Outputs the max profitable date for each driver
def output_max_profit_dates(list_of_drivers = DRIVERS_INFO)
  max_profit_dates = list_of_drivers.map do |driver|
    day_max_profit = driver[:ride_info].max_by do |current_ride|
      current_ride[:ride_cost]
    end
  
    current_driver = {}
    current_driver[:driver_id] = driver[:driver_id]
    current_driver[:profitable_date] = day_max_profit[:ride_date]
    
    puts "Driver #{current_driver[:driver_id]} made the most money on #{current_driver[:profitable_date]}."

    current_driver
  end

  return max_profit_dates
end

output_number_of_rides_per_driver()
earned_per_driver = calculate_total_earnings_per_driver()
average_rating_per_driver = calculate_average_rating_per_driver()
output_driver_with_most_money(earned_per_driver)
output_highest_average_rating(average_rating_per_driver)
output_max_profit_dates()
