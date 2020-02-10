drivers = {
  DR0001: [
    {
      date: "3rd Feb 2016" ,
      cost: 10,
      rider_id: "RD0003" ,
      rating: 3
    },
    {
      date: "3rd Feb 2016" ,
      cost: 30,
      rider_id: "RD0015" ,
      rating: 4
    },
    {
      date: "5th Feb 2016" ,
      cost: 45,
      rider_id: "RD0003" ,
      rating: 2
    },
  ],
  DR0002: [
    {
      date: "3rd Feb 2016" ,
      cost: 25,
      rider_id: "RD0073" ,
      rating: 5
    },
    {
      date: "4th Feb 2016" ,
      cost: 15,
      rider_id: "RD0013" ,
      rating: 1
    },
    {
      date: "5th Feb 2016" ,
      cost: 35,
      rider_id: "RD0066" ,
      rating: 3
    },
  ],
  DR0003: [
    {
      date: "4th Feb 2016" ,
      cost: 5,
      rider_id: "RD0066" ,
      rating: 5
    },
    {
      date: "5th Feb 2016" ,
      cost: 50,
      rider_id: "RD0003" ,
      rating: 2
    },
  ],
  DR0004: [
    {
      date: "3rd Feb 2016",
      cost: 5,
      rider_id: "RD0022",
      rating: 5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      rider_id: "RD0022",
      rating: 4
    },
    {
      date: "5th Feb 2016",
      cost: 20,
      rider_id: "RD0073",
      rating: 5
    }
  ],
}     

def calculate_total_earning(rides)
  total = 0
  rides.each do |ride|
    total += ride[:cost]
  end
  return total
end

def calculate_average_rating_each(rides)
  total_rating = 0
  rides.each do |ride|
    total_rating += ride[:rating]
  end
  return (total_rating/rides.length.to_f).round(2)
end

highest_earning_driver = []
highest_average_rating = []
drivers.keys.each do |driver_id|
 total_ridecount = drivers[driver_id].length
 total_earning_each = calculate_total_earning(drivers[driver_id])
 average_rating_each = calculate_average_rating_each(drivers[driver_id])
 # determine driver with highest earning
 if highest_earning_driver[0] 
  if total_earning_each > highest_earning_driver[1].to_i
    highest_earning_driver = [driver_id, total_earning_each]
  end
 else highest_earning_driver = [driver_id, total_earning_each]
 end
 # determine driver with highest average rating
 if highest_average_rating[0] 
  if average_rating_each > highest_average_rating[1].to_i
    highest_average_rating = [driver_id, average_rating_each]
  end
 else highest_average_rating = [driver_id, average_rating_each]
 end
 puts "#{driver_id} earned $#{total_earning_each} with an average rating of #{average_rating_each} in #{total_ridecount} rides"
end


puts "Driver #{highest_earning_driver[0]} earned the most money with a total earning of $#{highest_earning_driver[1]}"
puts "Driver #{highest_average_rating[0]} has the highest average rating of #{highest_average_rating[1]}"

