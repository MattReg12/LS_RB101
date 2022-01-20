# Assignment 6

def operand(str)
  loop do
    puts 'Please input your %s: ' % str
    input = gets.chomp
    break input.to_f if operand_valid?(input)
    puts 'That didn\'t look quite right. Please try again.'
  end
end

def operator
  loop do
    puts 'Please input what operation you would like to perform: * + - or / '
    input = gets.chomp
    break input.intern if operator_valid?(input)
    puts 'That didn\'t look quite right. Please try again.'
  end
end

def operand_valid?(str)
  str.to_i.to_s == str
end

def operator_valid?(str)
  ['*', '/', '+', '-'].include?(str)
end

while true
  puts 'Hello and welcome to calculator!'
  operand1 = operand('first number')
  operator1 = operator
  operand2 = operand('second number')
  puts 'Your answer is : %s' % (operand1.send operator1, operand2)
end
