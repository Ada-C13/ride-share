drivers = [
  {
    driver_id: "DR0004",
    driver_trips: [ 
      {
        rider_id: "RD0022",
        date: "3rd Feb 2016",
        cost: 5,
        rating: 5
      },
      {
        rider_id: "RD0022",
        date: "4th Feb 2016",
        cost: 10,
        rating: 4
      },
      {
        rider_id: "RD0073",
        date: "5th Feb 2016",
        cost: 20,
        rating: 5
      }
    ]
  },
  {
    driver_id: "DR0001",
    driver_trips: [ 
      {
        rider_id: "RD0003",
        date: "3rd Feb 2016",
        cost: 10,
        rating: 3
      },
      {
        rider_id: "RD0015",
        date: "3rd Feb 2016",
        cost: 30,
        rating: 4
      },
      {
        rider_id: "RD0003",
        date: "5th Feb 2016",
        cost: 45,
        rating: 2
      }
    ]
  },
  {
    driver_id: "DR0002",
    driver_trips: [ 
      {
        rider_id: "RD0073",
        date: "3rd Feb 2016",
        cost: 25,
        rating: 5
      },
      {
        rider_id: "RD0013",
        date: "4th Feb 2016",
        cost: 15,
        rating: 1
      },
      {
        rider_id: "RD0066",
        date: "5th Feb 2016",
        cost: 35,
        rating: 3
      }
    ]
  },
  {
    driver_id: "DR0003",
    driver_trips: [ 
      {
        rider_id: "RD0066",
        date: "4th Feb 2016",
        cost: 5,
        rating: 5
      },
      {
        rider_id: "RD0003",
        date: "5th Feb 2016",
        cost: 50,
        rating: 2
      }
    ]
  }
]

# Method that calculates day of highest earnings for each driver
def makeItRainDay(driver)

  trip_dates = {}

  driver[:driver_trips].each do |ride|
    date = ride[:date]
    if trip_dates.key?(date)
      trip_dates[date] += ride[:cost]
    else 
      trip_dates[date] = ride[:cost]
    end
  end

  max_earnings = 0
  max_earnings_dates = []

  trip_dates.each do |date, earnings|
    if earnings > max_earnings
      max_earnings = earnings
      max_earnings_dates = [date]
    elsif earnings == max_earnings
      max_earnings_dates << date
    end
  end

  return max_earnings_dates
end

highest_earnings = 0
highest_earner = ""
top_rating = 0
top_rated_driver = ""

drivers.each do |driver|

  driver_earnings = 0
  driver_rating = 0

  driver[:driver_trips].each do |ride|
    driver_earnings += ride[:cost]
    driver_rating += ride[:rating].to_f
  end

  if driver_earnings > highest_earnings
    highest_earnings = driver_earnings
    highest_earner = driver[:driver_id]
  end

  driver_rating = driver_rating / driver[:driver_trips].length

  if driver_rating > top_rating
    top_rating = driver_rating
    top_rated_driver = driver[:driver_id]
  end

  puts "--------------"
  puts "Driver #{driver[:driver_id]} drove #{driver[:driver_trips].length} trips."
  puts "Average rating: #{sprintf '%.1f', driver_rating}"
  puts "Total earnings: $#{driver_earnings}"
  print "Earned the most money on "
  for item in makeItRainDay(driver)
    print "#{item}; "
  end
  puts
end

puts
puts "SUMMARY:"
puts "Driver #{highest_earner} was the highest-earning driver (earning $#{highest_earnings})."
puts "Driver #{top_rated_driver} had the highest average rating (#{sprintf '%.1f', top_rating})."