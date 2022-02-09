# 1) Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

def display_teddys_age_randomly
  puts 'Teddy is %<random_age>s years old!' % { random_age: rand(20..200) }
end

display_teddys_age_randomly

# Modify this program to ask for a name, and then print the age for that person. For an extra challenge, use "Teddy" as the name if no name is entered.

def display_age_randomly
  puts 'Please enter a the name of the person whose age you would like to generate? If left blank, we will use Teddy'
  name = gets.chomp
  name = 'Teddy' if name == ''
  puts '%<name>s is %<random_age>s years old!' % { name: name, random_age: rand(20..200) }
end

# display_age_randomly

# 2) Build a program that asks a user for the length and width of a room in meters and then displays the area of the room in both square meters and square feet.
# Note: 1 square meter == 10.7639 square feet. Do not worry about validating the input at this time.

=begin
Enter the length of the room in meters:
10
Enter the width of the room in meters:
7
The area of the room is 70.0 square meters (753.47 square feet).
=end

def display_area_of_input
  puts 'Enter the length of the room in meters: '
  length = gets.chomp.to_i
  puts 'Enter the width of the room in meters: '
  width = gets.chomp.to_i
  metric_area = length * width
  imperial_area = metric_area * 10.7639
  puts 'The area of the room is %<metric_area>s square meters (%<imperial_area>s square feet)' % { metric_area: metric_area, imperial_area: imperial_area }
end

# display_area_of_input

# 3) Create a simple tip calculator. The program should prompt for a bill amount and a tip rate.
#The program must compute the tip and then display both the tip and the total amount of the bill.

=begin
Example:
What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0
=end

def calculate_tip
  puts 'What is the bill? '
  bill = gets.chomp.to_i
  puts 'What is the tip percentage? '
  percentage = gets.chomp.to_i

  tip = bill.to_f * percentage / 100
  total = bill + tip

  puts 'The tip is $%<tip>s' % { tip: tip }
  puts 'The total is $%<total>s' % { total: total }
end

calculate_tip