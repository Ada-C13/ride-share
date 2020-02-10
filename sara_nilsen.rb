uber_data = 
{  
    "DR0001": [
    
    { 
      rider_id: "RD0003", 
      date_ride: "3rd Feb 2016",
      cost: 10,
      rating: 3
    },
    { 
      rider_id: "RD0015",
      date_ride: "3rd Feb 2016",
      cost: 30,
      rating:  4
    },
    { 
      rider_id: "RD0003",
      date_ride: "5th Feb 2016",
      cost: 45,
      rating: 2
    }
  ],
  
  "DR0002": [

    {
      rider_id: "RD0073",
      date_ride: "3rd Feb 2016",
      cost: 25,
      rating: 5
    },
    { 
      rider_id: "RD0013",
      date_ride: "4th Feb 2016",
      cost: 15,
      rating: 1
    },
    {
      rider_id: "RD0066",
      date_ride: "5th Feb 2016",
      cost: 35,
      rating: 3
    }
  ], 

    "DR0003":
    [
    {
      rider_id: "RD0066",
      date_ride: "4th Feb 2016",
      cost: 5,
      rating: 5
    },
    {
      rider_id: "RD0003",
      date_ride: "5th Feb 2016",
      cost: 50,
      rating: 2
    }
  ],

    "DR0004": [
    {
      rider_id: "RD0022",
      date_ride: "3rd Feb 2016",
      cost: 5,
      rating: 5
    },
    {
      rider_id: "RD0022",
      date_ride: "4th Feb 2016",
      cost: 10,
      rating: 4
    },
    {
      rider_id: "RD0073",
      date_ride: "5th Feb 2016",
      cost: 20,
      rating: 5 
    }
  ]
}

def get_total_money(ride_data)
  t_money_made = 0
  ride_data.each do |info|
    t_money_made += info[:cost]
  end 
  return t_money_made 
end 


def get_rating_average(ride_data)
  total_rate = 0.0 
  rate_info = ride_data.map do |info|
    total_rate += info[:rating]
  end 
  return total_rate / rate_info.length   
end 

puts "Driver amount of rides"
uber_data.each do |driver, info|
  puts "Driver #{driver}: #{info.length} rides."
end  
puts ""
most_money = 0 
driver_most_money = ""
puts "Total amount earned by each driver"
uber_data.each do |driver, info|
  total_money = get_total_money(info)
  puts "Driver #{driver}: $#{total_money}"
  if total_money > most_money
    most_money = total_money
    driver_most_money = driver 
  end 
end 
puts ""
most_average = 0
driver_most_average = ""
uber_data.each do |driver, info|
  rating_average = get_rating_average(info)
  puts "The average rating of Driver #{driver} %0.2f" %[rating_average]
  if rating_average > most_average
    most_average = rating_average
    driver_most_average = driver
  end 
end 
puts ""
puts "The driver who made the most money: #{driver_most_money}."
puts "The driver with the highest rating #{driver_most_average}."
