drivers = {
  DR0001: [
    {
      date: "3rd Feb 2016", 
      cost: 10,
      rider_id: "DR0003",
      rating: 3
    },
    {
      date: "3rd Feb 2016", 
      cost: 30,
      rider_id: "DR0015",
      rating: 4
    },
    {
      date: "5th Feb 2016", 
      cost: 45,
      rider_id: "DR0003",
      rating: 2
    }
  ],

  DR0002: [
    {
      date: "3rd Feb 2016", 
      cost: 25,
      rider_id: "DR0073",
      rating: 5
    },
    {
      date: "4th Feb 2016", 
      cost: 15,
      rider_id: "DR0013",
      rating: 1
    },
    {
      date: "5th Feb 2016", 
      cost: 35,
      rider_id: "DR0066",
      rating: 3
    }
  ],

  DR0003: [
    {
      date: "4th Feb 2016", 
      cost: 5,
      rider_id: "DR0066",
      rating: 5
    },
    {
      date: "5th Feb 2016", 
      cost: 50,
      rider_id: "DR0003",
      rating: 2
    }
  ],

  DR0004: [
    {
      date: "3rd Feb 2016", 
      cost: 5,
      rider_id: "DR0022",
      rating: 5
    },
    {
      date: "4th Feb 2016", 
      cost: 10,
      rider_id: "DR0022",
      rating: 4
    },
    {
      date: "5th Feb 2016", 
      cost: 20,
      rider_id: "DR0073",
      rating: 5
    }
  ]
}

# Create <two_decimals> method to covert to 2 decimals (i.e. 8.0 => "8.00")
def two_decimals(num)
  '%.2f' % num
end


# Create <integer_and_float> method for rating
# (i.e. "4.00" => 4, "3.51" => 3.5)
def integer_and_float(num)
  num = two_decimals(num) 
  num.include?(".00") ? num = num.to_i : num = num.to_f.round(1)
end 


# Create <print_sign> method to print out "rides, $, ⭐️ rating"
def print_sign(num, sign) 
  num = "#{integer_and_float(num)} #{sign}" if sign == "rides"
  num = "#{sign}#{two_decimals(num)}" if sign == "$"
  num = "#{sign} #{integer_and_float(num)}" if sign == "⭐️"

  return num
end 


# Create a method named <hash_iterator> 
def hash_iterator(hash, sign)
  output = ""

  # Iterate over hash to collect output
  hash.each_with_index do |(driver_id, num), i|
    output += "   Driver ##{i + 1} (#{driver_id}) - #{print_sign(num, sign)}\n"
  end  

  return output
end 


# Create a method to get <highest_value> with corresponding "driver id"
def highest_value(hash, keyword, sign)
  highest_num = hash.values.max
  
  hash.each do |driver_id, num|    
    if num == highest_num
      return "   Driver ##{driver_id[-1]} (#{driver_id}) made the #{keyword}, #{print_sign(num, sign)}."
      break
    end 
  end 
end 


# Create a <results> hash to store data & access it easily later
# (i.e results)
# results = {
#   :number_of_rides=>{:DR0001=>3, :DR0002=>3, :DR0003=>2, :DR0004=>3}, 
#   :total_money=>{:DR0001=>85, :DR0002=>75, :DR0003=>55, :DR0004=>35}, 
#   :average_rating=>{:DR0001=>3, :DR0002=>3, :DR0003=>3.5, :DR0004=>4.7}, 
#   :most_money_made_date=>{:DR0001=>["5th Feb 2016", 45], :DR0002=>["5th Feb 2016", 35], :DR0003=>["5th Feb 2016", 50], :DR0004=>["5th Feb 2016", 20]}
# }
results = {} 

# Create 4 empty hashes to collect data for each 
num_of_rides_hash = {}
total_money_hash = {}
avg_rating_hash = {} 
most_money_made_date = {} 


# Iterate over <drivers> hash to calculate and collect data into <results> hash
drivers.each_with_index do |(driver_id, ride_info_arr), i| 

  # Collect data for "1. The number of rides per driver"
  num_of_rides_hash[driver_id] = ride_info_arr.length
  results[:number_of_rides] = num_of_rides_hash 
  

  # Create 4 variables named <total_cost>, <total_rating>, <most_money> and <date>.
  total_cost = 0
  total_rating = 0.0

  most_money = 0
  date = ""

  # Iterate over <ride_info_arr> to calculate each data
  ride_info_arr.each do |ride| 
    total_cost += ride[:cost]
    total_rating += ride[:rating]

    most_money = ride[:cost]
    date = ride[:date]
  end 


  # Collect data for "2. The total money per driver"
  total_money_hash[driver_id] = total_cost
  results[:total_money] = total_money_hash 

  # Collect data for "3. The average rating per driver"
  avg_rating = (total_rating / ride_info_arr.length).round(1)
  avg_rating_hash[driver_id] = integer_and_float(avg_rating)
  results[:average_rating] = avg_rating_hash 

  # Collect data for "6. The highest earning date per driver"
  most_money_made_date[driver_id] = [date, most_money]
  results[:most_money_made_date] = most_money_made_date
end 


# Invoke <hash_iterator> method to print 3 following data 
puts "1. The number of rides each driver has given" # => 3,3,2,3
puts hash_iterator(results[:number_of_rides], "rides")
puts "\n"

puts "2. The total amount of money each driver has made" # => 85, 75, 55, 35
puts hash_iterator(results[:total_money], "$")
puts "\n"

puts "3. The average rating for each driver" # => 3, 3, 3.5, 4.7
puts hash_iterator(results[:average_rating], "⭐️")
puts "\n"


# Invoke <highest_value> method to print "most money" & "highest average rating."
puts "4. Which driver made the most money?" # => Driver 1, $85.00
puts highest_value(results[:total_money], "most money", "$")
puts "\n"

puts "5. Which driver has the highest average rating?" # => Driver 4, ⭐️ 4.7
puts highest_value(results[:average_rating], "highest average rating", "⭐️")
puts "\n"


# Iterate over <results[:most_money_made_date]> hash to get "highest earning date"
puts "6. (Optional) For each driver, on which day did they make the most money?"
# => Driver 1 / 5th Feb 2016 / $45.00
# => Driver 2 / 5th Feb 2016 / $35.00
# => Driver 3 / 5th Feb 2016 / $50.00 
# => Driver 4 / 5th Feb 2016 / $20.00 

results[:most_money_made_date].each do |driver_id, ride_info_arr|
  date = ride_info_arr[0]
  most_money = ride_info_arr[1]
  puts "   Driver ##{driver_id[-1]} (#{driver_id}) - On #{date}, made the most money, $#{two_decimals(most_money)}. "
end 


# <Output>
# 1. The number of rides each driver has given
#    Driver #1 (DR0001) - 3 rides
#    Driver #2 (DR0002) - 3 rides
#    Driver #3 (DR0003) - 2 rides
#    Driver #4 (DR0004) - 3 rides

# 2. The total amount of money each driver has made
#    Driver #1 (DR0001) - $85.00
#    Driver #2 (DR0002) - $75.00
#    Driver #3 (DR0003) - $55.00
#    Driver #4 (DR0004) - $35.00

# 3. The average rating for each driver
#    Driver #1 (DR0001) - ⭐️ 3
#    Driver #2 (DR0002) - ⭐️ 3
#    Driver #3 (DR0003) - ⭐️ 3.5
#    Driver #4 (DR0004) - ⭐️ 4.7

# 4. Which driver made the most money?
#    Driver #1 (DR0001) made the most money, $85.00.

# 5. Which driver has the highest average rating?
#    Driver #4 (DR0004) made the highest average rating, ⭐️ 4.7.

# 6. (Optional) For each driver, on which day did they make the most money?
#    Driver #1 (DR0001) - On 5th Feb 2016, made the most money, $45.00. 
#    Driver #2 (DR0002) - On 5th Feb 2016, made the most money, $35.00. 
#    Driver #3 (DR0003) - On 5th Feb 2016, made the most money, $50.00. 
#    Driver #4 (DR0004) - On 5th Feb 2016, made the most money, $20.00. 

