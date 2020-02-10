rides = {
  DR0001: [
    {date: "3rd Feb 2016", cost: 10, rider_id: "RD0003", rating: 3},
    {date: "3rd Feb 2016", cost: 30, rider_id: "RD0015", rating: 4},
    {date: "5th Feb 2016", cost: 45, rider_id: "RD0003",rating: 2}
  ],

  DR0002: [
    {date: "3rd Feb 2016", cost: 25, rider_id: "RD0073", rating: 5},
    {date: "4th Feb 2016", cost: 15, rider_id: "RD0013", rating: 1},
    {date: "5th Feb 2016",cost: 35, rider_id: "RD0066", rating: 3}
  ],

  DR0003: [
    {date: "4th Feb 2016", cost: 5, rider_id: "RD0066", rating: 5},
    {date: "5th Feb 2016", cost: 50, rider_id: "RD0003", rating: 2}
  ],

  DR0004: [
    {date: "3rd Feb 2016", cost: 5, rider_id: "RD0022", rating: 5},
    {date: "4th Feb 2016", cost: 10, rider_id: "RD0022", rating: 4},
    {date: "5th Feb 2016", cost: 20, rider_id: "RD0073", rating: 5}
  ]
}

total_money = {}
average_rating = {}
rides.each do |driver, rides|
  puts "Driver #{driver} had a total of #{rides.length} rides."
    total_money[driver] = rides.sum { |each_ride| each_ride[:cost] }
    all_ratings = rides.sum { |each_ride| each_ride[:rating] }
    average_rating[driver] = all_ratings/rides.length.to_f
  puts "They earned $#{'%.2f' %total_money[driver]} and had an average rating of #{'%.1f' %average_rating[driver]}"
  puts
end

highest_earner = total_money.max_by(&:last).first

highest_rated = average_rating.max_by(&:last).first

puts "Driver #{highest_earner} was the highest earner, and driver #{highest_rated} was the best rated."
