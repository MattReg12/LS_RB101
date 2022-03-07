require 'yaml'

SUITS = [' of Hearts', ' of Spades', ' of Diamonds', ' of Clubs']
CARD_NAMES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
DECK_VALUES = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
               '8' => 8, '9' => 9, '1' => 10, 'J' => 10, 'Q' => 10,
               'K' => 10, 'A' => 11 }
MESSAGES = YAML.load_file('msgs.yml')

def prompt(message)
  puts "=> %s\n\n" % message
end

def deck
  deck = CARD_NAMES.product(SUITS)
  deck.map(&:join)
end

def deal_card(hand, deck)
  hand << deck.pop
end

def deal_starting_hands(player_hand, dealer_hand, deck)
  2.times { deal_card(dealer_hand, deck) }
  2.times { deal_card(player_hand, deck) }
end

def display_hands(participant, hand)
  prompt(MESSAGES[participant] % [hand.join(' and '), value(hand)])
end

def value(hand)
  total = hand.reduce(0) { |sum, card| sum + DECK_VALUES[card[0]] }
  ace_handler(hand, total)
end

def ace_handler(hand, total)
  return total if hand.none? { |card| card[0] == 'A' }

  total <= 21 ? total : (total - 10)
end

def busted?(hand)
  value(hand) > 21
end

def player_turn(hand, deck)
  loop do
    decision = player_input
    break if decision == 'stay'
    deal_card(player_hand, deck)
    break if busted?(hand)
  end
end

def player_input
  loop do
    prompt(MESSAGES['player_decision'])
    decision = gets.chomp
    break decision if decision_valid?
    prompt(MESSAGES['invalid_decision'])
  end
end

def decision_valid?(decision)
  ['hit', 'stay', 'h', 's'].include?(decision.downcase)
end


loop do
  prompt(MESSAGES['welcome'])
  loop do
    current_deck = deck.shuffle
    player_hand = []
    dealer_hand = []

    prompt(MESSAGES['dealing'])
    deal_starting_hands(player_hand, dealer_hand, current_deck)
    sleep(3)

    display_hand('dealer_before', [dealer_hand.first])
    display_hand('player', player_hand)
    break
  end
  break
end