# The program rideshare.rb processes and prints statistics on the 
# drivers and their rides listed in rides.txt

# Data structure stores all the trips listed in rides.txt
all_trips = {
  DROOO1: [
    {
      date: "3rd Feb 2016",
      cost: 10,
      rider: :RD0003,
      rating: 3
    },
    {
      date: "3rd Feb 2016",
      cost: 30,
      rider: :RD0015,
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 45,
      rider: :RD0003,
      rating: 2
    }
  ],
  DR0002: [
    {
      date: "3rd Feb 2016",
      cost: 25,
      rider: :RD0073,
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 15,
      rider: :RD0013,
      rating: 1
    },
    {
      date: "5th Feb 2016",
      cost: 35,
      rider: :RD0066,
      rating: 3
    }
  ],
  DR0003: [
    {
      date: "4th Feb 2016",
      cost: 5,
      rider: :RD0066,
      rating: 5
    },
    {
      date: "5th Feb 2016",
      cost: 50,
      rider: :RD0003,
      rating: 2
    }
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider: :RD0022,
      rating: 5 
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider: :RD0022,
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider: :RD0073,
      rating: 5
    }
  ]
}

# given an array of hashes, the method returns that array's length.
def get_num_rides(rides)
  return rides.length
end

# given an array of hashes, the method get_income grabs the cost of each 
# ride and adds it to the returned value, income. 
def get_income(rides)
  income = 0
  rides.each do |ride|
    income += ride[:cost]
  end
  return income
end

# given an array of hashes, the method get_avg_rating iterates over rides
# and totals all the ratings. The method returns the average rating for 
# the inputed driver's rides.
# calls get_num_rides
def get_avg_rating(rides)
  total_rating = 0
  rides.each do |ride|
    total_rating += ride[:rating]
  end
  return total_rating.to_f / get_num_rides(rides)
end

# given an umbrella hash filled with an array of hashes, the method 
# get_best_rated loops though each driver and compares averages.
# calls get_avg, returns the best rated driver in ID form
def get_best_rated(drivers)
  best_rated = nil
  best_avg = 0
  drivers.each do |driver, rides|
    current_avg = get_avg_rating(rides)
    if best_avg < current_avg
      best_rated = driver
      best_avg = current_avg
    end
  end
  return best_rated
end

# given an umbrella hash filled with an array of hashes, the method
# get_highest_paid loops though each driver and compares incomes.
# calls get_income, returns the highest paid driver in ID form
def get_highest_paid(drivers)
  highest_paid = nil
  highest_income = 0
  drivers.each do |driver, rides| 
    current_income = get_income(rides)
    if highest_income < current_income
      highest_income = current_income
      highest_paid = driver
    end
  end
  return highest_paid
end

# Main Program, prints all info
all_trips.each do |driver, trips|
  puts "\n#{driver}'s number of trips: #{get_num_rides(trips)}"
  puts "#{driver}'s total income: #{get_income(trips)}"
  puts "#{driver}'s average rating: #{format("%.2f", get_avg_rating(trips))}"
end
puts "\nThe best-rated driver is #{get_best_rated(all_trips)}"
puts "The highest-paid driver is #{get_highest_paid(all_trips)}"