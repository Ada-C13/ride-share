rides = {
  DR0001: {
    RD003: [
      {
        cost: 10,
        rating: 3,
        date: {day: 3, month: "Feb", year: 2016
      }
      },
      {
        cost: 45,
        rating: 2,
        date: {
          day: 5, month: "Feb", year: 2016
        }
      }
    ],
    RD0015: [
      {
        cost: 30,
        rating: 4,
        date: {
          day: 3, month: "Feb", year: 2016
        }
      }
    ],
  },
  DR0002: {
    RD0073: [
      {
        cost: 25,
        rating: 5,
        date: {
          day: 3, month: "Feb", year: 2016
        }
      }
    ],
    RD0013: [
      {
        cost: 15,
        rating: 1,
        date: {
          day: 4, month: "Feb", year: 2016
        }
      }
    ],
    RD0066: [
      {
        cost: 35,
        rating: 3,
        date: {
          day: 5, month: "Feb", year: 2016
        }
      }
    ]
  },
  DR0003: {
    RD0003: [
      {
        cost: 50,
        rating: 2,
        date: {
          day: 5, month: "Feb", year: 2016
        }
      }
    ],
    RD0066: [
      {
        cost: 5,
        rating: 5,
        date: {
          day: 4, month: "Feb", year: 2016
        }
      }
    ]
  },
  DR0004: {
    RD0022: [
      {
        cost: 5,
        rating: 5,
        date: {
          day: 3, month: "Feb", year: 2016
        }
      },
      {
        cost: 10,
        rating: 4,
        date: {
          day: 4, month: "Feb", year: 2016
        }
      }
    ],
    RD0073: [
      {
        cost: 20,
        rating: 5,
        date: {
          day: 5, month: "Feb", year: 2016
        }
      }
    ]
  }
}

def num_rides(rides_hash)
  driver_trips = {}
  rides_hash.each do |driverid, riders|
    riders.each do |riderid, trips|
      if driver_trips.has_key?(driverid)
        driver_trips[driverid] += trips.length
      else
        driver_trips[driverid] = trips.length
      end
    end
  end
  return driver_trips
end

def total_revenue(rides_hash)
  driver_revenue = {}
  rides_hash.each do |driverid, riders|
    riders.each do |riderid, trips|
      trips.each do |trip|
        if driver_revenue.has_key?(driverid)
          driver_revenue[driverid] += trip[:cost]
        else
          driver_revenue[driverid] = trip[:cost]
        end
      end
    end
  end
  return driver_revenue
end

def average_rating(rides_hash)
  driver_rating = {}
  i = 0
  ratings = []
  rides_hash.each do |driverid, riders|
    riders.each do |riderid, trips|
      trips.each do |trip|
        if ratings[i].nil?
          ratings.push([trip[:rating]])
        else
          ratings[i].push(trip[:rating])
        end
      end
    end
    driver_rating[driverid] = (ratings[i].sum.to_f / ratings[i].length).round(2)
    i += 1
  end
  return driver_rating
end

def most_revenue(rides)
  driver_revenue = total_revenue(rides)
  revenue_nums = []
  top_driver = {}
  driver_revenue.each do |driver, revenue|
    revenue_nums << revenue
  end
  revenue_nums.sort
  driver_revenue.each do |driver, revenue|
    if revenue == revenue_nums[0]
      top_driver[driver] = revenue
    end
  end
  return top_driver
end

def highest_rating(rides)
  driver_rating = average_rating(rides)
  rating_nums = []
  top_rating = {}
  driver_rating.each do |driver, rating|
    rating_nums << rating
  end
  rating_nums.sort
  driver_rating.each do |driver, rating|
    if rating == rating_nums.last
      top_rating[driver] = rating
    end
  end
  return top_rating
end

driver_rides = num_rides(rides)
driver_revenue = total_revenue(rides)
driver_rating = average_rating(rides)
top_grossing = most_revenue(rides)
top_rated = highest_rating(rides)

puts driver_rides
puts driver_revenue
puts driver_rating
puts top_grossing
puts top_rated
