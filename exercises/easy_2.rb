# 1) Build a program that randomly generates and prints Teddy's age. To get the age, you should generate a random number between 20 and 200.

def display_teddys_age_randomly
  puts 'Teddy is %<random_age>s years old!' % { random_age: rand(20..200) }
end

# display_teddys_age_randomly

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

# calculate_tip

# 4) Build a program that displays when the user will retire and how many years
# she has to work till retirement.

=begin
What is your age? 30
At what age would you like to retire? 70

It's 2016. You will retire in 2056.
You have only 40 years of work to go!
=end

def display_retirement_age
  puts 'What is your age? '
  current_age = gets.chomp.to_i
  puts 'At what age would you like to retire? '
  retirement_age = gets.chomp.to_i
  current_year = Time.now.year
  years_remaining = retirement_age - current_age
  output = <<~OUTPUT
    Its %<current_year>s. You will retire in %<retirement_year>s.
    You have only %<years_remaining>s years of work to go!
  OUTPUT
 puts output % { current_year: current_year, retirement_year: current_year + years_remaining, years_remaining: years_remaining }
end

# display_retirement_age

# 5) Write a program that will ask for user's name. The program will then greet the user.
# If the user writes "name!" then the computer yells back to the user.

def display_greeting
  puts 'What is your name? '
  name = gets.chomp
  puts name.end_with?('!') ? "HELLO #{name.upcase} WHY ARE WE SCREAMING?" : "Hello #{name}."
end

# display_greeting

# 6) Print all odd numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

def display_odd_numbers
  (1..99).step(2) { |odd| puts odd }
end

# display_odd_numbers

# 7) Print all even numbers from 1 to 99, inclusive, to the console, with each number on a separate line.

def display_even_numbers
  (1..99).each { |number| puts number if number.even? }
end

# display_even_numbers

# 8) Write a program that asks the user to enter an integer greater than 0, then asks if the
# user wants to determine the sum or product of all numbers between 1 and the entered integer.

=begin
>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.
>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.
=end

def display_consecutive_int_operation
  puts 'Please enter an integer greater than 0: '
  numbers = (1..gets.chomp.to_i)
  puts 'Enter \'s\' to compute the same, \'p\' to compute the product.'
  operator = gets.chomp
  if operator == 'p'
    puts 'The product of integers between 1 and %<max>s is %<answer>s. ' % { max: numbers.max, answer: numbers.reduce(&:*) }
  elsif operator == 's'
    puts 'The sum of integers between 1 and %<max>s is %<answer>s. ' % { max: numbers.max, answer: numbers.reduce(&:+) }
  else puts 'Invalid operation! Thanks.'
  end
end

display_consecutive_int_operation

# 9) Take a look at the following code: What does this code print out? Think about it for a moment before continuing.

name = 'Bob'
save_name = name
name = 'Alice'
puts name, save_name

name = 'Bob'
save_name = name
name.upcase!
puts name, save_name

# What does this print out? Can you explain these results?

# BOB, BOB because both variables point to the same space in memory and upcase! is a destructive method.

# 10)  What will the following code print, and why? Don't run the code until you have tried to answer.

array1 = %w(Moe Larry Curly Shemp Harpo Chico Groucho Zeppo)
array2 = []
array1.each { |value| array2 << value }
array1.each { |value| value.upcase! if value.start_with?('C', 'S') }
puts array2

# The strings in array2 are the same objects as the ones in array 1. So the upcase! mutates them as well.