# 1) Write a method that determines and returns the ASCII string value of a string that is
#passed in as an argument. The ASCII string value is the sum of the ASCII values of every
#character in the string. (You may use String#ord to determine the ASCII value of a character.)

def ascii_value(string)
  string.chars.reduce(0) { |sum, item| sum + item.ord }
end

# p ascii_value('Four score') == 984
# p ascii_value('Launch School') == 1251
# p ascii_value('a') == 97
# p ascii_value('') == 0

# 2) The time of day can be represented as the number of minutes before or after midnight.
# If the number of minutes is positive, the time is after midnight. If the number of minutes
# is negative, the time is before midnight.
# Write a method that takes a time using this minute-based format and returns the time of
# day in 24 hour format (hh:mm). Your method should work with any integer input.
# You may not use ruby's Date and Time classes.

def time_of_day(int)
  total_min = int.abs.divmod(1440).last
  hours, minutes = total_min.divmod(60)
  if int.negative?
    '%02i:%02i' % [23 - hours, 60 - minutes]
  else
    '%02i:%02i' % total_min.divmod(60)
  end
end

# time_of_day(3000)

# time_of_day(0) == "00:00"
# time_of_day(-3) == "23:57"
# time_of_day(35) == "00:35"
# time_of_day(-1437) == "00:03"
# time_of_day(3000) == "02:00"
# time_of_day(800) == "13:20"
# time_of_day(-4231) == "01:29"

# 3) As seen in the previous exercise, the time of day can be represented as the
# number of minutes before or after midnight. If the number of minutes is positive,
# the time is after midnight. If the number of minutes is negative, the time is before midnight.

# Write two methods that each take a time of day in 24 hour format, and return the number
#of minutes before and after midnight, respectively. Both methods should return a value in the range 0..1439.
# You may not use ruby's Date and Time methods.

def after_midnight(string)
  string = string[0..1].gsub('24', '00') + string[2..-1]
  string[0..1].to_i * 60 + string[-2..-1].to_i
end

def before_midnight(string)
  after_midnight(string).zero? ? 0 : 1440 - after_midnight(string)
end

# p after_midnight('00:00') == 0
# p before_midnight('00:00') == 0
# p after_midnight('12:34') == 754
# p before_midnight('12:34') == 686
# p after_midnight('24:00') == 0
# p before_midnight('24:00') == 0

#4) Given a string of words separated by spaces, write a method that takes this string of words and returns
# a string in which the first and last letters of every word are swapped.

# You may assume that every word contains at least one letter, and that the string will always contain
#at least one word. You may also assume that each string contains nothing but words and spaces.


def swap(string)
  string.split.map do |word|
    word[0], word[-1] = word[-1], word[-0]
    word
  end.join(' ')
end

# p swap('Oh what a wonderful day it is') == 'hO thaw a londerfuw yad ti si'
# p swap('Abcde') == 'ebcdA'
# p swap('a') == 'a'

# 5) Given a string that consists of some words (all lowercased) and an assortment of non-alphabetic
# characters, write a method that returns that string with all of the non-alphabetic characters replaced
# by spaces. If one or more non-alphabetic characters occur in a row, you should only have one space in
# the result (the result should never have consecutive spaces).

def cleanup(string)
  string.gsub(/\W/, ' ').squeeze
end

#p cleanup("---what's my +*& line?") == ' what s my line '

#6) Write a method that takes a string with one or more space separated words and returns a hash that
#shows the number of words of different sizes.

#Words consist of any string of characters that do not include a space.

def word_sizes(string)
  sizes = Hash.new(0)
  string.split.each do |word|
    sizes[word.length] += 1
  end
  sizes
end


# p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
# p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
# p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
# p word_sizes('') == {}

# 7) Modify the word_sizes method from the previous exercise to exclude non-letters when
# determining word size. For instance, the length of "it's" is 3, not 4.

def second_word_sizes(string)
  string = string.gsub(/[^a-zA-Z ]/, '')
  word_sizes(string)
end

# p second_word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 2 }
# p second_word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 3 }
# p second_word_sizes("What's up doc?") == { 5 => 1, 2 => 1, 3 => 1 }
# p second_word_sizes('') == {}

# 8) Write a method that takes an Array of Integers between 0 and 19, and returns an Array of those
# Integers sorted based on the English words for each number:

# zero, one, two, three, four, five, six, seven, eight, nine, ten, eleven, twelve, thirteen,
# fourteen, fifteen, sixteen, seventeen, eighteen, nineteen

NUM_WORDS = { 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five', 6 => 'six', 7 => 'seven',
              8 => 'eight', 9 => 'nine', 10 => 'ten', 11 => 'eleven', 12 => 'tweleve', 13 => 'thirteen',
              14 => 'fourteen', 15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
              19 => 'nineteen', 0 => 'zero' }

def alphabetic_number_sort(array)
  array.sort_by { |number| NUM_WORDS[number] }
end

=begin
p alphabetic_number_sort((0..19).to_a) == [
  8, 18, 11, 15, 5, 4, 14, 9, 19, 1, 7, 17,
  6, 16, 10, 13, 3, 12, 2, 0
]
=end

# 9) Write a method that takes a string argument and returns a new string that contains the
# value of the original string with all consecutive duplicate characters collapsed into a
# single character. You may not use String#squeeze or String#squeeze!.

def crunch(string)
  arr = string.chars
  arr.each_with_object('').with_index do |(letter, sum), index|
    sum << letter if letter != arr[index + 1]
  end
end

# p crunch('ddaaiillyy ddoouubbllee') == 'daily double'
# p crunch('4444abcabccba') == '4abcabcba'
# p crunch('ggggggggggggggg') == 'g'
# p crunch('a') == 'a'
# p crunch('') == ''

# or with regex...

def crunch(string)
  string.gsub(/.{2}/) { |hit| hit[0] }
end

p crunch('ddaaiillyy ddoouubbllee') #== 'daily double'
p crunch('4444abcabccba')# == '4abcabcba'
p crunch('ggggggggggggggg') #== 'g'
p crunch('a') == 'a'
p crunch('') == ''

# 10) Write a method that will take a short line of text, and print it within a box.

def print_in_box(string)
  size = string.length
  puts "+-#{'-' * size}-+"
  puts "| #{' ' * size} |"
  puts "| #{string.center(size)} |"
  puts "| #{' ' * size} |"
  puts "+-#{'-' * size}-+"
end

print_in_box('To boldly go where no one has gone before.')
print_in_box('')

=begin
+--------------------------------------------+
|                                            |
| To boldly go where no one has gone before. |
|                                            |
+--------------------------------------------+

print_in_box('')
+--+
|  |
|  |
|  |
+--+
=end

# 11) You are given a method named spin_me that takes a string as an argument and returns
# a string that contains the same words, but with each word's characters reversed. Given
# the method's implementation, will the returned string be the same object as the one
# passed in as an argument or a different object?

def spin_me(str)
  str.split.each do |word|
    word.reverse!
  end.join(" ")
end

spin_me("hello world") # "olleh dlrow"

# different. We are creating all diff objects here.
