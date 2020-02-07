###DATA SET FROM CSV FILE###
information =
  {:DR0001 => [
    {:Date => "3rd Feb 2016", :Cost => 10, :Rider_ID => "RD0003", :Rating => 3},
    {:Date => "3rd Feb 2016", :Cost => 30, :Rider_ID => "RD0015", :Rating => 4},
    {:Date => "5th Feb 2016", :Cost => 45, :Rider_ID => "RD0003", :Rating => 2}
    ],
  :DR0002 => [
    {:Date => "3rd Feb 2016", :Cost => 25, :Rider_ID => "RD0073", :Rating => 5},
    {:Date => "4th Feb 2016", :Cost => 15, :Rider_ID => "RD0013", :Rating => 1},
    {:Date => "5th Feb 2016", :Cost => 35, :Rider_ID => "RD0003", :Rating => 3}
    ],
  :DR0003 => [
    {:Date => "4th Feb 2016", :Cost => 5, :Rider_ID => "RD0066", :Rating => 5},
    {:Date => "5th Feb 2016", :Cost => 50, :Rider_ID => "RD0003", :Rating => 2}
    ],
  :DR0004 => [
    {:Date => "3rd Feb 2016", :Cost => 5, :Rider_ID => "RD0022", :Rating => 5},
    {:Date => "4th Feb 2016", :Cost => 10, :Rider_ID => "RD0022", :Rating => 4},
    {:Date => "5th Feb 2016", :Cost => 20, :Rider_ID => "RD0073", :Rating => 5}
    ]
  }

###DEFINITION DICTIONARY###
#returns the key of the largest number in the hash
def largest_hash_key(hash)
  hash.max_by{|key, value| value}
end

###HASH DICTIONARY###
day_earnings = Hash.new

###VARIABLE DICTIONARY###
rich_driver, best_driver = nil, nil
riches, best_rating, temp_money, temp_rating = 0, 0, 0, 0

#calculates the amount of money each driver has earned, number of trips, and driver ratings
puts "The following provides the number of trips, amount of money each driver has earned, and driver ratings:"
information.each do |driver, drive_info|
  drive_info.each do |trip_info|
    temp_money += trip_info[:Cost] #stores sum of money earned for current driver
    temp_rating += trip_info[:Rating] #stores sum of all rating for current driver
  end

  #calculates average rating of driver
  current_rating = (temp_rating.to_f/drive_info.length.to_f).round(2)

  #compares earnings of driver against the current highest earnings/rating. 
  #If higher, replace as highest earning/rating and which driver; if not, disregard
  if temp_money > riches
    rich_driver, riches = driver, temp_money
  end

  if current_rating > best_rating
    best_driver, best_rating = driver, current_rating
  end
  
  puts "Driver #{driver} earned $#{temp_money}"
  puts "Driver #{driver} drove #{drive_info.length} trips"
  puts "Driver #{driver} current rating is #{current_rating}"

  #restores holder for the earning/rating by driver to 0 for next driver 
  temp_money = 0
  temp_rating = 0
end

#prints which driver earned the most amount of money, which was calculated up above
puts "Congrats to #{rich_driver} who earned the most at $#{riches} this week!"
puts "Congrats to #{best_driver} who had the highest rating of #{best_rating} this week!"

#calculates the day on which the driver earned the most money
information.each do |driver, drive_info|
  drive_info.each do |trip_info|
    #creates hash for date to earnings. If date already exists, incrementally increase cost
    if day_earnings.key? (trip_info[:Date])
      day_earnings[trip_info[:Date]] += trip_info[:Cost] 
    else
      day_earnings[trip_info[:Date]] = trip_info[:Cost] 
    end
  end

  puts "Driver #{driver} earned the most on #{largest_hash_key(day_earnings)[0]} with $#{largest_hash_key(day_earnings)[1]}"
  #restores holder for the monthly earnings for driver to 0 for next driver 
  day_earnings.clear
end
