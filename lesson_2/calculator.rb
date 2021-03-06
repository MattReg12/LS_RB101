# Assignment 6

require 'yaml'
MESSAGES = YAML.load_file('calculator_messages.yml')

def prompt(message)
  puts "=> #{message}"
end

def operand(str)
  loop do
    prompt('Please input your %s: ' % str)
    input = gets.chomp
    break input.to_f if operand_valid?(input)
    prompt(MESSAGES['en']['error'])
  end
end

def operator
  loop do
    prompt('Please input what operation you would like to perform: * + - or / ')
    input = gets.chomp
    break input.intern if operator_valid?(input)
    prompt(MESSAGES['en']['error'])
  end
end

def operand_valid?(str)
  str.to_i.to_s == str
end

def operator_valid?(str)
  ['*', '/', '+', '-'].include?(str)
end

loop do
  prompt(MESSAGES['en']['welcome'])
  operand1 = operand('first number')
  operator1 = operator
  operand2 = operand('second number')
  prompt('Your answer is : %s' % (operand1.send operator1, operand2))
end
