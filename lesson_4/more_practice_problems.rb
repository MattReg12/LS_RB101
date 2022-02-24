# 1) Turn this array into a hash where the names are the keys and the values are the positions in the array.

flintstones = ["Fred", "Barney", "Wilma", "Betty", "Pebbles", "BamBam"]

x = flintstones.each_with_object({}).with_index do |(flintstone, hash), idx|
  hash[flintstone] = idx
end


# 2) Add up all of the ages from the Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.sum

# 3) remove people with age 100 and greater.

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 402, "Eddie" => 10 }

# p ages.keep_if { |munster, age| age < 100 }

# 4) Pick out the minimum age from our current Munster family hash:

ages = { "Herman" => 32, "Lily" => 30, "Grandpa" => 5843, "Eddie" => 10, "Marilyn" => 22, "Spot" => 237 }

# p ages.values.min

# 5) Find the index of the first name that starts with "Be"

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.index { |name| name.start_with?('Be') }

# 6) Amend this array so that the names are all shortened to just the first three characters:

flintstones = %w(Fred Barney Wilma Betty BamBam Pebbles)

# p flintstones.map { |name| name[0..2] }

# 7) Create a hash that expresses the frequency with which each letter occurs in this string:

statement = "The Flintstones Rock"

letter_count = Hash.new(0)

statement.chars.each { |letter| letter_count[letter] += 1 }

# p letter_count

# 8)

# 9) As we have seen previously we can use some built-in string methods to change the case of a string.
# A notably missing method is something provided in Rails, but not in Ruby itself...titleize. This
# method in Ruby on Rails creates a string that has each word capitalized as it would be in a title.
# Write your own version of the rails titleize implementation.

words = "the flintstones rock"

def titleize(string)
  words = string.split
  words.map!(&:capitalize)
  words.join(' ')
end

p titleize(words)

# 10) Modify the hash such that each member of the Munster family has an additional "age_group" key
# that has one of three values describing the age group the family member is in (kid, adult, or senior).
# Your solution should produce the hash below

munsters = {
  "Herman" => { "age" => 32, "gender" => "male" },
  "Lily" => { "age" => 30, "gender" => "female" },
  "Grandpa" => { "age" => 402, "gender" => "male" },
  "Eddie" => { "age" => 10, "gender" => "male" },
  "Marilyn" => { "age" => 23, "gender" => "female"}
}

munsters.each do |munster, hash|
  if hash['age'] < 18
    hash['age_group'] = 'kid'
  elsif hash['age'] > 65
    hash['age_group'] = 'senior'
  else
    hash['age_group'] = 'adult'
  end
end

p munsters