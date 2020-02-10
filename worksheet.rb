# creating Array called drivers, and inside that creating a hash for each driver as a key and the data as value
drivers = 
{
  DR0001: {
		date: ["3rd Feb 2016", "3rd Feb 2016", "5th Feb 2016"], 
		cost: [10, 30, 45], 
		rider_id: ["RD0003", "RD0015", "RD0003"], 
		rating: [3, 4, 2]
},
DR0002: {
		date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"], 
		cost: [25, 15, 35], 
		rider_id: ["RD0073", "RD0013", "RD0066"], 
		rating: [5, 1, 3]
  },
  DR0003: {
		date: ["4th Feb 2016", "5th Feb 2016"], 
		cost: [5, 50], 
		rider_id: ["RD0066", "RD0003", ], 
		rating: [5, 2],
  },
  DR0004: {
		date: ["3rd Feb 2016", "4th Feb 2016", "5th Feb 2016"], 
		cost: [5, 10, 20], 
		rider_id: ["RD0022", "RD0022", "RD0073"], 
		rating: [5, 4, 5]
	}
}
puts drivers

# the number of rides each driver has given
drivers.each do |driver, data|
  puts driver
  puts data[:rating]
  puts "#{driver} made this many rides " + data[:rider_id].length.to_s
end

# - the total amount of money each driver has made
cost_per_driver = []
drivers.each do |driver, data|
  cost = data[:cost].sum
  # puts "#{driver} made $#{cost}"
  cost_per_driver << cost
end

# - the average rating for each driver
drivers.each do |driver, data|
  rating = data[:rating].sum.to_f
  size = data[:rating].length
  puts "#{driver}' avarage rating #{(rating/size).round(2)}"
end

# - Which driver made the most money?
cost_per_driver.each_with_index do |cost, index| 
  max_driver = ""
   if cost == cost_per_driver.max
    max_driver = "DR00#{index + 1}"
    puts "max driver: #{max_driver}"
   end 
end

# - Which driver has the highest average rating?
max_rating = 0
max_driver = ""
drivers.each do |driver, data|
	rating = data[:rating].sum
	size = data[:rating].length
	average = rating / size
	if average > max_rating
		max_rating = average
		max_driver = driver
	end
end
puts  "#{max_driver} has the highest average rating"
