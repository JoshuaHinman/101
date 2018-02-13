
INITIAL_MARKER = ' '
WIN_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9],
             [1, 4, 7], [2, 5, 8], [3, 6, 9],
             [1, 5, 9], [3, 5, 7]]

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr, delimiter = ', ', last_word = ' or ')
  if arr.length > 1
    output = arr.pop.to_s.prepend(arr.pop.to_s, last_word)
    while arr.length > 0
      output.prepend(arr.pop.to_s, delimiter)
    end
  else
    output = arr.pop.to_s
  end
  output
end

def display_board(brd)
  system('clear') || system('cls')
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
end

def new_board
  board = {}
  (1..9).each { |num| board[num] = INITIAL_MARKER }
  board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == ' ' }
end

def alternate_turn(turn)
  if turn == 'player'
    turn = 'computer'
  else
    turn = 'player'
  end
  turn
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
  if win > 0
    brd[win] = marker
  elsif block > 0
    brd[block] = marker
  elsif setup > 0
    brd[setup] = marker
  else
    brd[empty_squares(brd).sample] = marker
  end
end

def scan_win_lines(marker, lines, brd)
  #scans for these 3 possible moves, returns results for all, zero means it wasn't found
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
    prompt "Tie game!"
    prompt "Press Enter"
    gets
    return true
  end
end

def win?(brd, active)
  w = false
  WIN_LINES.each do |a|
    if a.all? { |s| brd[s] == brd[a[0]] } && brd[a[0]] == active[:marker]
      prompt active[:win_message]
      prompt "Press Enter"
      gets
      active[:score] += 1
      w = true
      break
    end
  end
  w
end

def won_5?(player, computer)
  if player == 5
    prompt "You win the match!"
  elsif computer == 5
    prompt "Computer wins the match!"
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

player = { score: 0, marker: 'X', win_message: "You win!"}
computer = { score: 0, marker: 'O', win_message: "Computer wins!"}
display_board({ 1 => 'T', 2 => 'I', 3 => 'C',
                 4 => 'T', 5 => 'A', 6 => 'C',
                 7 => 'T', 8 => 'O', 9 => 'E' })
puts ["Shall we play a game?", "Time to play!", "Let's play!"].sample.center(18)
puts "Press Enter".center(18)
gets.chomp

loop do

  board = new_board
  display_board(board)
  turn = ['player', 'computer'].sample
  puts turn.capitalize + " goes first."
  loop do
    #output from AI scan 
    #win, block, setup = scan_win_lines(player[:marker], WIN_LINES, board)
    #puts "win move:#{win}  block move:#{block}  setup move:#{setup}"
    #puts turn + ' turn'
    player_places_piece!(player[:marker], board)
    display_board(board)
    #place_piece!(turn, player[:marker], computer[:marker] , WIN_LINES, board)
    break if (win?(board, player) || board_full?(board))
    turn = alternate_turn(turn)

    puts turn + ' turn'
    sleep(0.3)

    computer_places_piece!(computer[:marker], WIN_LINES, board)
    display_board(board)
    break if (win?(board, computer) || board_full?(board))
    turn = alternate_turn(turn)
     
  end
  
  prompt "Computer: #{computer[:score]} <<>> You: #{player[:score]}"
  if won_5?(player[:score], computer[:score])
    break unless play_again?
  end
end

prompt "Good game! Thanks for playing!"

