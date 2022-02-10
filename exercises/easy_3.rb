# 1) Write a program that solicits 6 numbers from the user, then prints a
#message that describes whether or not the 6th number appears amongst the first 5 numbers.

=begin
==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].
=end

def display_included_int
  int_list = []
  5.times do |number|
    puts "Please enter number #{number + 1}: "
    int_list << gets.chomp.to_i
  end
  puts 'Please enter the final number:'
  final_number = gets.chomp.to_i
  answer = int_list.include?(final_number) ? 'appears' : 'does not appear'
  puts 'The number %<final_number>s %<answer>s in %<int_list>s.' % { final_number: final_number, answer: answer, int_list: int_list }
end

# display_included_int

# 2) Write a program that prompts the user for two positive integers, and then prints
# the results of the following operations on those two numbers: addition, subtraction,
# product, quotient, remainder, and power. Do not worry about validating the input.

=begin

==> Enter the first number:
23
==> Enter the second number:
17
==> 23 + 17 = 40
==> 23 - 17 = 6
==> 23 * 17 = 391
==> 23 / 17 = 1
==> 23 % 17 = 6
==> 23 ** 17 = 141050039560662968926103
=end

def display_arithmetic_operations
  puts 'Enter the first number: '
  number_1 = gets.chomp
  puts 'Enter the second number: '
  number_2 = gets.chomp
  ['+', '-', '*', '/', '%', '**'].each do |operation|
    puts "#{number_1} #{operation} #{number_2} = #{eval(number_1 + operation + number_2)}"
  end
end

display_arithmetic_operations


