drivers = [
  {
    id: "DR0001",
    rides: [
      {
        date: "3rd Feb 2016",
        rider_id: "RD0003",
        cost: 10,
        rate: 3,
      },
      {
        date: "3rd Feb 2016",
        rider_id: "RD0015",
        cost: 30,
        rate: 4,
      },
      {
        date: "5th Feb 2016",
        rider_id: "RD0003",
        cost: 45,
        rate: 2,
      },
    ],
  },
  {
    id: "DR0002",
    rides: [
      {
        date: "3rd Feb 2016",
        rider_id: "RD0073",
        cost: 25,
        rate: 5,

      },
      {
        date: "4th Feb 2016",
        rider_id: "RD0013",
        cost: 15,
        rate: 1,
      },
      {
        date: "5th Feb 2016",
        rider_id: "RD0066",
        cost: 35,
        rate: 3,

      },
    ],
  },
  {
    id: "DR0003",
    rides: [
      {
        date: "4th Feb 2016",
        rider_id: "RD0066",
        cost: 5,
        rate: 5,
      },
      {
        date: "5th Feb 2016",
        rider_id: "RD0003",
        cost: 50,
        rate: 2,
      },
    ],
  },
  {
    id: "DR0004",
    rides: [
      {
        date: "3rd Feb 2016",
        rider_id: "RD0022",
        cost: 5,
        rate: 5,
      },
      {
        date: "4th Feb 2016",
        rider_id: "RD0022",
        cost: 10,
        rate: 4,
      },
      {
        date: "5th Feb 2016",
        rider_id: "RD0073",
        cost: 20,
        rate: 5,
      },
    ],
  },
]

# 1 The number of rides each driver has given
def total_rides(drivers)
  drivers.each do |driver|
    rides = driver[:rides].length
    puts "Driver ID:#{driver[:id]} has given #{rides} rides."
  end
end

# 2 The total amount of money each driver has made
def total_money_made(drivers)
  drivers.each do |driver|
    total_cost = 0
    driver[:rides].each do |ride_info|
      total_cost += ride_info[:cost]
    end
    puts "The total amount of money driver ID:#{driver[:id]} has made is $#{total_cost}."
  end
end

# 3 The average rating for each driver
def average_rating(drivers)
  drivers.each do |driver|
    total_rating = 0
    driver[:rides].each do |ride_info|
      total_rating += ride_info[:rate]
    end
    average = (total_rating / driver[:rides].length)
    puts "The average rating for driver ID: #{driver[:id]} is #{average}."
  end
end

# 4 Which driver made the most money?
def highest_money(drivers)
  driver_profits = drivers.map do |driver|
    total_earning = driver[:rides].sum do |ride|
      ride[:cost]
    end
    {
      id: driver[:id],
      profits: total_earning,
    }
  end

  result = driver_profits.max_by do |driver|
    driver[:profits]
  end
  return "Driver ID: #{result[:id]}, has the highest earning of $#{result[:profits]}."

  #   puts "#{driver_profits}"
  #   return ""
  #   most_profitable = nil
  #   most_profits = 0
  #   drivers.each do |driver|
  #     total_earning = 0
  #     driver[:rides].each do |ride_info|
  #       total_earning += ride_info[:cost]
  #     end

  #     if total_earning > most_profits
  #       most_profits = total_earning
  #       most_profitable = driver[:id]
  #     end
  #   end
  # return "Driver ID: #{most_profitable}, has earned the highest money of $#{most_profits}."
end

# 5 Which driver has the highest average rating?
def highest_average_score(drivers)
  driver_rating = drivers.map do |driver|
    total_rating = driver[:rides].sum do |ride|
      ride[:rate]
    end
    {
      id: driver[:id],
      average_rating: total_rating / driver[:rides].length,
    }
  end

  result = driver_rating.max_by do |driver|
    driver[:average_rating]
  end
  return "Driver ID: #{result[:id]} has the highest average rating of #{result[:average_rating]}."

  #   highest_average_driver = nil
  #   highest_rating = 0
  #   drivers.each do |driver|
  #     total_rating = 0
  #     driver[:rides].each do |ride_info|
  #       total_rating += ride_info[:rate]
  #     end
  #     total_rating /= driver[:rides].length
  #     if total_rating > highest_rating
  #       highest_rating = total_rating
  #       highest_average_driver = driver[:id]
  #     end
  #   end
  #   return "Driver ID: #{highest_average_driver} has the highest average rating is #{highest_rating}."
end

# #on what day, does the driver makes the most amount of money
def most_money_date(drivers)
  date_and_cost = {}
  drivers.each do |driver|
    id = driver[:id]
    date_and_cost[id] = {}
    driver[:rides].each do |ride|
      # Date of the current ride
      date = ride[:date]
      # Does the current date exist in the hash
      if date_and_cost[id][date] != nil
        # If so, add the current cost to the stored cost, and store it back into the map
        date_and_cost[id][date] += ride[:cost]
      else
        date_and_cost[id][date] = ride[:cost]
      end
    end
    most_money = date_and_cost[id].max_by do |date, money|
      money
    end
    driver_and_money = {
      id: id,
      most_money: most_money[1],
      date: most_money[0],
    }
    puts "Driver ID:#{driver_and_money[:id]}, made the most money of $#{driver_and_money[:most_money]} on #{driver_and_money[:date]}."
  end
end

total_rides(drivers)
puts " "

total_money_made(drivers)
puts " "

average_rating(drivers)
puts " "

puts highest_money(drivers)
puts " "

puts highest_average_score(drivers)
puts " "

most_money_date(drivers)
