require 'yaml'

MESSAGES = YAML.load_file('loan_calc.yml')

def prompt(message)
  puts '=> %s' % message
end

def valid_number?(str)
  str.to_i.to_s == str
end

def validation_loop(str)
  loop do
    answer = gets.chomp
    answer.gsub!(/[\W]/, '')
    break answer.to_f if valid_number?(answer)
    prompt('That doesn\'t look quite right. Please try again. ')
    prompt(MESSAGES[str])
  end
end

def payment_calc(loan_amount, interest_rate, remaining_term)
  monthly_rate = (interest_rate / 12) / 100
  '$%.2f' % (loan_amount * ((monthly_rate) / (1 - (1 + monthly_rate)**(-remaining_term))))
end

loop do
  prompt(MESSAGES['welcome'])
  prompt(MESSAGES['loan_amount'])
  loan_amount = validation_loop('loan_amount')
  prompt(MESSAGES['interest_rate'])
  interest_rate = validation_loop('interest_rate')
  prompt(MESSAGES['remaining_term'])
  remaining_term = validation_loop('remaining_term')
  prompt(MESSAGES['payment_amount'] % payment_calc(loan_amount, interest_rate, remaining_term))
  prompt(MESSAGES['again?'])
  break prompt(MESSAGES['farewell']) if gets.chomp.downcase == 'n'
end