# data structure 

ride_variable = {
    "DR0004" => [
        { "DATE" => "3rd Feb 2016",
        "COST" => 5,
        "RIDER_ID" => "RD0022",
        "RATING" => 5
        },
        { "DATE" => "5th Feb 2016",
        "COST" => 20,
        "RIDER_ID" => "RD0073",
        "RATING" => 5
        }
    ],
    "DR0001" => [
        { "DATE" => "3rd Feb 2016",
        "COST" => 10,
        "RIDER_ID" => "RD0003",
        "RATING" => 3
        },
        { "DATE" => "3rd Feb 2016",
        "COST" => 30,
        "RIDER_ID" => "RD0015",
        "RATING" => 4
        },
        { "DATE" => "5th Feb 2016",
        "COST" => 45,
        "RIDER_ID" => "RD0003",
        "RATING" => 2
        }
    ],
    "DR0002" => [
        { "DATE" => "3rd Feb 2016",
        "COST" => 25,
        "RIDER_ID" => "RD0073",
        "RATING" => 5
        },
        { "DATE" => "4th Feb 2016",
        "COST" => 15,
        "RIDER_ID" => "RD0013",
        "RATING" => 1
        },
        { "DATE" => "5th Feb 2016",
        "COST" => 35,
        "RIDER_ID" => "RD0066",
        "RATING" => 3
        }
    ],
    "DR0003" => [
        { "DATE" => "4th Feb 2016",
        "COST" => 5,
        "RIDER_ID" => "RD0066",
        "RATING" => 5
        },
        { "DATE" => "5th Feb 2016",
        "COST" => 50,
        "RIDER_ID" => "RD0003",
        "RATING" => 2
        }
    ],

}

# p ride_variable


# The number of rides each driver has given

ride_variable.map do |driver,info| 
    puts "Driver:#{driver} has #{info.length} rides." 
end 

# The total amount of money each driver has made

ride_variable.each do |driver, info|
    total_cost = 0
    info.each do |details|
       total_cost += details["COST"]
    end 
    puts "Driver:#{driver} made #{total_cost}"
end 


# The average rating for each driver

ride_variable.each do |driver, info|
    total_rating = 0 
    info.each do |details|
        total_rating += details["RATING"]
    end 
    puts "Driver:#{driver} has an average rating of #{total_rating.to_f/info.length}"
end 

# Which driver made the most money?

highest_cost = 0
driver_with_highest_cost = ""

ride_variable.each do |driver, info|
    total_cost = 0
    info.each do |details|
       total_cost += details["COST"]
    end 
   if total_cost > highest_cost
        highest_cost = total_cost
        driver_with_highest_cost = driver
   end 
end 

puts "Driver #{driver_with_highest_cost} made the most money of #{highest_cost}"

# Which driver has the highest average rating?

highest_avg_rating = 0
driver_with_highest_rating = ""

ride_variable.each do |driver, info|
    total_rating = 0
    avg_rating = 0
    info.each do |details|
        total_rating += details["RATING"]
        avg_rating = total_rating / info.length
    end 
   if avg_rating > highest_avg_rating
        highest_avg_rating = avg_rating
        driver_with_highest_rating = driver
   end 
end 

puts "Driver #{driver_with_highest_rating} has the highest rating of #{highest_avg_rating}"

# For each driver, on which day did they make the most money?

ride_variable.each do |driver,info|
    date_max_money = ""
    max_cost = 0
    info.each do |details|
        if details["COST"] > max_cost
            date_max_money = details["DATE"]
            max_cost = details["COST"]
        end 
    end 
    puts "Driver #{driver} made the most on #{date_max_money} with $#{max_cost}"
end 


