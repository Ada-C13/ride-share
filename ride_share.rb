#Structure of my_company datas looks like this:
my_company = [
  {
    DR0001: 
    [
      {
        date: "3rd Feb 2016",
        cost: 10,
        ride_id: "RD0003",
        rating: 3
      },
      {
        date: "3rd Feb 2016",
        cost: 30
        ride_id:"RD0015"
        rating: 4
      },
      {
        date: "6th Feb 2016",
        cost: 45,
        ride_id: "RD0003",
        rating: 2
      }
    ],
  },
 {
   DR0002: 
   [
     {
       date: "3rd Feb 2016",
       cost: 25,
       ride_id: "RD0073",
       rating:5
      },
      {
        date: "4th Feb 2016",
        cost: 15,
        ride_id: "RD0013",
        rating:1
      },
      {
        date: "7th Feb 2016",
        cost: 35,
        ride_id: "RD0066",
        rating:3
        }
    ],
  },
 {
   DR0003: 
   [
     {
       date: "4th Feb 2016",
       cost: 5,
       ride_id: "RD0066",
       rating:5
      },
      {
        date: "5th Feb 2016",
        cost: 50,
        ride_id: "RD0003",
        rating:2}
    ],
  },
 {DR0004:
  [
    {
      date: "3rd Feb 2016",
      cost: 5,
      ride_id: "RD0022",
      rating:5
    },
    {
      date: "4th Feb 2016",
      cost: 10,
      ride_id: "RD0022",
      rating:4
    },
      {date: "8th Feb 2016",
       cost: 20,
       ride_id: "RD0073",
       rating:5
      }
    ]
  }
]

# Total of RIDES, EARNINGS , AVERAGE RATING, MOST EARNING PER DATE for each driver.
# Max of earnin and averge rating from all the drivers
def statistic_for_each_driver(my_company)
  drivers_list = []
  drivers_total_earnings = []
  drivers_avg_ratings = []
  my_company.each do |drivers|
    drivers.each do |driver, ride_details|
      puts "\nDriver with ID: #{driver} made #{ride_details.length} rides."
      cost = [] 
      average = []
      date = []
      ride_details.each do |ride|
        cost << ride[:cost]
        average << ride[:rating]
        date << ride[:date]
      end
      # The total amount of money each driver has made
      puts "The total amount of money that driver with ID #{driver} has made is $#{cost.sum} in total."
      # The average rating for each driver
      puts "The average rating for driver with ID #{driver} is #{(average.sum.to_f/ride_details.length).round(1)}."
      #For each driver, on which day did they make the most money?
      index_max_cost = cost.rindex(cost.max)
      date_max_cost = date[index_max_cost]
      puts "The driver with ID #{driver} made most money ($#{cost.max}) on #{date_max_cost}."

      #Save the current driver's statistics
      drivers_list << driver
      drivers_total_earnings << cost.sum
      drivers_avg_ratings << (average.sum.to_f/ride_details.length).round(1)
    end
  end
   # Which driver made the most money?
    index_most_earnings = drivers_total_earnings.rindex(drivers_total_earnings.max)
    highest_earning_driver = drivers_list[index_most_earnings] 
    highest_earning_driver_amount = drivers_total_earnings.max
    puts ""
    puts "The driver with ID #{highest_earning_driver} was highest earning ($#{highest_earning_driver_amount}) among all drivers"

    # Which driver has the highest average rating?
    index_highest_avg_ratings = drivers_avg_ratings.rindex(drivers_avg_ratings.max)
    highest_avg_driver = drivers_list[index_highest_avg_ratings]
    highest_avg_driver_rating = drivers_avg_ratings.max
    puts ""
    puts "The driver with ID #{highest_avg_driver} had highest average rating (#{highest_avg_driver_rating}) among all drivers"
end

statistic_for_each_driver(my_company)
