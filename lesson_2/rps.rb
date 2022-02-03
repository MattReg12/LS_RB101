VALID_CHOICES      = ['rock', 'paper', 'scissors', 'lizard', 'spock']

WINNING_CONDITIONS = ['rockscissors', 'rocklizard', 'paperrock', 'paperspock',
                      'scissorspaper', 'paperlizard', 'spockrock',
                      'spockscissors', 'lizardspock', 'lizardpaper']

TIE_CONDITIONS     = ['rockrock', 'paperpaper', 'scissorsscissors',
                      'spockspock', 'lizardlizard']

def prompt(message)
  puts "=> #{message}\n"
  puts "\n"
end

def determine_winner(player, computer)
  if WINNING_CONDITIONS.include?(player + computer)
    'You'
  elsif TIE_CONDITIONS.include?(player + computer)
    'tie'
  else 'The Computer'
  end
end

def display_results(winner)
  winner == 'tie' ? prompt('Its a tie') : prompt("#{winner} won!")
end

def display_score(player_score, computer_score)
  prompt("The score is now You: #{player_score} Computer: #{computer_score}")
end

def format_selection(player)
  case player
  when 'r' then 'rock'
  when 'p' then 'paper'
  when 'sc' then 'scissors'
  when 'l' then 'lizard'
  when 'sp' then 'spock'
  else player
  end
end

loop do
  choice = ''
  winner = ''
  player_score = 0
  computer_score = 0
  prompt("Welcome to Rock-Paper-Scissors-Lizard-Spock. The first
  to three wins.")

  loop do
    loop do
      prompt("Choose one: #{VALID_CHOICES.join(', ')}. You may also enter an
      abbrevation of your choice (r, p, sc, l, sp).")
      choice = format_selection(gets.chomp)
      if VALID_CHOICES.include?(choice)
        break
      else
        prompt('Thats not a valid choice.')
      end
    end

    computer_choice = format_selection(VALID_CHOICES.sample)

    prompt("You have chosen #{choice}; Computer chose: #{computer_choice}")

    winner = determine_winner(choice, computer_choice)
    player_score += 1 if winner == 'You'
    computer_score += 1 if winner == 'The Computer'

    display_results(winner)
    display_score(player_score, computer_score)

    break if player_score == 3 || computer_score == 3
  end
  prompt("#{winner} won!")
  prompt('Do you want to play again?')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt('Thank you for playing. Goodbye!!')
