# Yesenia Torres
# rideshare.rb

# DATA STRUCTURE 

rides = [
    {
        date: {month: "Feb", day: "3rd", year: 2016},
        driver: {driver_id: "DR0004", money_earned: 5, rating_recieved: 5},
        rider: {rider_id: "RD0022" , rating_given:5}
    },
    {
        date: {month: "Feb", day: "3rd", year: 2016},
        driver: {driver_id: "DR0001", money_earned: 10, rating_recieved: 3},
        rider: {rider_id: "RD0003" , rating_given:3}
    },
    {
        date: {month: "Feb", day: "3rd", year: 2016},
        driver: {driver_id: "DR0002", money_earned: 25, rating_recieved: 5},
        rider: {rider_id: "RD0073" , rating_given:5}
    },
    {
        date: {month: "Feb", day: "3rd", year: 2016},
        driver: {driver_id: "DR0001", money_earned: 30, rating_recieved: 4},
        rider: {rider_id: "RD0015" , rating_given:4}
    },
    {
        date: {month: "Feb", day: "4th", year: 2016},
        driver: {driver_id: "DR0003", money_earned: 5, rating_recieved: 5},
        rider: {rider_id: "RD0066" , rating_given:5}
    },
    {
        date: {month: "Feb", day: "4th", year: 2016},
        driver: {driver_id: "DR0004", money_earned: 10, rating_recieved: 4},
        rider: {rider_id: "RD0022" , rating_given:4}
    },
    {
        date: {month: "Feb", day: "4th", year: 2016},
        driver: {driver_id: "DR0002", money_earned: 15, rating_recieved: 1},
        rider: {rider_id: "RD0013" , rating_given:1}
    },
    {
        date: {month: "Feb", day: "5th", year: 2016},
        driver: {driver_id: "DR0003", money_earned: 50, rating_recieved: 2},
        rider: {rider_id: "RD0003" , rating_given:2}
    },
    {
        date: {month: "Feb", day: "5th", year: 2016},
        driver: {driver_id: "DR0002", money_earned: 35, rating_recieved: 3},
        rider: {rider_id: "RD0066" , rating_given:3}
    },
    {
        date: {month: "Feb", day: "5th", year: 2016},
        driver: {driver_id: "DR0004", money_earned: 20, rating_recieved: 5},
        rider: {rider_id: "RD0073" , rating_given:5}
    },
    {
        date: {month: "Feb", day: "5th", year: 2016},
        driver: {driver_id: "DR0001", money_earned: 45, rating_recieved: 2},
        rider: {rider_id: "RD0003" , rating_given:2}
    }
]

# METHODS

def count_rides(array, value) 
    i = 0
    count = 0
    array.length.times do 
        if value == array[i]
            count += 1
        end 
        i += 1 
    end 

    return count
end 

def sum_money_earned(hasharray, value)
    i = 0
    sum = 0
    hasharray.length.times do 
        if hasharray[i].value?(value)
            sum += hasharray[i].fetch(:money_earned)
        end 
        i+=1
    end

    return sum
end

def find_avg_rating(hasharray, value)
    i = 0
    rating = 0.0
    num_ratings = 0
    hasharray.length.times do 
        if hasharray[i].value?(value)
            rating += hasharray[i].fetch(:rating_recieved)
            num_ratings += 1
        end 
        i+=1
    end

    return (rating/num_ratings).round(2)
end

# CREATE OUTPUT 

# create an array of only driver data
driver = rides.map do |ride|
    ride[:driver]
end

# create an array that records each driver occurence 
driver_occurences = rides.map do |ride|
    ride[:driver][:driver_id]
end

# create a unique, sorted array of driver_ids
sorted = driver_occurences.uniq.sort

# create arrays to find highest values
most_money = [] 
highest_rating = []

# print results 
sorted.each do |value|
    puts "Driver ##{value.slice(2..6)} has given #{count_rides(driver_occurences, value)} rides, has made a total of $#{sum_money_earned(driver, value)}, and has an average rating of #{find_avg_rating(driver, value)} stars." 
    most_money << {"driver" => value,  "earnings" => sum_money_earned(driver, value)}
    highest_rating << {"driver" => value, "ratings" => find_avg_rating(driver, value)}
end 

# find driver with most money earned
most_money.each do |driver|
    driver.sort_by{|earnings| earnings.values_at.max}
end

# find driver with highest rating 
highest_rating.each do |driver|
    driver.sort_by{|ratings| ratings.values_at.min}
end

# print findings
puts "Driver ##{most_money.first["driver"].slice(2..6)} made the most money, whereas Driver ##{highest_rating.last["driver"].slice(2..6)} had the highest rating."
