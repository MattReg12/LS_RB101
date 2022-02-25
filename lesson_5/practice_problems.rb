#1) How would you order this array of number strings by descending numeric value?

arr = ['10', '11', '9', '7', '8']

arr.sort! { |a, b| b.to_i <=> a.to_i }

#p arr

#2) How would you order this array of hashes based on the year of publication of
# each book, from the earliest to the latest?


books = [
  {title: 'One Hundred Years of Solitude', author: 'Gabriel Garcia Marquez', published: '1967'},
  {title: 'The Great Gatsby', author: 'F. Scott Fitzgerald', published: '1925'},
  {title: 'War and Peace', author: 'Leo Tolstoy', published: '1869'},
  {title: 'Ulysses', author: 'James Joyce', published: '1922'}
]

#p books.sort_by { |hash| hash[:published].to_i }

#3) For each of these collection objects demonstrate how you would reference the letter 'g'.

arr1 = ['a', 'b', ['c', ['d', 'e', 'f', 'g']]]

# p arr1[2][1][3]

arr2 = [{first: ['a', 'b', 'c'], second: ['d', 'e', 'f']}, {third: ['g', 'h', 'i']}]

# p arr2[1][:third][0]

arr3 = [['abc'], ['def'], {third: ['ghi']}]

# p arr3[2][:third][0][0]

hsh1 = {'a' => ['d', 'e'], 'b' => ['f', 'g'], 'c' => ['h', 'i']}

# p hsh1['b'][1]

hsh2 = {first: {'d' => 3}, second: {'e' => 2, 'f' => 1}, third: {'g' => 0}}

# p hsh2[:third].keys[0]

# 4) For each of these collection objects where the value 3 occurs, demonstrate how you
# would change this to 4.

arr1 = [1, [2, 3], 4]

arr1[1][1] = 4

# p arr1

arr2 = [{a: 1}, {b: 2, c: [7, 6, 5], d: 4}, 3]

arr2[2] = 4

# p arr2

hsh1 = {first: [1, 2, [3]]}

hsh1[:first][2][0] = 4

# p hsh1

hsh2 = {['a'] => {a: ['1', :two, 3], b: 4}, 'b' => 5}

hsh2[['a']][:a][2] = 4

# p hsh2

#5) figure out the total age of just the male members of the family

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

x = munsters.reduce(0) do |age_sum, (name, details)|
  munsters[name]['gender'] == 'male' ? age_sum += munsters[name]['age'] : age_sum += 0
end

p x

#6) One of the most frequently used real-world string properties is that of "string
# substitution", where we take a hard-coded string and modify it with various
#parameters from our program.

#Given this previously seen family hash, print out the name, age and gender of
# each family member:

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

# (Name) is a (age)-year-old (male or female).

=begin
munsters.each do |name, details_hash|
  puts "#{name} is a #{munsters[name]['age']}-year-old #{munsters[name]['gender']}."
end
=end

#7) Given this code, what would be the final values of a and b?
# Try to work this out without running the code.

a = 2
b = [5, 8]
arr = [a, b]

arr[0] += 2
arr[1][0] -= a

# a == 2
# b == [3,8]

#8) Using the each method, write some code to output all of the vowels
# from the strings.

hsh = {first: ['the', 'quick'], second: ['brown', 'fox'], third: ['jumped'], fourth: ['over', 'the', 'lazy', 'dog']}

=begin
hsh.values.flatten.join.chars.each do |letter|
  puts letter if letter =~ /[aeiou]/
end
=end

#9 Given this data structure, return a new array of the same structure but with
# the sub arrays being ordered (alphabetically or numerically as appropriate) in
# descending order.

arr = [['b', 'c', 'a'], [2, 1, 3], ['blue', 'black', 'green']]

arr.map! { |sub_arr| sub_arr.sort { |a, b| b <=> a } }

# p arr

# 10) Given the following data structure and without modifying the original array,
# use the map method to return a new array identical in structure to the original
# but where the value of each integer is incremented by 1.

arr = [{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}]

foo = arr.map do |hash|
  hash.map do |key, value|
    [[key, value + 1]].to_h
  end
end.flatten

# p arr
# p foo

# 11) Given the following data structure use a combination of methods, including
# either the select or reject method, to return a new array identical in structure
# to the original but containing only the integers that are multiples of 3.

arr = [[2], [3, 5, 7], [9], [11, 13, 15]]

arr.each { |sub_arr| sub_arr.keep_if { |num| (num % 3).zero? } }

# p arr

#12) Given the following data structure, and without using the Array#to_h method,
# write some code that will return a hash where the key is the first item in each sub array
# and the value is the second item.

arr = [[:a, 1], ['b', 'two'], ['sea', {c: 3}], [{a: 1, b: 2, c: 3, d: 4}, 'D']]
# expected return value: {:a=>1, "b"=>"two", "sea"=>{:c=>3}, {:a=>1, :b=>2, :c=>3, :d=>4}=>"D"}

some_hash = {}

arr.each { |sub_arr| some_hash[sub_arr.first] = sub_arr.last }

# 13) Given the following data structure, return a new array containing the same
# sub-arrays as the original but ordered logically by only taking into consideration
# the odd numbers they contain.

arr = [[1, 6, 9], [6, 1, 7], [1, 8, 3], [1, 5, 9]]

x = arr.sort_by do |sub_arr|
  sub_arr.reduce(0) do |sum, num|
    num.odd? ? sum += num : sum += 0
  end
end

# p x

# 14) Given this data structure write some code to return an array containing the colors
# of the fruits and the sizes of the vegetables. The sizes should be uppercase and the colors
# should be capitalized

hsh = {
  'grape' => {type: 'fruit', colors: ['red', 'green'], size: 'small'},
  'carrot' => {type: 'vegetable', colors: ['orange'], size: 'medium'},
  'apple' => {type: 'fruit', colors: ['red', 'green'], size: 'medium'},
  'apricot' => {type: 'fruit', colors: ['orange'], size: 'medium'},
  'marrow' => {type: 'vegetable', colors: ['green'], size: 'large'},
}

arr = []

hsh.each_value do |sub_hash|
  if sub_hash[:type] == 'fruit'
    arr << sub_hash[:colors].map(&:capitalize)
  else arr << sub_hash[:size].upcase
  end
end

# p arr

# 15) Given this data structure write some code to return an array which contains only the
# hashes where all the integers are even.

arr = [{a: [1, 2, 3]}, {b: [2, 4, 6], c: [3, 6], d: [4]}, {e: [8], f: [6, 10]}]

arr2 = arr.each_with_object([]) do |hash, arr2|
  arr2 << hash if hash.values.flatten.all? { |num| num.even? }
end

# p arr2

# 16)

HEX_CHARS = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', 'a', 'b', 'c', 'd', 'e', 'f']
DASH_INDICES = [8, 13, 18, 23]

def gen_uuid
  str = ''
  32.times { str << HEX_CHARS.sample }
  DASH_INDICES.each { |idx| str.insert(idx,'-') }
  str
end

puts gen_uuid