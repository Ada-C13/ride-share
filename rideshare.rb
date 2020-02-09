drivers = {
  dr0001: [
    {
      date: "03.02.2016",
      rating:  3,
      cost: 10,
      rider: "RD0003"
    },
   {
      date:  "03.02.2016",
      rating:  4,
      cost:  30,
      rider:  "RD0015"
   },
   {
     date: "05.02.2016",
     rating: 2,
     cost: 45,
     rider: "RD0003"
    }
  ],

  dr0002:[
    {
      date: "03.02.2016",
      rating: 5,
      cost: 25,
      rider: "RD0073"
    },
    {
      date: "04.02.2016",
      rating: 1,
      cost: 15,
      rider: "RD0013"
    },
    {
      date: "05.02.2016",
      rating: 3,
      cost: 35,
      rider: "RD0066"
    }
  ],

  dr0003:[
    {
      date: "04.02.2016",
      rating: 5,
      cost: 5,
      rider: "RD0066"
    },
    {
      date: "05.02.2016",
      rating: 2,
      cost: 50,
      rider: "RD0003"
     },
  ],
  dr0004:[
    {
      date: "03.02.2016",
      rating: 5,
      cost: 5,
      rider: "RD0022"
    },
    {
      date: "04.02.2016",
      rating: 4,
      cost: 10,
      rider: "RD0022"
    },
    {
      date: "05.02.2016",
      rating: 5,
      cost: 20,
      rider: "RD0073"
    }
  ]
}

puts "The summary for selected drivers in Seattle is as follows."
puts 

puts "The total number of rides made by each driver:"
total_rides = drivers.each do |driver_id, trips|
  trips.length
  puts "Driver #{driver_id}: #{trips.length}"
end

puts
puts "Total profits made by each driver:"
total_earned = drivers.collect do |id, trips|
  single_driver_sum = 0
  trips.each do |trip|
    single_driver_sum += trip[:cost]
  end
   puts "#{id}: $#{single_driver_sum}"
   {id => single_driver_sum}
end 

most_profitable_driver = total_earned.max_by{|k, v| v}

puts
puts "The most profitable driver was: #{most_profitable_driver.keys[0]}"

puts
puts "Average rating of each driver:"
def find_avg_rating(drivers)
  drivers.collect do |id, trips|
    summed_ratings = 0
    trips.each do |trip|
      summed_ratings += trip[:rating]
    end 
    id_average = summed_ratings / trips.length.to_f
    puts "#{id}: #{id_average.round(2)}"
    {id => id_average.round(2)}
  end
end

best_rated_driver = find_avg_rating(drivers).max_by{|hash| hash.values[0]}
puts
puts "The driver with the best average rating was: #{best_rated_driver.keys[0]}"
puts
