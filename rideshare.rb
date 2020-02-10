# RIDESHARE
# Calculates statistics of rideshare data.

drivers = {
  DR0001: [
    {
      "3rd Feb 2016": [
        {
          cost: 10,
          rider_id: "RD0003",
          rating: 3,
        },
        {
          cost: 30,
          rider_id: "RD0015",
          rating: 4,
        },
      ],
    },
    {
      "5th Feb 2016": [
        {
          cost: 45,
          rider_id: "RD0003",
          rating: 2,
        },
      ],
    },
  ],
  DR0002: [
    {
      "3rd Feb 2016": [
        {
          cost: 25,
          rider_id: "RD0073",
          rating: 5,
        },
      ],
    },
    {
      "4th Feb 2016": [
        {
          cost: 15,
          rider_id: "RD0013",
          rating: 1,
        },
      ],
    },
    {
      "5th Feb 2016": [
        {
          cost: 35,
          rider_id: "RD0066",
          rating: 3,
        },
      ],
    },
  ],
  DR0003: [
    {
      "4th Feb 2016": [
        {
          cost: 5,
          rider_id: "RD0066",
          rating: 5,
        },
      ],
    },
    {
      "5th Feb 2016": [
        {
          cost: 50,
          rider_id: "RD0003",
          rating: 2,
        },
      ],
    },
  ],
  DR0004: [
    {
      "3rd Feb 2016": [
        {
          cost: 5,
          rider_id: "RD0022",
          rating: 5
        },
      ],
    },
    {
      "4th Feb 2016": [
        {
          cost: 10,
          rider_id: "RD0022",
          rating: 4
        },
      ],
    },
    {
      "5th Feb 2016": [
        {
          cost: 20,
          rider_id: "RD0073",
          rating: 5,
        },
      ],
    },
  ],
}

highest_earner = {
  driver: "",
  amount_earned: 0,
}

highest_rated = {
  driver: "",
  rating: 0,
}

puts "STATS PER DRIVER\n**********\n\n"
drivers.each do | driver, workdays |
  puts "#{driver} stats:"

  # The number of rides each driver has given
  ride_count = workdays.sum { |dates, rides| dates.sum { | date, rides | rides.count } }
  puts "Number of rides given: #{ride_count}"

  # The total amount of money each driver has made
  money_earned = workdays.sum { |dates, rides| dates.sum { | date, rides | rides.sum { |ride| ride[:cost] } } }
  puts "Total earned: $#{money_earned}"
  if money_earned > highest_earner[:amount_earned]
    highest_earner[:driver] = driver
    highest_earner[:amount_earned] = money_earned
  end

  # Average rating 
  total_ratings = workdays.sum { |dates, rides| dates.sum { | date, rides | rides.sum { |ride| ride[:rating] } } }
  average_rating = (total_ratings.to_f/ride_count.to_f).round(2)
  puts "Average rating: #{average_rating}"
  if average_rating > highest_rated[:rating]
    highest_rated[:driver] = driver
    highest_rated[:rating] = average_rating
  end
  puts "\n"
end

# Which driver made the most money?
puts "\nHighest earner: #{highest_earner[:driver]}"

# Which driver has the highest average rating?
puts "Highest rated: #{highest_rated[:driver]}"
