rides = {
  DR0004: {
    dates: ["3rd Feb 2016","4th Feb 2016", "5th Feb 2016"],
    costs: [5, 10, 20],
    rider_ids: ["RD0022", "RD0022", "RD0073"],
    ratings: [5, 4, 5]
    },
  DR0003: { 
    dates: ["4th Feb 2016", "5th Feb 2016"],
    costs: [5, 50],
    rider_ids: ["RD0066", "RD0003"],
    ratings: [5, 2]
    },
  DR0002: {
    dates: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"],
    costs: [25, 15, 35],
    rider_ids: ["RD0073", "RD0013", "RD0066"],
    ratings: [5, 1, 3]
    }, 
  DR0001:{
    dates: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"],
    costs: [10, 30, 45],
    rider_ids: ["RD0003", "RD0015", "RD0003"],
    ratings: [3, 4, 2]
    } 
}

def stats(hash, driver_id)
  amount_made = 0
  sum_rating = 0
  number_rides = hash[:dates].length 
  
  hash[:costs].each do |i|
    amount_made = amount_made + i
  end
  
  hash[:ratings].each do |i|
      sum_rating = sum_rating + i
  end

  puts driver_id.to_s + ":"
  puts "Number of rides: #{number_rides}"
  puts "Amount made: $#{amount_made}"
  puts "Average rating: #{sum_rating.to_f/number_rides}"
  puts "--------------------"
  return {"id" => driver_id, "money" => amount_made, "avg_rating" => sum_rating.to_f/number_rides}
end
#takes in array of drivers with info stored in hashes and type of thing you are calculating for max
def most(array_of_hashes, type)
  max = array_of_hashes.max_by do |h| 
  h["#{type}"] 
  end
  return max["id"]
end

hashes = [stats(rides[:DR0004], "DR0004"), stats(rides[:DR0003], "DR0003"), stats(rides[:DR0002], "DR0002"), stats(rides[:DR0001], "DR0001")]

puts "#{most(hashes, "money")} made the most money $$$"
puts "#{most(hashes, "avg_rating")} has the highest average rating :-)"
puts "--------------------"

