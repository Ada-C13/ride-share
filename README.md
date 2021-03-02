[Link to Heroku page](https://ride-share-rails-ada.herokuapp.com/)
<img width="1437" alt="Screen Shot 2021-03-02 at 2 14 31 PM" src="https://user-images.githubusercontent.com/26889152/109722555-b4c84500-7b61-11eb-9404-5a4a3ea7caf0.png">

# Work with Ride Share Data using Arrays and Hashes

## At a Glance

- Individual, [stage 1](https://github.com/Ada-Developers-Academy/pedagogy/blob/master/classroom/rule-of-three.md#stage-1) project
- Due before class, **Mon, Feb 10** (Review [how to turn in projects](https://github.com/Ada-Developers-Academy/textbook-curriculum/blob/master/00-programming-fundamentals/project-submissions-without-git.md) )

## Introduction

Rideshare Programs are systems that help people organize carpooling/vanpooling. Some popular on-demand rideshare apps, like Lyft and Uber, store and use data on riders, drivers, and trips, particularly data on when a trip happened, who was the driver, and who was the rider.

## Learning Goals

- Create, read, and modify variables
- Create and access arrays
- Create and access hashes
- Organize large amounts of related data into nested arrays and hashes
- Access specific data within nested arrays and nested hashes
- Iterate through a nested data structure using loops and/or Enumerable methods
- Organize small pieces of code into methods, and call/invoke those methods

## Objective

We will look at data of drivers of a rideshare service and their ride history. We want to be able to see how many rides each driver has given and how much money a driver has made.

Currently, the data is stored in a [CSV file](https://en.wikipedia.org/wiki/Comma-separated_values). In this assignment, you should take this data and thoughtfully organize it into **one single** variable that is **one single** nested data structure. This nested data structure should use both arrays and hashes.

### But why? Motivation to Organize Complex, Nested Data

Given some data, a programmer often needs to be able to read, parse, and work with that data. Data that is organized into nested arrays and hashes can make this work easier. Ideally, data that is very well-organized will make this work easier to write, easier to read, and produce cleaner, higher-quality code.

The most common way you'll see data represented is in [JSON](https://en.wikipedia.org/wiki/JSON). We'll learn more about JSON more in depth later, but what you need to know now is that data is often represented with several layers of nested data structures, ultimately making up one big data structure. If we practice working with nested data structures now, it will make working with JSON later easier!

Have a look at [this example of JSON from Google Maps](sample_google_maps_data.json) _([Source](https://www.sitepoint.com/google-maps-json-file/))_ and answer the following questions.

- What does this data represent?
- How many different layers of data structures are there?
- What data structures were used?
- Why were those data structures used for those layers?

## Let's do this!

Use the file `worksheet.rb` to complete this activity. Open up this file, and type your answers below each prompt. In the end, we'll cover in submission requirements so everything is clean, runnable, and good for turning in.

### Step 0: Understand the data we need to organize
In your text editor, open up the file named `rides.csv`. This file holds pieces of concrete, instances of data as rows in a format similar to a table or spreadsheet. Answer the following questions, and write them down either in a text file, on paper, or on a whiteboard. If you're spending more than 5 minutes on a question, write down your questions and your ideas and move to the next question.

1. What _things_ (objects, nouns) are represented or described in this file? We can think of at least six different things.
1. From the things you listed in the previous question, all of those things have relationships to each other. (an ID belongs to a person, for instance. As an abstract, unrelated example a VIN belongs to a vehicle, and a vehicle has a VIN.) Consider the relationships between the pieces of data.
1. Lastly, in this assignment, we will rearrange all of the data into one data structure (with a lot of nested layers), that can be held in one variable. List some ideas: considering all of the relationships listed in the last question, what piece of data can contain the others at the top-most level? (Compared to the json example before, think about what the top-most layer of the hash and what that represented.) There is more than one correct answer, so just list out the options at this moment.

When you're finished with this, discuss with a neighbor your ideas. At this point, if you have further questions, ask for clarification from an instructor.

### Step 1: Establish the layers
Based on the data provided in the `rides.csv`, make a list of the different layers our data structure will need. These layers will each represent a new data structure that will nested within another.

### Step 2: Assign a data structure to each layer
Now that you know what layers you have, decide what data structure would be most appropriate to use for each layer.

After this point, consult with a neighbor.

### Step 3: Make the data structure!
Create the data structure by starting with the outline. Then, assign this data structure to a variable. Give the variable a good name that represents what the outermost layer is.

Then, manually input all the data from `rides.csv` into it. By "manually input all the data," we mean that you should be copying and pasting the literal data into this data structure, such as "DR0004" and "3rd Feb 2016" and "RD0022"

Be mindful of indentation! Proper indentation will make reading data substantially easier as the data becomes more nested.

### Step 4: Total Driver's Earnings and Number of Rides

Iterate through the data structure to display, by printing in terminal, the following info:
- The number of rides each driver has given
- The total amount of money each driver has made
- The average rating for each driver
- Which driver made the most money?
- Which driver has the highest average rating?

You may create and/or use as many variables, loops, and methods as you need.

Optionally, print in the terminal:
- For each driver, on which day did they make the most money?

## Submission Requirements

Once you're ready to submit this assignment (please mind the due date), you must do the following things to your code first:

1. Read through **every line** in the file and do the following things to clean it up:
    - Every thing that is not code needs to either be deleted or turned into a comment
    - Check white space. Remove large amounts of unnecessary white space, and add in helpful white space
    - Check indentation: make sure it's proper, especially as you nest and loop
    - Remove all unnecessary `puts` statements. We expect that the program will output to the terminal the descriptions and the answers of each prompt, and nothing else
    - Have all of the variable names been accurately named? Do you need to refactor any pieces of code?
    - Check comments; do you need to delete unnecessary comments? Do you need to add some comments? (Most of the time, unless your code is particularly complex, you should have zero or few comments by the time of submission)
1. **Most importantly:** make sure that your code is runnable. Run your code and make sure that simply running your program does not quit with Ruby error output. Your program should exit once everything is finished executing in an expected manner

When you feel like your code is in a good place, please open an appropriate PR (Pull Request), answer the reflection questions that appear when creating that PR, and submit!

## Wrap up

By having this data structure, we can now more easily target specific parts of our data to see how many rides a driver has given.

## What Instructors Are Looking For

Check out the [feedback template](feedback.md) which lists the items instructors will be looking for as they evaluate your project.
