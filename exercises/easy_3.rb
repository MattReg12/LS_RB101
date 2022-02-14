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

# display_arithmetic_operations

# 3) Write a program that will ask a user for an input of a word or multiple
# words and give back the number of characters. Spaces should not be counted as a character.

def display_input_count
  puts 'Please write word or multiple words: '
  input = gets.chomp
  count = input.delete(' ').length
  puts 'There are %<count>s characters in %<input>s' % { count: count, input: input }
end

# display_input_count

# 4) Create a method that takes two arguments, multiplies them together, and returns the result.

def multiply(number1, number2)
  number1 * number2
end

# p multiply(5, 3)

# 5) Using the multiply method from the "Multiplying Two Numbers" problem,
# write a method that computes the square of its argument (the square is the
# result of multiplying a number by itself).


def square(number, power)
  multiply(number, number)
end

=begin
What if we wanted to generalize this method to a "power to the n" type method:
cubed, to the 4th power, to the 5th, etc. How would we go about doing so
while still using the multiply method?
=end

def exponent(number, power)
  arr = [number] * (power - 1)
  arr.reduce(number) { |num, sum| multiply(sum, num) }
end

# 6) The || operator returns a truthy value if either or both of its operands are
# truthy. If both operands are falsey, it returns a falsey value. The &&
#operator returns a truthy value if both of its operands are truthy, and a
#falsey value if either operand is falsey. This works great until you need only
#one of two conditions to be truthy, the so-called exclusive or.

# In this exercise, you will write a function named xor that takes two
# arguments, and returns true if exactly one of its arguments is truthy,
# false otherwise. Note that we are looking for a boolean result instead of
# a truthy/falsy value as returned by || and &&.

def xor?(bool1, bool2)
  [bool1, bool2].uniq.length == 2
end

# p xor?(5.even?, 4.even?) == true
# p xor?(5.odd?, 4.odd?) == true
# p xor?(5.odd?, 4.even?) == false
# p xor?(5.even?, 4.odd?) == false


# 7) Write a method that returns an Array that contains every other element
#of an Array that is passed in as an argument. The values in the returned
# list should be those values that are in the 1st, 3rd, 5th, and so on
# elements of the argument Array.

def oddities(array)
  array.delete_if.with_index { |element, idx| idx.odd? }
end

# p oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
# p oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
# p oddities(['abc', 'def']) == ['abc']
# p oddities([123]) == [123]
# p oddities([]) == []

# 8) Write a method that returns true if the string passed as an argument is
# a palindrome, false otherwise. A palindrome reads the same forward and
#backward. For this exercise, case matters as does punctuation and spaces.

def palindrome?(string)
  string == string.reverse
end

# p palindrome?('madam') == true
# p palindrome?('Madam') == false          # (case matters)
# p palindrome?("madam i'm adam") == false # (all characters matter)
# p palindrome?('356653') == true

# 9) Write another method that returns true if the string passed as an
# argument is a palindrome, false otherwise. This time, however, your
# method should be case-insensitive, and it should ignore all
#non-alphanumeric characters. If you wish, you may simplify things by
#calling the palindrome? method you wrote in the previous exercise.

def real_palindrome?(string)
  string = string.delete(',\' ')
  string.casecmp?(string.reverse)
end

p real_palindrome?('madam') == true
p real_palindrome?('Madam') == true           # (case does not matter)
p real_palindrome?("Madam, I'm Adam") == true # (only alphanumerics matter)
p real_palindrome?('356653') == true
p real_palindrome?('356a653') == true
p real_palindrome?('123ab321') == false

# 10) Write a method that returns true if its integer argument is palindromic,
# false otherwise. A palindromic number reads the same forwards and backwards.

def palindromic_number?(number)
  number.to_s == number.to_s.reverse
end

p palindromic_number?(34543) == true
p palindromic_number?(123210) == false
p palindromic_number?(22) == true
p palindromic_number?(5) == true