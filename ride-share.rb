drivers = {
  DR0001: [
    {
      date: "3rd Feb 2016", 
      cost: 10,
      rider_id: "RD0003",
      rating: 3
    },
    {
      date: "3rd Feb 2016", 
      cost: 30,
      rider_id: "RD0015",
      rating: 4
    },
    {
      date: "5th Feb 2016", 
      cost: 45,
      rider_id: "RD0003",
      rating: 2
    }
  ],

  DR0002: [
    {
      date: "3rd Feb 2016", 
      cost: 25,
      rider_id: "RD0073",
      rating: 5
    },
    {
      date: "4th Feb 2016", 
      cost: 15,
      rider_id: "RD0013",
      rating: 1
    },
    {
      date: "5th Feb 2016", 
      cost: 35,
      rider_id: "RD0066",
      rating: 3
    }
  ],

  DR0003: [
    {
      date: "4th Feb 2016", 
      cost: 5,
      rider_id: "RD0066",
      rating: 5
    },
    {
      date: "5th Feb 2016", 
      cost: 50,
      rider_id: "RD0003",
      rating: 2
    }
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


def get_total(array, key_sym) 
  total = 0.0 
  array.each do |ride|
    total += ride[key_sym]
  end 
  return total
end 


def get_average(sum, size)
  return (sum / size).round(1)
end 


def get_highest_earning_date(array)
  highest_earning = 0
  date = ""

  array.each do |ride| 
    if ride[:cost] > highest_earning 
      highest_earning = ride[:cost] 
      date = ride[:date]
    end  
  end

  return [date, highest_earning]
end 


# Create a method named <print_output_per_driver> 
def print_output_per_driver(hash, sign)
  output = ""

  # Iterate over hash to collect output
  hash.each_with_index do |(driver_id, data), i|
    if data.class == Integer || data.class == Float 
      output += "   Driver ##{i + 1} (#{driver_id}) - #{print_sign(data, sign)}\n"
    elsif data.class == Array 
      date = data[0]
      most_money = data[1]
      output += "   Driver ##{i + 1} (#{driver_id}) - On #{date}, made the most money, #{print_sign(most_money, sign)}.\n"
    end
  end  

  return output
end 


# Create a method to get <print_highest_value> with corresponding "driver id"
def print_highest_value(hash, keyword, sign)
  highest_num = hash.values.max
  
  hash.each_with_index do |(driver_id, num), i|    
    if num == highest_num
      return "   Driver ##{i + 1} (#{driver_id}) made the #{keyword}, #{print_sign(num, sign)}."
      break
    end 
  end 
end 


# Create a <results> hash to store data & access it easily later
# (i.e results)
# results = {
#   :number_of_rides=>{:DR0001=>3, :DR0002=>3, :DR0003=>2, :DR0004=>3}, 
#   :total_money=>{:DR0001=>85.0, :DR0002=>75.0, :DR0003=>55.0, :DR0004=>35.0}, 
#   :average_rating=>{:DR0001=>3, :DR0002=>3, :DR0003=>3.5, :DR0004=>4.7}, 
#   :highest_earning_date=>{:DR0001=>["5th Feb 2016", 45], :DR0002=>["5th Feb 2016", 35], :DR0003=>["5th Feb 2016", 50], :DR0004=>["5th Feb 2016", 20]}
# }
results = {} 

# Create 4 empty hashes to collect data for each 
rides_hash = {}
costs_hash = {}
ratings_hash = {} 
highest_earning_dates_hash = {} 


# Iterate over <drivers> hash to calculate and collect data into <results> hash
drivers.each_with_index do |(driver_id, ride_info_arr), i| 

  # Get <total_cost>, <avg_rating>, <highest_earning_date> by calling each method
  total_cost = get_total(ride_info_arr, :cost) 
  total_rating = get_total(ride_info_arr, :rating)
  avg_rating = get_average(total_rating, ride_info_arr.length)
  highest_earning_date = get_highest_earning_date(ride_info_arr)


  # Collect data into <results> hash for the following questions 
  # 1. The number of rides per driver
  # 2. The total money per driver
  # 3. The average rating per driver
  # 6. The highest earning date per driver

  rides_hash[driver_id] = ride_info_arr.length
  costs_hash[driver_id] = total_cost
  ratings_hash[driver_id] = integer_and_float(avg_rating)
  highest_earning_dates_hash[driver_id] = highest_earning_date

  results[:number_of_rides] = rides_hash 
  results[:total_money] = costs_hash 
  results[:average_rating] = ratings_hash 
  results[:highest_earning_date] = highest_earning_dates_hash
end 



puts "==============================="
puts "Weclome to Ride Share Database"
puts "==============================="


# Invoke <print_output_per_driver> & <print_highest_value> method to print following data 
puts "1. The number of rides each driver has given" # => 3,3,2,3
puts print_output_per_driver(results[:number_of_rides], "rides")
puts "\n"

puts "2. The total amount of money each driver has made" # => 85, 75, 55, 35
puts print_output_per_driver(results[:total_money], "$")
puts "\n"

puts "3. The average rating for each driver" # => 3, 3, 3.5, 4.7
puts print_output_per_driver(results[:average_rating], "⭐️")
puts "\n"

puts "4. Which driver made the most money?" # => Driver 1, $85.00
puts print_highest_value(results[:total_money], "most money", "$")
puts "\n"

puts "5. Which driver has the highest average rating?" # => Driver 4, ⭐️ 4.7
puts print_highest_value(results[:average_rating], "highest average rating", "⭐️")
puts "\n"

puts "6. (Optional) For each driver, on which day did they make the most money?"
# => Driver 1 / 5th Feb 2016 / $45.00
# => Driver 2 / 5th Feb 2016 / $35.00
# => Driver 3 / 5th Feb 2016 / $50.00 
# => Driver 4 / 5th Feb 2016 / $20.00 
puts print_output_per_driver(results[:highest_earning_date], "$")
puts "\n"


# <Output>
# ===============================
# Weclome to Ride Share Database
# ===============================
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
