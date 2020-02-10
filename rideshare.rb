ride_info = [
  {
    "DR0001": [
      {
        "date": "3rd Feb 2016",
        "cost": 10,
        "rider_ID": "RD0003",
        "rating": 3 
      },
      {
        "date": "3rd Feb 2016",
        "cost": 30,
        "rider_ID": "RD0015",
        "rating": 4
      },
      {
        "date": "5th Feb 2016",
        "cost": 45,
        "rider_ID": "RD0003",
        "rating": 2
      }
    ],
    "DR0002": [
      {
        "date": "3rd Feb 2016",
        "cost": 25,
        "rider_ID": "RD0073",
        "rating": 5 
      },
      {
        "date": "4th Feb 2016",
        "cost": 15,
        "rider_ID": "RD0013",
        "rating": 1
      },
      {
        "date": "5th Feb 2016",
        "cost": 35,
        "rider_ID": "RD0066",
        "rating": 3
      }  
    ],
    "DR0003": [
      {
        "date": "4th Feb 2016",
        "cost": 5,
        "rider_ID": "RD0066",
        "rating": 5
      },
      {
        "date": "5th Feb 2016",
        "cost": 50,
        "rider_ID": "RD0003",
        "rating": 2
      }
    ],
    "DR0004": [
      {
        "date": "3rd Feb 2016",
        "cost": 5,
        "rider_ID": "RD0022",
        "rating": 5
      },
      {
        "date": "4th Feb 2016",
        "cost": 10,
        "rider_ID": "RD0022",
        "rating": 4
      },
      {
        "date": "5th Feb 2016",
        "cost": 20,
        "rider_ID": "RD0073",
        "rating": 5
      }  
    ]
  }
]

# - the number of rides each driver has given
ride_info.each do |driver|
  driver.each do |id, rides|
    puts "Driver #{id} has given #{rides.length} rides"
  end
end

# - the total amount of money each driver has made
ride_info.each do |driver|
  driver.each do |id, rides|
    total_made = rides.reduce(0) {|sum, ride| sum + ride[:cost]}
    puts "Driver #{id} has made $#{total_made}"
  end
end

# - the average rating for each driver
ride_info.each do |driver|
  driver.each do |id, rides|
    total_rating = 0
    rides.each do |data|
      total_rating += data[:rating]
    end
    puts "Driver #{id} has a rating of #{(total_rating.to_f / rides.length).round(2)}"
  end
end

# - Which driver made the most money?
ride_info.each do |driver|
  most_money = 0
  richest_driver = ""
  driver.each do |id, rides|
    total_made = rides.reduce(0) {|sum, ride| sum + ride[:cost]}
    if total_made > most_money
      most_money = total_made
      richest_driver = id
    end
  end
  puts "Driver #{richest_driver} made the most money, with $#{most_money}"
end

# - Which driver has the highest average rating?
ride_info.each do |driver|
  highest_rating = 0
  highest_rated_driver = ""
  driver.each do |id, rides|
    rating = (rides.reduce(0) {|sum, ride| sum + ride[:rating]}).to_f / rides.length
    if rating > highest_rating
      highest_rating = rating
      highest_rated_driver = id
    end
  end
  puts "Driver #{highest_rated_driver} had the highest rating, at #{highest_rating.round(2)}"
end
