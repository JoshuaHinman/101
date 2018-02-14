
DIFFICULTY = 1 # 0 for random , 1 for AI
INITIAL_MARKER = ' '

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

  system('clear') || system('cls')
  num = 1
  (brd[:height] - 1).times do
    if brd[:numbered_squares] == 1
      puts numbered_line(num, brd)
    else
      puts empty_line
    end
    puts xo_line(num, brd)
    puts empty_line
    puts divider_line
    num += brd[:width]
  end
  if brd[:numbered_squares] == 1
    puts numbered_line(num, brd)
  else
    puts empty_line
  end
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
    # left to right - x,y  x+1,y  x+2,y
    if in_bounds(x + 1, y, brd) && in_bounds(x + 2, y, brd)
      win_lines << [i, xy_to_index(x + 1, y, width), xy_to_index(x + 2, y, width)]
    end
    # top to bottom - x,y  x,y+1  x,y+2
    if in_bounds(x, y + 1, brd) && in_bounds(x, y + 2, brd)
      win_lines << [i, xy_to_index(x, y + 1, width), xy_to_index(x, y + 2, width)]
    end
    # diagonal up right - x,y  x+1,y-1  x+2,y-2
    if in_bounds(x + 1, y - 1, brd) && in_bounds(x + 2, y - 2, brd)
      win_lines << [i, xy_to_index(x + 1, y - 1, width), xy_to_index(x + 2, y - 2, width)]
    end
    # diagonal down right - x,y x+1,y+1  x+2,y+2
    if in_bounds(x + 1, y + 1, brd) && in_bounds(x + 2, y + 2, brd)
      win_lines << [i, xy_to_index(x + 1, y + 1, width), xy_to_index(x + 2, y + 2, width)]
    end
  end
  win_lines
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
    computer_places_piece!(computer_marker, lines, brd)
  end
end

def player_places_piece!(marker, brd)
  square = ''
  loop do
    prompt "Choose an empty square (#{joinor(empty_squares(brd))})"
    square = gets.chomp.to_i
    if empty_squares(brd).include?(square)
      # or if (1..9).include?(square) && brd[square] == ' '
      break
    else
      prompt "That's not an open square."
    end
  end
  brd[square] = marker
end

def computer_places_piece!(marker, lines, brd)
  win, block, setup = scan_win_lines(marker, lines, brd)
  if DIFFICULTY > 0
    if win > 0
      brd[win] = marker
    elsif block > 0
      brd[block] = marker
    elsif setup > 0
      brd[setup] = marker
    else
      brd[empty_squares(brd).sample] = marker
    end
  else
    brd[empty_squares(brd).sample] = marker
  end
end

def scan_win_lines(marker, lines, brd)
  # scans for these 3 possible moves, returns results for all, 0 if not found
  win_move = 0
  block_move = 0
  setup_move = 0

  lines.each do |a|
    marker_count = 0
    other_count = 0
    empty_count = 0
    empty_square = 0
    a.each do |i|
      if brd[i] == marker
        marker_count += 1
      elsif brd[i] == ' '
        empty_count += 1
        empty_square = i
      else
        other_count += 1
      end
    end
    if marker_count == 2 && empty_count == 1
      win_move = empty_square
    elsif other_count == 2 && empty_count == 1
      block_move = empty_square
    elsif empty_count == 2 && marker_count == 1
      setup_move = empty_square
    end
  end
  setup_move = 5 if brd[5] == ' ' # 5 is best setup if open
  return win_move, block_move, setup_move
end

def board_full?(brd)
  if brd.all? { |_, v| v != ' ' }
    display_board(brd)
    prompt "Tie game!"
    true
  end
end

def win?(brd, active, win_lines)
  win = false
  win_lines.each do |a|
    if a.all? { |s| brd[s] == brd[a[0]] } && brd[a[0]] == active[:marker]
      display_board(brd)
      prompt active[:win_message]
      active[:score] += 1
      win = true
      break
    end
  end
  win
end

def won_5?(player, computer)
  if player == 3
    prompt "You win the match!"
    true
  elsif computer == 3
    prompt "Computer wins the match!"
    true
  end
end

def play_again?
  answer = ''
  loop do
    prompt "Do you want to play again? y/n"
    answer = gets.chomp
    if answer.downcase == 'y'
      return true
    else
      return false
    end
  end
end

player = { score: 0, marker: 'X', win_message: "You win!" }
computer = { score: 0, marker: 'O', win_message: "Computer wins!" }
display_board({ 1 => 'T', 2 => 'I', 3 => 'C',
                4 => 'T', 5 => 'A', 6 => 'C',
                7 => 'T', 8 => 'O', 9 => 'E', :width => 3, :height => 3, :numbered_squares => 0 })
puts ["Shall we play a game?", "Time to play!", "Let's play!"].sample.center(18)
puts "Press Enter".center(18)
gets
system('clear') || system('cls')
prompt "First to three wins takes the match!"
prompt "Do you want numbered squares? y/n"
if gets.chomp.downcase == 'y'
  numbered_squares = 1
else
  numbered_squares = 0
end
prompt "Enter board size (3-6)"
size = gets.chomp.to_s.to_i
system('clear') || system('cls')

loop do
  board = new_board(size, size)
  board[:numbered_squares] = numbered_squares
  win_lines = generate_win_lines(board)
  turn = ['player', 'computer'].sample
  prompt "#{turn.capitalize} goes first"
  sleep(0.8)
  loop do
    

    display_board(board)
    # display output from AI scan
    win, block, setup = scan_win_lines(player[:marker], win_lines, board)
    puts "win move:#{win}  block move:#{block}  setup move:#{setup}"
    
    place_piece!(turn, player[:marker], computer[:marker], win_lines, board)
    if turn == 'computer'
      sleep(0.3)
    end
    break if win?(board, player, win_lines) ||
             win?(board, computer, win_lines) ||
             board_full?(board)
    turn = alternate_turn(turn)
  end
  prompt "Computer: #{computer[:score]} <<>> You: #{player[:score]}"

  if won_5?(player[:score], computer[:score])
    if !play_again?
      break
    else
      player[:score] = 0
      computer[:score] = 0
    end
  else
    prompt "Press Enter"
    gets
  end
  system('clear') || system('cls')
end

prompt "Good game! Thanks for playing!"
