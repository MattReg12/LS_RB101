require 'yaml'

SUITS = [' of Hearts', ' of Spades', ' of Diamonds', ' of Clubs']
CARD_NAMES = [2, 3, 4, 5, 6, 7, 8, 9, 10, 'Jack', 'Queen', 'King', 'Ace']
DECK_VALUES = {'2' => 2, '3' => 3, '4' => 4, '5' => 5, '6' => 6, '7' => 7,
               '8' => 8, '9' => 9, '1' => 10, 'J' => 10, 'Q' => 10,
               'K' => 10, 'A' => 11 }
MESSAGES = YAML.load_file('msgs.yml')
