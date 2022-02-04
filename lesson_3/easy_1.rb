# Practice Problems: Easy 1


# 1)

# What would you expect the code below to print out?

numbers = [1, 2, 2, 3]
numbers.uniq

puts numbers

# Just the original numbers array because uniq is non-mutating

# 2) Describe the difference between ! and ? in Ruby. And explain what would happen in the following scenarios:

# The bang operator negates the boolean value of an object. The ? is only used in a ternary operation or
# typically used in a method name that returns a boolean.

=begin
what is != and where should you use it? --- Not equal. In a comparison operation
put ! before something, like !user_name --- Negates boolean value
put ! after something, like words.uniq! --- Used syntactically to indicate a method is mutating
put ? before something --- Only used in ternary
put ? after something --- Only used in ternary or at end of boolean returning method
put !! before something, like !!user_name --- negates negation returning object to original boolean state.
=end

#3)

# Replace the word "important" with "urgent" in this string:

advice = "Few things in life are as important as house training your pet dinosaur."

advice.gsub!('important', 'urgent')

#4) The Ruby Array class has several methods for removing items from the array. Two of them have very similar names. Let's see how they differ:

numbers = [1, 2, 3, 4, 5]

# What do the following method calls do (assume we reset numbers to the original array between method calls)?

numbers.delete_at(1) # deletes 2 at index 1
numbers.delete(1) # deletes the 1 at index 0

#5) Programmatically determine if 42 lies between 10 and 100.

42.between?(10,100)
(10..100) === 42

#6) Starting with the string: show two different ways to put the expected "Four score and " in front of it.

famous_words = "seven years ago..."

famous_words.insert(0, "Four score and ")
famous_words = "Four score and " + famous_words

#7) If we build an array like this:

flintstones = ["Fred", "Wilma"]
flintstones << ["Barney", "Betty"]
flintstones << ["BamBam", "Pebbles"]

# We will end up with this "nested" array: Make this into an un-nested array.

["Fred", "Wilma", ["Barney", "Betty"], ["BamBam", "Pebbles"]]

p flintstones.flatten!

#8) Question 8 Given the hash below

flintstones = { "Fred" => 0, "Wilma" => 1, "Barney" => 2, "Betty" => 3, "BamBam" => 4, "Pebbles" => 5 }

# Turn this into an array containing only two elements: Barney's name and Barney's number

p flintstones.assoc('Barney')

