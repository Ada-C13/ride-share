#Note: I added names for the sake of making the output more person-focused/readable, with the assumption that this information would be printed out for the user and should be optimized for human-readability

rides = {
  DR0001: {
    name: ["Corinna"],
    dates: ["2/3/2016", "2/3/2016", "2/5/2016"], 
    cost: [10, 30, 45], 
    rider_id: ["RD0003", "RD0015", "RD0003"], 
    rating: [3, 4, 2]}, 
  DR0002: {
    name: ["Ian"],
    dates: ["2/3/2016", "2/4/2016", "2/5/2016"],
    cost: [25, 15, 35],
    rider_id: ["RD0073", "RD0013", "RD0066"],
    rating: [5, 1, 3]}, 
  DR0003: {
    name: ["Steve"],
    dates: ["2/4/2016", "2/5/2016"], 
    cost: [5, 50],
    rider_id: ["RD0066", "RD0003"], 
    rating: [5, 2]}, 
  DR0004: {
    name: ["Dudley"],
    dates: ["2/3/2016", "2/4/2016", "2/5/2016"], 
    cost: [5, 10, 20], 
    rider_id: ["RD0022", "RD0022", "RD0073"], 
    rating: [5, 4, 5]}
}

# Iterate through the data structure to display, by printing in terminal, the following info:

# Creates a method that calls the individual driver stats and prints them together
# Names 
def prints_driver_stats(directory)
  puts ""
  #Calls driver name
  puts "#{directory[:name][0]}..." 
  # The number of rides each driver has given
  # Calls the number of rides given based on the length of the driver's rides array
  total_rides = directory[:dates].length
  puts "...gave #{total_rides} rides"

  # The total amount of money each driver has made
  # Calls the total income based on the sum of the driver's cost array
  total_income = directory[:cost].sum
  puts "...made $#{total_income}"

  # The average rating for each driver
  # Calls the average rating based on the sum of the driver's rating array divided 
  average_rating = (directory[:rating].sum)/(directory[:rating].length).to_f
  puts "...recieved an average rating of #{average_rating.round(2)}"
  puts "-------------------------------------------"  
end

def prints_driver_comparisons(array)
  puts "Here's some information about the top drivers:"
  # Stores the total income by driver and pulls using .max_by iterator
  highest_earner = array.max_by{|k| k[:income_for_comparison]} [:driver_name][0]
  # Stores the average rating by driver and pulls using .max_by iterator
  highest_rating_received = array.max_by{|k| k[:highest_rating]} [:driver_name][0]
  # Prints both highest driver statements
  puts "#{highest_earner} earned the most money."
  puts "#{highest_rating_received} received the highest rating."
  print "------------------------------------------"
end

puts "Welcome to AdaTransport. Here are the stats for this week:"

# Iterates through driver stats method and prints stats
rides.each do |driver, details|
  puts prints_driver_stats(rides[driver])
end

# Which driver made the most money?
# Which driver has the highest average rating?

# Instantiates comparison array
comparison_array = []

# Iterates through driver stats and shovels comparison data into a new hash for easier stats comparison
rides.each do |driver, details|
    comp_info = {
      driver_name: details[:name],
      income_for_comparison: details[:cost].sum,
      highest_rating: ((details[:rating].sum)/(details[:rating].length).to_f).round(2)
    }
    comparison_array << comp_info
end 

# Iterates through comparisons method and prints stats
prints_driver_comparisons(comparison_array)

# [Optional] For each driver, on which day did they make the most money?
# Strategy: Create an array -> hash of :name => [unique_date, total_income_for_day]
# Then print day with highest income using max_by
# Optional task started but not finished

# most_money = []

# rides.each do |driver, details|
#   i = 0
#   money_info = [details[:name], [details[:dates][i], details[:cost][i]]]
#   i += 1
#   most_money << money_info
# end

