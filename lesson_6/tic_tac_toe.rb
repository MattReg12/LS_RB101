require 'yaml'
require_relative 'computer_ai.rb'

MESSAGES = YAML.load_file('messages.yml')

LINES = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8],
         [0, 4, 8], [2, 4, 6]]

def display_board(board_spaces)
  puts prompt(MESSAGES['board_status'])
  puts <<-BOARD
         |         |
     #{board_spaces[0]}   |    #{board_spaces[1]}    |    #{board_spaces[2]}
         |         |
----------------------------
         |         |
     #{board_spaces[3]}   |    #{board_spaces[4]}    |    #{board_spaces[5]}
         |         |
----------------------------
         |         |
     #{board_spaces[6]}   |    #{board_spaces[7]}    |    #{board_spaces[8]}
         |         |
BOARD
end

def prompt(message)
  puts "=> #{message}\n\n"
end

def markers
  marker = nil
  loop do
    prompt(MESSAGES['marker_selection'])
    marker = gets.chomp.upcase
    break marker if valid_marker?(marker)
    prompt(MESSAGES['marker_error'])
  end
  marker == 'X' ? ['X', 'O'] : ['O', 'X']
end

def valid_marker?(marker)
  ['X', 'O'].include?(marker)
end

def player_order(player_marker)
  player_marker == 'X' ? ['You', 'Computer'] : ['Computer', 'You']
end

def choice(player, board_spaces, ai_marker, player_marker)
  if player == 'You'
    human_choice(board_spaces)
  else ai_choice(board_spaces, ai_marker, player_marker)
  end
end

def human_choice(board_spaces)
  loop do
    prompt(MESSAGES['space_selection'])
    space = gets.chomp
    break space if valid_space?(space, board_spaces)
    prompt(MESSAGES['space_error'])
  end
end

def valid_space?(space, board_spaces)
  return false if space.to_i.to_s != space

  available_spaces = board_spaces.select { |box| box.is_a?(Integer) }
  available_spaces.include?(space.to_i)
end

def input_to_board(choice, board_spaces, marker = 'X')
  board_spaces[choice.to_i] = marker
end

def game_ended?(board_spaces)
  board_full?(board_spaces) || someone_won?(board_spaces)
end

def board_full?(board_spaces)
  board_spaces.all? { |space| space.is_a?(String) }
end

def someone_won?(board_spaces)
  lines = current_lines(board_spaces)
  lines.any? { |line| ['XXX', 'OOO'].include?(line.join) }
end

def current_lines(board_spaces)
  LINES.map do |line|
    line.map { |index| board_spaces[index] }
  end
end

def game_tied?(board_spaces)
  lines = current_lines(board_spaces)
  lines.none? { |line| ['XXX', 'OOO'].include?(line.join) }
end

def winning_marker(board_spaces)
  return nil if game_tied?(board_spaces)

  lines = current_lines(board_spaces)
  lines.each do |line|
    return line.first if ['XXX', 'OOO'].include?(line.join)
  end
end

def play_again?
  prompt(MESSAGES['play_again'])
  answer = gets.chomp.upcase
  answer == 'Y'
end

player_marker = nil
ai_marker = nil
first_player = nil
second_player = nil

loop do
  loop do
    board_spaces = *(0..8).to_a
    prompt(MESSAGES['welcome'])

    player_marker, ai_marker = markers
    first_player, second_player = player_order(player_marker)

    loop do
      display_board(board_spaces)
      x_choice = choice(first_player, board_spaces, ai_marker, player_marker)
      input_to_board(x_choice, board_spaces)
      prompt(MESSAGES['commentary'] % [first_player, 'X', x_choice])
      break if game_ended?(board_spaces)
      system 'clear'

      display_board(board_spaces)
      o_choice = choice(second_player, board_spaces, ai_marker, player_marker)
      input_to_board(o_choice, board_spaces, 'O')
      prompt(MESSAGES['commentary'] % [second_player, 'O', o_choice])
      sleep(3)
      break if game_ended?(board_spaces)
      system 'clear'
    end

    if game_tied?(board_spaces)
      prompt(MESSAGES['tie_game'])
    else
      winner = winning_marker(board_spaces)
      player_marker == winner ? prompt(MESSAGES['win']) : prompt(MESSAGES['loss'])
    end
    break
  end

  next if play_again?
  break prompt(MESSAGES['farewell'])
end
