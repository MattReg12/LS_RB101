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


p word_sizes('Four score and seven.') == { 3 => 1, 4 => 1, 5 => 1, 6 => 1 }
p word_sizes('Hey diddle diddle, the cat and the fiddle!') == { 3 => 5, 6 => 1, 7 => 2 }
p word_sizes("What's up doc?") == { 6 => 1, 2 => 1, 4 => 1 }
p word_sizes('') == {}

# 7)
