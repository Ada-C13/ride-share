#Developer's name = Tithvorlak Mok (Lak)
#Project: Ride Share
#Due Date: 02/10/2020

#Data of Rides
total_rides = {
    DR0001: [
        {
            date: '3rd Feb 2016',
            cost: 10,
            rider_id: 'RD0003',
            rating: 3
        },
        {
            date: '3rd Feb 2016',
            cost: 30,
            rider_id: 'RD0015',
            rating: 4
        },
        {
            date: '5th Feb 2016',
            cost: 45,
            rider_id: 'RD0003',
            rating: 2
        }
    ],
    DR0002:[
        {
            date:'3rd Feb 2016',
            cost: 25,
            rider_id: 'RD0073',
            rating: 5
        },
        {
            date: '4th Feb 2016',
            cost: 15,
            rider_id:'RD0013',
            rating: 1
        },
        {
            date: '5th Feb 2016',
            cost:35,
            rider_id:'RD0006',
            rating:3
        }
    ],
    DR0003: [
        {
            date:'4th Feb 2016',
            cost: 5,
            rider_id: 'RD0066',
            rating: 5
        },
        {
            date: '5th Feb 2016',
            cost: 50,
            rider_id: 'RD0003',
            rating: 2
        }
    ],
    DR0004: [
        {
            date: '3rd Feb 2016',
            cost: 5,
            rider_id: 'RD0022',
            rating: 5
        },
        {
            date:'4th Feb 2016',
            cost: 10,
            rider_id: 'RD0022',
            rating: 4
        },
        {
            date: '5th Feb 2016',
            cost: 20,
            rider_id: 'RD0003',
            rating: 5
        }
    ]
}

########################################################

# - the number of rides each driver has given
puts "The number of rides each driver has given"
total_rides.each do |each_driver, rides|
    puts "Driver #{each_driver} has #{rides.length}"
end

puts # Leave extra space for readability in the console 
# - the total amount of money each driver has made
puts "The total amount of money each driver has made"
def all_costs_each_driver(total_rides)
    all_costs_each_driver_array = total_rides.map do |each_driver, rides|
        costs_of_each_driver = rides.map do |each_ride| #costs_of_each_driver is an array of all costs for each driver
            each_ride[:cost]
        end      
        {
            id: each_driver,
            cost: costs_of_each_driver
        }
    end
    return all_costs_each_driver_array
end

sum_cost_each_driver = all_costs_each_driver(total_rides) #Use the method all_costs_each_driver(total_rides)
sum_cost_each_driver.each do |driver|
    puts "Driver #{driver[:id]} has made $#{driver[:cost].sum} "
end   

puts # Leave extra space for readability in the console 
# - the average rating for each driver
puts "The average rating for each driver"
def average_rating(total_rides)
    average_ratings_each_driver = total_rides.map do |each_driver, rides|
        ride_of_each_driver = rides.map do |each_ride|
            each_ride[:rating]
        end
        sum = ride_of_each_driver.sum.to_f
        average = (sum/ride_of_each_driver.length).round(2)
        {
            id: each_driver,
            rating: average
        } 
    end
    return average_ratings_each_driver
end

average_rating = average_rating(total_rides)
average_rating.each do |each_average_rating|
    puts "The average rating of driver #{each_average_rating[:id]} is #{each_average_rating[:rating]}"
end

puts # Leave extra space for readability in the console 
# # - Which driver made the most money?
puts "Which driver made the most money?"

drivers_costs_array = all_costs_each_driver(total_rides) #Use the method all_costs_each_driver(total_rides)
drivers_sum_costs_array = drivers_costs_array.map do |driver|
    {   
        id:driver[:id],
        total_cost: driver[:cost].sum
    }      
end

#Find the max cost among these drivers
highest_cost = 0
most_earned_driver = nil
drivers_sum_costs_array.each do |driver|
    if driver[:total_cost] > highest_cost
        highest_cost = driver[:total_cost]
        most_earned_driver = driver[:id]
    end
end
puts "Driver #{most_earned_driver} made the most money with $#{highest_cost}"

puts # Leave extra space for readability in the console 

# - Which driver has the highest average rating?
puts "Which driver has the highest average rating?"
average_ratings_array = average_rating(total_rides) #Use the method average_rating(total_rides)
highest_rating_driver = nil
highest_rating = 0
average_ratings_array.each do |each_driver|
    if each_driver[:rating] > highest_rating
        highest_rating = each_driver[:rating]
        highest_rating_driver = each_driver[:id]
    end
end 
puts "The driver #{highest_rating_driver} has the highest rating with #{highest_rating}"

puts # Leave extra space for readability in the console

# #Optional: 

#For each driver, on which day did they make the most money?
puts "For each driver, on which day did they make the most money?"
highest_cost = 0
highest_date = nil
total_rides.each do |each_driver, rides|
    rides.each do |ride|
        if ride[:cost] > highest_cost
            highest_cost = ride[:cost]
            highest_date = ride[:date]
        end
        highest_cost = ride[:cost]
        highest_date = ride[:date]
    end
    puts "For driver #{each_driver} make most money on #{highest_date} with $#{highest_cost}"
end
