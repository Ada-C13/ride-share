ride_share_trips = [
    {
        'DR001' =>  [
            {
                date: '3rd_Feb_2016',
                cost: 10.00,
                rider: 'RD0003',
                rating: 3.0
            },
            {
                date: '3rd_Feb_2016',
                cost: 30.00,
                rider: 'RD0015',
                rating: 4.0
            },
            {
                date: '5th_Feb_2016',
                cost: 45.00,
                rider: 'RD0003',
                rating: 2.0
            }     
        ],
        'DR002' => [
            {
                date: '3rd_Feb_2016',
                cost: 25.00,
                rider: 'RD0073',
                rating: 5.0
            },
            {
                date: '4th_Feb_2016',
                cost: 15.00,
                rider: 'RD0013',
                rating: 1.0
            },
            {
                date: '5th_Feb_2016',
                cost: 35.00,
                rider: 'RD0066',
                rating: 3.0
            },
        ],
        'DR003' => [
            { 
                date: '4th_Feb_2016',
                cost: 5.00,
                rider: 'RD0066',
                rating: 5.0
            },
            { 
                date: '5th_Feb_2016',
                cost: 50.00,
                rider: 'RD0003',
                rating: 2.0
            } 
        ],
        'DR004' => [
            { 
                date: '3rd_Feb_2016',
                cost: 5.00,
                rider: 'RD0022',
                rating: 5.0      
            },
            {
                date: '4th_Feb_2016',
                cost: 10.00,
                rider: 'RD0022',
                rating: 4.0
            },
            {
                date: '5th_Feb_2016',
                cost: 20.00,
                rider: 'RD0073',
                rating: 5.0
            }
        ]
    
    }
] 

#prints to terminal the number of rides each driver has given
puts "---------------------------------------------------"
puts "How many trips did each driver make?"
puts "\n"

def driver_trips(ride_share_rides)
    ride_share_rides.each do |trip_info|
        trip_info.each do |driver, trips|
            puts "Driver #{driver} made a total of #{trips.count} trips."
        end
    end
end

driver_trips(ride_share_trips)

puts "---------------------------------------------------"

#prints in terminal the total amount of money each driver made
puts "How much money did each driver make?"
puts "\n"

def driver_pay(ride_share_rides)
    pay_hash = Hash.new(0)
    ride_share_rides.each do |trip_info|
        trip_info.each do |driver, trips|
            pay_hash[driver] = 0
            trips.each do |info|
                pay_hash[driver] += info[:cost]
            end
        end
    end
    return pay_hash
end

driver_pay(ride_share_trips).each do |driver, pay|
    puts "Driver #{driver} made a total of $#{pay}."
end

puts "---------------------------------------------------"

#prints in terminal average driver rating

puts "What are the average ratings for the drivers?"
puts "\n"

def driver_rating(ride_share_rides)
    rating_hash = Hash.new(0)
    ride_share_rides.each do |trip_info|
        trip_info.each do |driver, trips|
            rating_hash[driver] = 0
            trips.each do |info|
                average_rating = (info[:rating]/trips.count).round(2) #there seems to be some float math happening when I don't round
                rating_hash[driver] += average_rating
            end
        end
    end
    return rating_hash
end

driver_rating(ride_share_trips).each do |driver, rating|
    puts "Driver #{driver} has an average rating of #{rating} stars."
end

puts "---------------------------------------------------"

#prints in terminal which driver made the most money

puts "Which driver made the most money?"
puts "\n"
highest_pay = driver_pay(ride_share_trips).values.max
puts "Driver" + " " + driver_pay(ride_share_trips).key(highest_pay) + " " + "made the most money with $#{highest_pay}."

puts "---------------------------------------------------"
#prints in terminal which driver had highest average rating

puts "Which driver had the highest rating?"
puts "\n"
highest_rating = driver_rating(ride_share_trips).values.max
puts "Driver" + " " + driver_rating(ride_share_trips).key(highest_rating) + " " + "had the highest rating, with a rating of #{highest_rating} stars."

puts "---------------------------------------------------"
#print in terminal which day did each driver make the most money
# I tried multiple ways of looping through to get the driver info into one method but each driver's array kept getting cahnged with each loop.


def driver1_pay_day(ride_share_rides)
    pay_hash = Hash.new(0)
    day_hash = Hash.new(0)
    ride_share_rides.each do |trip_info|
        trip_info.values[0].each do |x|
            day_hash[x[:date]] += x[:cost]
            pay_hash[trip_info.keys[0]] = day_hash
        end
    end
    return pay_hash
end

driver =" "
driver1_pay_day(ride_share_trips).keys.each do |key|
    driver = key
end
    
highest_pay_day = driver1_pay_day(ride_share_trips).values[0].values.max
date_highest_pay = driver1_pay_day(ride_share_trips).values[0].key(driver1_pay_day(ride_share_trips).values[0].values.max) #for some reason when I put in the variable highest_pay in the keys, it doesn't pull up the key. Only the long hand does

puts "Driver #{driver} had the highest pay on #{date_highest_pay}, with a total of $#{highest_pay_day}."


def driver2_pay_day(ride_share_rides)
    pay_hash = Hash.new(0)
    day_hash = Hash.new(0)
    ride_share_rides.each do |trip_info|
        trip_info.values[1].each do |x|
            day_hash[x[:date]] += x[:cost]
            pay_hash[trip_info.keys[1]] = day_hash
        end
    end
    return pay_hash
end

driver =" "
driver2_pay_day(ride_share_trips).keys.each do |key|
    driver = key
end
    
highest_pay_day = driver2_pay_day(ride_share_trips).values[0].values.max
date_highest_pay = driver2_pay_day(ride_share_trips).values[0].key(driver2_pay_day(ride_share_trips).values[0].values.max) 

puts "Driver #{driver} had the highest pay on #{date_highest_pay}, with a total of $#{highest_pay_day}."

def driver3_pay_day(ride_share_rides)
    pay_hash = Hash.new(0)
    day_hash = Hash.new(0)
    ride_share_rides.each do |trip_info|
        trip_info.values[2].each do |x|
            day_hash[x[:date]] += x[:cost]
            pay_hash[trip_info.keys[2]] = day_hash
        end
    end
    return pay_hash
end

driver =" "
driver3_pay_day(ride_share_trips).keys.each do |key|
    driver = key
end
    
highest_pay_day = driver3_pay_day(ride_share_trips).values[0].values.max
date_highest_pay = driver3_pay_day(ride_share_trips).values[0].key(driver3_pay_day(ride_share_trips).values[0].values.max) #for some reason when I put in the variable highest_pay in the keys, it doesn't pull up the key. Only the long hand does

puts "Driver #{driver} had the highest pay on #{date_highest_pay}, with a total of $#{highest_pay_day}."

def driver4_pay_day(ride_share_rides)
    pay_hash = Hash.new(0)
    day_hash = Hash.new(0)
    ride_share_rides.each do |trip_info|
        trip_info.values[3].each do |x|
            day_hash[x[:date]] += x[:cost]
            pay_hash[trip_info.keys[3]] = day_hash
        end
    end
    return pay_hash
end

driver =" "
driver4_pay_day(ride_share_trips).keys.each do |key|
    driver = key
end
    
highest_pay_day = driver4_pay_day(ride_share_trips).values[0].values.max
date_highest_pay = driver4_pay_day(ride_share_trips).values[0].key(driver4_pay_day(ride_share_trips).values[0].values.max) #for some reason when I put in the variable highest_pay in the keys, it doesn't pull up the key. Only the long hand does

puts "Driver #{driver} had the highest pay on #{date_highest_pay}, with a total of $#{highest_pay_day}."
