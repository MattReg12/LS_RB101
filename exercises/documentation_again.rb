# 1) Locate the ruby documentation for methods File::path and File#path. How are they different?

# One is a class method and the other is an instance method.

# 2) What will each print?

require 'date'

puts Date.civil # '2022-02-18"' # WRONG - Check the optional arguments"
puts Date.civil(2016) # "2016-01-01"
puts Date.civil(2016, 5) # 2016-05-01"
puts Date.civil(2016, 5, 13) # "2016-05-13"

# 3) Consider the following method and a call to that method:

def my_method(a, b = 2, c = 3, d)
  p [a, b, c, d]
end

my_method(4, 5, 6)

# [4, 5, 3, 6 ]

# 4) The Array#bsearch method is used to search ordered Arrays more quickly than #find and
#select can. Assume you have the following code: How would you search this Array to find
# the first element whose value exceeds 8?

a = [1, 4, 8, 11, 15, 19]

p a.bsearch { |num| num > 8 }


# 5) What do each of these puts statements output?

a = %w(a b c d e)
# puts a.fetch(7) # INDEX ERROR
puts a.fetch(7, 'beats me') # BEATS ME
puts a.fetch(7) { |index| index**2 } # 49

# 6) What does this code print?

5.step(to: 10, by: 3) { |value| puts value }

# 5, 8

# 7) Use irb to run the following code:

s = 'abc'
#puts s.public_methods.inspect

=begin
You should find that it prints a list of all of the public methods available to the String s;
this includes not only those methods defined in the String class, but also methods that are
inherited from Object (which inherits other methods from the BasicObject class and the Kernel
module). That's a lot of methods.

How would you modify this code to print just the public methods that are defined or overridden
by the String class? That is, the list should exclude all members that are only defined in Object,
BasicObject, and Kernel.
=end

#puts s.public_methods(false)

# 8) Find the documentation for the #min method and change the above code to print the two
# smallest values in the Array.

a = [5, 9, 3, 11]
puts a.min(2)

# 9) Sometimes, the documentation is going to leave you scratching your head.
# In a very early assignment at Launch School, you are tasked with writing a program
# that loads some text messages from a YAML file. We do this with YAML::load_file:

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

# Find the documentation for YAML::load_file.

# This is not in ruby lang docs.
