
DIFFICULTY = 0 # 0 for random , 1 for AI
INITIAL_MARKER = ' '
WINS_IN_MATCH = 3

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter = ', ', last_word = ' or ')
  if arr.length > 1
    output = arr.pop.to_s.prepend(arr.pop.to_s, last_word)
    while !arr.empty?
      output.prepend(arr.pop.to_s, delimiter)
    end
  else
    output = arr.pop.to_s
  end
  output
end

def new_board(width, height)
  board = {}
  (width * height).times { |num| board[num + 1] = INITIAL_MARKER }
  board[:width] = width
  board[:height] = height
  board
end

def display_board(brd)
  empty_line = ("     |" * brd[:width]).chop
  divider_line = ("-----+" * brd[:width]).chop
  n_s = brd[:numbered_squares]
  clear_screen
  num = 1
  (brd[:height] - 1).times do
    puts n_s ? numbered_line(num, brd) : empty_line
    puts xo_line(num, brd)
    puts empty_line
    puts divider_line
    num += brd[:width]
  end
  puts n_s ? numbered_line(num, brd) : empty_line
  puts xo_line(num, brd)
  puts empty_line
end

def xo_line(first, brd)
  line = ''
  x = first
  brd[:width].times do
    line << "  " << brd[x].to_s << "  " << "|"
    x += 1
  end
  line.chop
end

def numbered_line(first, brd)
  line = ''
  x = first
  brd[:width].times do
    line << x.to_s + (" " * (5 - x.to_s.length)) + "|"
    x += 1
  end
  line.chop
end

def generate_win_lines(brd)
  win_lines = []
  width = brd[:width]
  (1..(brd.length - 2)).each do |i|
    x, y = index_to_xy(i, width)
    # left to right
    verify_win_line(win_lines, brd, x, y, x + 1, y, x + 2, y)
    # top to bottom
    verify_win_line(win_lines, brd, x, y, x, y + 1, x, y + 2)
    # diagonal up right
    verify_win_line(win_lines, brd, x, y, x + 1, y - 1, x + 2, y - 2)
    # diagonal down right
    verify_win_line(win_lines, brd, x, y, x + 1, y + 1, x + 2, y + 2)
  end
  win_lines
end

def verify_win_line(win_lines, brd, x1, y1, x2, y2, x3, y3)
  if in_bounds(x2, y2, brd) && in_bounds(x3, y3, brd)
    win_lines << [xy_to_index(x1, y1, brd[:width]),
                  xy_to_index(x2, y2, brd[:width]),
                  xy_to_index(x3, y3, brd[:width])]
  end
end

def index_to_xy(num, width)
  num -= 1
  y = num / width
  x = num % width
  return x, y
end

def xy_to_index(x, y, width)
  (y * width) + x + 1
end

def in_bounds(x, y, brd)
  width = brd[:width]
  height = brd[:height]
  x >= 0 && x < width && y >= 0 && y < height
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == ' ' }
end

def alternate_turn(turn)
  if turn == 'player'
    'computer'
  else
    'player'
  end
end

def place_piece!(turn, player_marker, computer_marker, lines, brd)
  if turn == 'player'
    player_places_piece!(player_marker, brd)
  elsif turn == 'computer'
    computer_places_piece!(player_marker, computer_marker, lines, brd)
  end
end

def player_places_piece!(player_marker, brd)
  square = ''
  loop do
    prompt "Choose an empty square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      break
    else
      prompt "That's not an open square."
    end
  end
  brd[square] = player_marker
end

def computer_places_piece!(player_marker, computer_marker, lines, brd)
  win = look_for_win_move(computer_marker, lines, brd)
  block = look_for_win_move(player_marker, lines, brd)
  setup = look_for_setup_move(computer_marker, lines, brd)
  if DIFFICULTY > 0
    if win > 0
      brd[win] = computer_marker
    elsif block > 0
      brd[block] = computer_marker
    elsif setup > 0
      setup = 5 if brd[5] == ' ' # 5 is best setup if open
      brd[setup] = computer_marker
    else
      brd[empty_squares(brd).sample] = computer_marker
    end
  else
    brd[empty_squares(brd).sample] = computer_marker
  end
end

def look_for_win_move(marker, lines, brd)
  win_move = 0
  lines.each do |a|
    marker_count = 0
    empty_count = 0
    empty_square = 0
    a.each do |i|
      if brd[i] == marker
        marker_count += 1
      elsif brd[i] == ' '
        empty_count += 1
        empty_square = i
      end
    end
    if marker_count == 2 && empty_count == 1
      win_move = empty_square
    end
  end
  win_move
end

def look_for_setup_move(marker, lines, brd)
  setup_move = 0
  lines.each do |a|
    marker_count = 0
    empty_count = 0
    empty_square = 0
    a.each do |i|
      if brd[i] == marker
        marker_count += 1
      elsif brd[i] == ' '
        empty_count += 1
        empty_square = i
      end
    end
    if marker_count == 1 && empty_count == 2
      setup_move = empty_square
    end
  end
  setup_move
end

def board_full?(brd)
  if brd.all? { |_, v| v != ' ' }
    display_board(brd)
    true
  end
end

def win?(brd, active, win_lines)
  win = false
  win_lines.each do |a|
    if a.all? { |s| brd[s] == brd[a[0]] } && brd[a[0]] == active[:marker]
      active[:score] += 1
      win = true
      break
    end
  end
  win
end

def won_match_message(player, computer)
  if player == WINS_IN_MATCH
    prompt "You won the match!"
  elsif computer == WINS_IN_MATCH
    prompt "The computer won the match!"
  end
end

def input_y_or_n(question)
  answer = ''
  prompt question
  loop do
    answer = gets.chomp.downcase
    if answer == 'y'
      return true
    elsif answer == 'n'
      return false
    else
      prompt "Please enter y or n"
    end
  end
end

def input_number(question, r = (1..100))
  prompt question
  loop do
    answer = gets.chomp.to_i
    if r.include?(answer)
      return answer
    else
      prompt "Please enter a number between #{r.min} and #{r.max}"
    end
  end
end

def clear_screen
  system('clear') || system('cls')
end

player = { score: 0, marker: 'X', win_message: "You win!" }
computer = { score: 0, marker: 'O', win_message: "Computer wins!" }
display_board({ 1 => 'T', 2 => 'I', 3 => 'C',
                4 => 'T', 5 => 'A', 6 => 'C',
                7 => 'T', 8 => 'O', 9 => 'E',
                :width => 3, :height => 3, :numbered_squares => false })
puts ["Shall we play a game?", "Time to play!", "Let's play!"].sample.center(18)
puts "Press Enter".center(18)
gets
clear_screen
prompt "First to three wins takes the match!"
numbered_squares = input_y_or_n "Do you want numbered squares? y/n"
size = input_number("Enter board size (3-6)", (3..6))
clear_screen

loop do
  board = new_board(size, size)
  board[:numbered_squares] = numbered_squares
  win_lines = generate_win_lines(board)
  turn = ['player', 'computer'].sample
  prompt "#{turn.capitalize} goes first"
  sleep(0.8)

  loop do
    display_board(board)
    place_piece!(turn, player[:marker], computer[:marker], win_lines, board)
    sleep(0.3) if turn == 'computer'
    if win?(board, player, win_lines)
      display_board(board)
      prompt player[:win_message]
      break
    elsif win?(board, computer, win_lines)
      display_board(board)
      prompt computer[:win_message]
      break
    elsif board_full?(board)
      prompt "Tie game!"
      break
    end
    turn = alternate_turn(turn)
  end
  prompt "Computer: #{computer[:score]} <<>> You: #{player[:score]}"

  if player[:score] == WINS_IN_MATCH || computer[:score] == WINS_IN_MATCH
    won_match_message(player[:score], computer[:score])
    break if !input_y_or_n("Do you want to play again? y/n")
    player[:score] = 0
    computer[:score] = 0
  else
    prompt "Press Enter"
    gets
  end
  clear_screen
end

prompt "Good game! Thanks for playing!"
