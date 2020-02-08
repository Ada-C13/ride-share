drivers = [
	{
		driver_id: "DR0001",
		dates: {
			"Feb 3rd 2016" => {
				riders: ["RD0003", "RD0015"],
				ratings: [3, 4],
				earnings: [10, 30]
			},
			"Feb 5th 2016" => {
				riders: ["RD0003"],
				ratings: [2],
				earnings: [45]
			}
		},	
	},
	{
		driver_id: "DR0002",
		dates: {
			"Feb 3rd 2016" => {
				riders: ["RD0073"],
				ratings: [5],
				earnings: [25]
			},
			"Feb 4th 2016" => {
				riders: ["RD0013"],
				ratings: [1],
				earnings: [15]
			},
			"Feb 5th 2016" => {
				riders: ["RD0066"],
				ratings: [3],
				earnings: [35]
			}
		},
	},
	{
		driver_id: "DR0003",
		dates: {
			"Feb 4th 2016" => {
				riders: ["RD0066"],
				ratings: [5],
				earnings: [5]
			},
			"Feb 5th 2016" => {
				riders: ["RD0003"],
				ratings: [2],
				earnings: [50]
			}
		},
	},
	{
		driver_id: "DR0004",
		dates: {
			"Feb 3rd 2016" => {
				riders: ["RD0022"],
				ratings: [5],
				earnings: [5]
			},
			"Feb 4th 2016" => {
				riders: ["RD0022"],
				ratings: [4],
				earnings: [10]
			},
			"Feb 5th 2016" => {
				riders: ["RD0073"],
				ratings: [5],
				earnings: [20]
			}
		}
	}
]


# Calculates earnings per driver
# Total sums, day that made the highest amount, and what that amount was
def find_salary(driver)
	highest_pay_date = ""
	highest_pay_day_amount = 0
	earning_sum = 0
		
	driver[:dates].each do |date, info|
		days_sum = 0
		
		info[:earnings].each do |earning|
			earning_sum += earning
			days_sum += earning
		end
		
		if days_sum > highest_pay_day_amount
			highest_pay_day_amount = days_sum
			highest_pay_date = date
		end
	end
		
	return {
		driver_sum:earning_sum, 
		driver_highest_date:highest_pay_date, 
		driver_highest_sum:highest_pay_day_amount,
	}
end


# Calculates average ratings per driver
def find_avg_rating(driver)
	rating_sum = 0
	total_ratings = 0
	
	driver[:dates].each do |date, info|
		info[:ratings].each do |rating|
			rating_sum += rating
			total_ratings += 1
		end
	end
	
	avg_rating = rating_sum.to_f / total_ratings.to_f
	return avg_rating.round(1)
end


# Calculates number of total riders per driver
def count_riders(driver)
	rider_count = 0
	
	driver[:dates].each do |date, info|
		rider_count += info[:riders].length
	end
	
	return rider_count
end


highest_earner_id = ""
highest_earner_amount = 0

highest_rating_id = ""
highest_rating_amount = 0

# Goes through each driver
drivers.each do |driver|
		
	# Average ratings
	avg_rating = find_avg_rating(driver)
	
	if highest_rating_amount < avg_rating
		highest_rating_amount = avg_rating
		highest_rating_id = driver[:driver_id]
	end
	
	# Earnings
	earnings = find_salary(driver)
	
	if highest_earner_amount < earnings[:driver_sum]
		highest_earner_amount = earnings[:driver_sum]
		highest_earner_id = driver[:driver_id]
	end
	
	# Amount of riders
	riders = count_riders(driver)
	
	# Message to user
	puts <<-MESSAGE
	\n*** Driver Summary ***
	\nDriver ##{driver[:driver_id]}
	=> Had a total of #{riders} riders
	=> The most money was made on #{earnings[:driver_highest_date]} with an amount of $#{earnings[:driver_highest_sum]}
	=> The total sum of earnings is $#{earnings[:driver_sum]}
	=> The average rating for this driver is #{avg_rating}
	MESSAGE
end

puts <<-MESSAGE

Driver ##{highest_earner_id} made the most money at $#{highest_earner_amount}
Driver ##{highest_rating_id} had the highest average rating at #{highest_rating_amount}

Thank you for being a driver!!

MESSAGE
