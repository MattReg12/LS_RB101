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

def display_hand(participant, hand)
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

def turn(participant, hand, deck)
  loop do
    display_hand(participant, hand)
    decision = participant == 'Player' ? player_decision : dealer_decision(hand)
    process(participant, decision, hand, deck)
    sleep(3)
    break if decision == 'stay' || busted?(hand)
  end
end

def process(participant, decision, hand, deck)
  prompt(MESSAGES['decision_commentary'] % [participant, decision])
  if decision == 'hit'
    deal_card(hand, deck)
    prompt(MESSAGES['card_dealt'] % [participant, hand.last])
  end
end

def player_decision
  loop do
    prompt(MESSAGES['player_decision'])
    decision = gets.chomp
    break decision if decision_valid?(decision)
    prompt(MESSAGES['invalid_decision'])
  end
end

def decision_valid?(decision)
  ['hit', 'stay'].include?(decision.downcase)
end

def dealer_decision(hand)
  value(hand) < 17 ? 'hit' : 'stay'
end

def winner(hands)
  hands.map! { |hand| hand > 21 ? 0 : hand }
  hands.first > hands.last ? 'Player' : 'Dealer'
end

def display_winner(participant)
  if participant == 'Player'
    prompt(MESSAGES['player_winner'])
  else prompt(MESSAGES['dealer_winner'])
  end
end

loop do
  prompt(MESSAGES['welcome'])
  current_deck = deck.shuffle
  player_hand = []
  dealer_hand = []

  loop do
    prompt(MESSAGES['dealing'])
    deal_starting_hands(player_hand, dealer_hand, current_deck)
    sleep(3)
    display_hand('dealer_one_card', [dealer_hand.first])

    turn('Player', player_hand, current_deck)
    break if busted?(player_hand)
    turn('Dealer', dealer_hand, current_deck)
    break
  end

  final_hand_values = [value(player_hand), value(dealer_hand)]
  round_winner = winner(final_hand_values)
  prompt(MESSAGES['final_score'] % final_hand_values)
  display_winner(round_winner)
  break # if not want to play again
end