########################################################
# Step 1: Establish the layers

# drivers >
# collection of all drivers >
# all trips of each driver + details (date of trip, cost, rider, rating)

########################################################
# Step 2: Assign a data structure to each layer

# drivers > hash
# collection of all drivers > array
# all trips of each driver + details ((=date of trip, cost, rider, rating) > hash

########################################################
# Step 3: Make the data structure!

########################################################
# Step 4: Total Driver's Earnings and Number of Rides

# Use an iteration blocks to print the following answers:
# - the number of rides each driver has given
# - the total amount of money each driver has made
# - the average rating for each driver
# - Which driver made the most money?
# - Which driver has the highest average rating?

# Data
drivers = {
	DR0001: [
		{date: '3rd Feb 2016', cost: 10, rider: 'RD0003', rating: 3},
		{date: '3rd Feb 2016', cost: 30, rider: 'RD0015', rating: 4},
		{date: '5th Feb 2016', cost: 45, rider: 'RD0003', rating: 2}
	],
	DR0002: [
		{date: '3rd Feb 2016', cost: 25, rider: 'RD0073', rating: 5},
		{date: '4th Feb 2016', cost: 15, rider: 'RD0013', rating: 1},
		{date: '5th Feb 2016', cost: 35, rider: 'RD0066', rating: 3}
	],
	DR0003: [
		{date: '4th Feb 2016', cost: 5, rider: 'RD0066', rating: 5},
		{date: '5th Feb 2016', cost: 50, rider: 'RD0003', rating: 2}
	],
	DR0004: [
		{date: '3rd Feb 2016', cost: 5, rider: 'RD0022', rating: 5},
		{date: '4th Feb 2016', cost: 10, rider: 'RD0022', rating: 4},
		{date: '5th Feb 2016', cost: 20, rider: 'RD0073', rating: 5}
	]
}

$richest_driver = drivers.keys[0] # Variable to track the highest earning driver.
$highest_total = 0 # Variable to track the highest total earnings.

$highest_rating = 0 # Variable to track the highest average rating
$best_driver = drivers.keys[0] # Variable to track the best driver on average

# Calculates the stats for each driver.
def driver_stats (driver, trip)
	total_money = 0 # Variable to track each driver's total earnings.
	total_ratings = 0 # Variable to track each driver's ratings.

	highest_date = ''
	highest_earning = 0

	trip.each do |hash|
		# Find the total amount of money earned for each driver.
		total_money += hash[:cost]
	
		# Find the average rating for each driver.
		total_ratings += hash[:rating]

		# Find the date the driver made the most money.
		if hash[:date] == highest_date
			highest_earning += hash[:cost]
		elsif hash[:date] != highest_date && hash[:cost] > highest_earning
			highest_date = hash[:date]
			highest_earning = hash[:cost]
		end
	end

	# Find the driver who earned the most.
	if total_money > $highest_total
		$richest_driver = driver.to_s
		$highest_total = total_money
	end

	# Calculate the average rating for each driver.
	avg_rating = total_ratings.to_f / trip.length

	# Find the driver with the highest average rating.
	if avg_rating > $highest_rating 
		$highest_rating = avg_rating
		$best_driver = driver.to_s
	end

	# Prints individual stats for each driver.
	puts "STATS FOR #{ driver.to_s }:"
	puts "Completed #{ trip.length } trip(s)."
	puts "Earned $#{ total_money }."
	puts "Maintained an average rating of #{ avg_rating.round(1) }."
	puts "#{ driver.to_s } earned the most money on #{ highest_date } at $#{ highest_earning }."
end

# Check each driver's stats.
drivers.each do |driver, trip|
	driver_stats(driver, trip)
end

# Print stats for who made the most money and had the highest average rating.
puts "ADDITIONAL OVERALL STATS:"
puts "#{ $richest_driver } made the most money at $#{ $highest_total }."
puts "#{ $best_driver } had the highest average rating at #{ $highest_rating.round(1) }."
