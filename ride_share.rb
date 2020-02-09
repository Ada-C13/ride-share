drivers = [
  { 
    :DR0001  =>
    [ 
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
    ]
  },

  { 
    :DR0002 => 
    [ 
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
    ]
  },

  { 
    :DR0003 => 
    [ 
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
    ]
  },

  { 
    :DR0004 => 
    [ 
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
]

def num_rides(drivers)
  drivers.each do |ride_share_array|
    ride_share_array.each do |driver_key, driver_value|
      puts "Driver id:#{driver_key} had #{driver_value.count} rides."

    end
  end
end


def total_money(drivers)
  money_made_hash = {}
  drivers.each do |ride_share_array|
    ride_share_array.each do |driver_key, driver_value|

      driver_total_cost = 0.00

      driver_value.each do |ride_hash|
        driver_total_cost += ride_hash[:cost]

      end

      puts "Driver id:#{driver_key} made #{"$%.2f" % driver_total_cost}."
      
    end
  end
end

def average_rating(drivers)
  average_rating_hash = {}

  drivers.each do |ride_share_array|
    ride_share_array.each do |driver_key, driver_value|
      driver_total_rating = 0.00
      driver_value.each do |ride_hash|
        driver_total_rating += ride_hash[:rating]

      end

      puts "Driver id:#{driver_key} had an average rating of #{(driver_total_rating/driver_value.count).round(2)}."

    end
  end
end

def which_driver_money_rating(drivers)
  money_made_hash = {}
  average_rating_hash = {}
  drivers.each do |ride_share_array|
    ride_share_array.each do |driver_key, driver_value|

      driver_total_cost = 0.00
      driver_total_rating = 0.00

      driver_value.each do |ride_hash|
        driver_total_cost += ride_hash[:cost]
        driver_total_rating += ride_hash[:rating]

      end

      money_made_hash[:"#{driver_key}"] = driver_total_cost
      average_rating_hash[:"#{driver_key}"] = driver_total_rating/driver_value.count

    end
  end

  puts "Driver id:#{money_made_hash.key(money_made_hash.values.max)} made the most money at #{"$%.2f" %money_made_hash.values.max}."
  puts "Driver id:#{average_rating_hash.key(average_rating_hash.values.max)} had the highest average rating at: #{average_rating_hash.values.max.round(2)}."

end

num_rides(drivers)
total_money(drivers)
average_rating(drivers)
which_driver_money_rating(drivers)
