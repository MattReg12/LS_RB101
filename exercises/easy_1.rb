# 1) Write a method that takes two arguments, a string and a positive integer, and prints the string as many times as the integer indicates.

def output_repeated_phrase(phrase, repititions)
  repititions.times { puts phrase }
end

output_repeated_phrase('Hello', 3)

# 2) Write a method that takes one integer argument, which may be positive, negative, or zero.
# This method returns true if the number's absolute value is odd. You may assume that the argument is a valid integer value.
# Keep in mind that you're not allowed to use #odd? or #even? in your solution.

def is_odd?(integer)
  (integer % 2).positive?
end

p is_odd?(2)   == false
p is_odd?(5)   == true
p is_odd?(-17) == true
p is_odd?(-8)  == false
p is_odd?(0)   == false
p is_odd?(7)   == true

# 3) Write a method that takes one argument, a positive integer, and returns a list of the digits in the number.

# could use digits.reverse

def digit_list(integer)
  integer.to_s.chars.each_with_object([]) { |number, list| list << number.to_i }
end

puts digit_list(12345) == [1, 2, 3, 4, 5]
puts digit_list(7) == [7]
puts digit_list(375290) == [3, 7, 5, 2, 9, 0]
puts digit_list(444) == [4, 4, 4]

# 4) Write a method that counts the number of occurrences of each element in a given array.

def count_occurrences(array)
  array.each_with_object({}) do |item, count|
    count[item.downcase].nil? ? count[item] = 1 : count[item] += 1
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

p count_occurrences(vehicles)

=begin
car => 4
truck => 3
SUV => 1
motorcycle => 2
=end

# 5) Write a method that takes one argument, a string, and returns a new string with the words in reverse order.

def reverse_sentence(sentence)
  sentence.split.reverse.join(' ')
end

puts reverse_sentence('Hello World') == 'World Hello'
puts reverse_sentence('Reverse these words') == 'words these Reverse'
puts reverse_sentence('') == ''
puts reverse_sentence('    ') == '' # Any number of spaces results in ''

# 6) Write a method that takes one argument, a string containing one or more words, and returns the given string with
# words that contain five or more characters reversed. Each string will consist of only letters and spaces. Spaces
# should be included only when more than one word is present.

def reverse_words(words)
  words.split.map { |word| word.length > 4 ? word.reverse : word }.join(' ')
end

puts reverse_words('Professional')          # => lanoisseforP
puts reverse_words('Walk around the block') # => Walk dnuora the kcolb
puts reverse_words('Launch School')         # => hcnuaL loohcS

# 7) Write a method that takes one argument, a positive integer, and returns a string of alternating 1s and 0s,
# always starting with 1. The length of the string should match the given integer.

def stringy(integer)
  integer.even? ? '10' * (integer / 2) : ('10' * (integer / 2)) + '1'
end

puts stringy(6) == '101010'
puts stringy(9) == '101010101'
puts stringy(4) == '1010'
puts stringy(7) == '1010101'

# 8) Write a method that takes one argument, an array containing integers, and returns the average of all numbers in the array.
# The array will never be empty and the numbers will always be positive integers. Your result should also be an integer.

def average(array)
  array.sum / array.length
end

puts average([1, 6]) == 3
puts average([1, 5, 87, 45, 8, 8]) == 25
puts average([9, 47, 23, 95, 16, 52]) == 40

# 9) Write a method that takes one argument, a positive integer, and returns the sum of its digits.

def sum(integer)
  integer.digits.sum
end

puts sum(23) == 5
puts sum(496) == 19
puts sum(123_456_789) == 45

# 10) Write a method that takes two arguments, a positive integer and a boolean, and calculates the bonus for a given salary.
#If the boolean is true, the bonus should be half of the salary. If the boolean is false, the bonus should be 0.

def calculate_bonus(salary, bonus_issued)
  bonus_issued ? salary / 2 : 0
end

puts calculate_bonus(2800, true) == 1400
puts calculate_bonus(1000, false) == 0
puts calculate_bonus(50000, true) == 25000
