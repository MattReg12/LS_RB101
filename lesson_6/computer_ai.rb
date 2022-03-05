def ai_choice(board_spaces, ai_marker, human_marker)
  lines = current_lines(board_spaces)
  choices = []
  choices << ai_win(lines, ai_marker)
  choices << ai_block_win(lines, human_marker)
  choices << ai_fork(lines, ai_marker)
  choices << ai_block_fork(lines, human_marker, ai_marker)
  choices << mark_center(board_spaces)
  choices << mark_opposite_corner(board_spaces, human_marker)
  choices << mark_empty_corner(board_spaces)
  choices << mark_empty_side(lines)
  choices.find { |item| item.is_a?(Integer) }
end

# 1) Win the game if possible.
def ai_win(lines, ai_marker)
  winning_lines = lines.select do |line|
    line.count(ai_marker) == 2 && line.any? { |itm| itm.is_a?(Integer) }
  end
  winning_lines.flatten.find { |square| square.is_a?(Integer) }
end

# 2) Block player from winning if necessary.
def ai_block_win(lines, human_marker)
  ai_win(lines, human_marker)
end

# 3) Make a fork if possible.
def ai_fork(lines, ai_marker)
  unblocked_lines = unblocked_lines(lines, ai_marker)
  fork_paths(unblocked_lines).sample
end

# 4) Block player from forking if possible.
def ai_block_fork(lines, human_marker, ai_marker)
  unblocked_lines = unblocked_lines(lines, human_marker)
  forks = fork_paths(unblocked_lines)
  if forks.size == 1
    forks.first
  elsif forks.size > 1
    block_multiple_forks(lines, forks, ai_marker)
  end
end

# helper methods
def block_multiple_forks(lines, player_forks, ai_marker)
  computer_lines = unblocked_lines(lines, ai_marker)
  computer_lines.each do |line|
    intersect = line & player_forks
    if intersect.empty?
      return line.find { |square| square.is_a?(Integer) }
    elsif intersect.size == 1
      return intersect.first
    end
  end
end

def unblocked_lines(lines, marker)
  lines.select do |line|
    line.include?(marker) && line.count { |square| square.is_a?(Integer) } == 2
  end
end

def fork_paths(unblocked_lines)
  unblocked_lines.flatten!
  index = unblocked_lines.select do |idx|
    unblocked_lines.count(idx) > 1 && idx.is_a?(Integer)
  end
  index.uniq
end

# 5) Mark center if available.
def mark_center(board_spaces)
  4 if board_spaces[4].is_a?(Integer)
end

# 6) Mark opposite corner of player if steps 1-5 not applicable.
def mark_opposite_corner(board_spaces, human_marker)
  case
  when board_spaces[0] == human_marker && board_spaces[2] == 2 then 2
  when board_spaces[2] == human_marker && board_spaces[0] == 0 then 0
  when board_spaces[6] == human_marker && board_spaces[8] == 8 then 8
  when board_spaces[8] == human_marker && board_spaces[6] == 6 then 6
  end
end

# 7) Mark empty corner if steps 1-6 not applicable.
def mark_empty_corner(board_spaces)
  ([0, 2, 6, 8] & board_spaces).sample
end

# 8) Mark empty side if steps 1-7 not applicable.
def mark_empty_side(lines)
  empty_lines = lines & [LINES[0], LINES[2], LINES[3], LINES[5]]
  middle_squares = empty_lines.map { |side| side[1] }
  middle_squares.sample
end
