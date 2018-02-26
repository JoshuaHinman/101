CARD_TOP = " ---- "
CARD_BOTTOM = "|____|"
CARD_SIDES = "|    |"
CARD_VALUES = %w[2 3 4 5 6 7 8 9 J Q K A]
CARD_SUITS = %w[D H S C]
TOP_SCORE = 21
DEALER_STAY_BOUNDARY = 17
MATCH_WINS = 3

def clear_screen
  system('clear') || system('cls')
end

def prompt(message)
  puts "=>#{message}"
end

def pause_prompt(message, pause = 0.5)
  puts "=>#{message}"
  sleep(pause)
end

def initialize_deck
  card_deck = []
  CARD_SUITS.each do |s|
    card_deck << CARD_VALUES.map { |c| c + s }
  end
  card_deck.flatten
end

def shuffled_deck(card_deck)
  new_deck = card_deck.clone
  shuffled = []
  while shuffled.length != 48
    rand_card = new_deck.sample
    shuffled << rand_card
    new_deck.delete(rand_card)
  end
  shuffled
end

def deal_card(card_deck)
  card = ''
  loop do
    card = card_deck.sample
    card_deck.delete(card)
    break
  end
  card
end

def display_cards(cards, first_card_face_down = false)
  hand = cards.clone
  card_num = hand.length
  hand[0] = '  ' if first_card_face_down
  puts CARD_TOP * card_num
  hand.each { |v| print '|' + v + '  |' }
  puts
  puts CARD_SIDES * card_num
  hand.each { |v| print '|  ' + v + '|' }
  puts
  puts CARD_BOTTOM * card_num
end

def calculate_hand_value(hand)
  total = [0]
  hand.each do |v|
    if %w[J Q K].include?(v.chop)
      total.each_with_index { |t, i| total[i] = t + 10 }
    elsif v.chop == 'A'
      total = split_ace(total)
    else
      total.each_with_index { |t, i| total[i] = t + v.chop.to_i }
    end
  end
  while total.last > TOP_SCORE && total.length > 1
    total.pop
  end
  total.last
end

def split_ace(arr)
  new_arr = []
  arr.each do |v|
    new_arr << v + 1 << v + 11
  end
  new_arr.sort!
end

def input_h_or_s(question)
  answer = ''
  prompt question
  loop do
    answer = gets.chomp.downcase
    if answer == 'h'
      return 'h'
    elsif answer == 's'
      return 's'
    else
      prompt "Please enter h or s"
    end
  end
end

def determine_winner(dealer, player)
  player = 0 if player > TOP_SCORE
  dealer = 0 if dealer > TOP_SCORE
  if dealer > player
    'dealer'
  elsif dealer < player
    'player'
  else
    'tie'
  end
end

def display_winner(winner)
  case winner
  when 'dealer'
    pause_prompt("Dealer wins!", 1.0)
  when 'player'
    pause_prompt("Player wins!", 1.0)
  else
    pause_prompt("Tie!", 1.0)
  end
end

def update_score(winner, dealer, player)
  case winner
  when 'dealer'
    dealer[:score] += 1
  when 'player'
    player[:score] += 1
  end
  return dealer[:score], player[:score]
end

def refresh_cards_display(dealer, player, dealer_face_down)
  clear_screen
  display_cards(dealer[:hand], dealer_face_down)
  display_cards(player[:hand])
  prompt "Your total:#{player[:total]}"
end

def player_move(player, dealer, game_deck)
  loop do
    refresh_cards_display(dealer, player, true)
    choice = input_h_or_s("Hit or Stand? h/s")
    if  choice == 'h'
      player[:hand] << deal_card(game_deck)
      player[:total] = calculate_hand_value(player[:hand])
      if player[:total] > TOP_SCORE
        bust(dealer, player, player)
        break
      end
    elsif choice == 's'
      pause_prompt "#{player[:name]} stands"
      break
    end
  end
end

def dealer_move(player, dealer, game_deck)
  loop do
    refresh_cards_display(dealer, player, false)
    if dealer[:total] < DEALER_STAY_BOUNDARY
      pause_prompt("Dealer hits", 1)
      dealer[:hand] << deal_card(game_deck)
      dealer[:total] = calculate_hand_value(dealer[:hand])
    else
      pause_prompt("#{dealer[:name]} stands", 1)
      break
    end
    if dealer[:total] > TOP_SCORE
      bust(dealer, player, dealer)
      break
    end
  end
end

def bust(dealer, player, active)
  active[:bust] = true
  refresh_cards_display(dealer, player, false)
  pause_prompt "#{active[:name]} busts!"
  active[:total] = 0
end

def match_won?(dealer, player)
  if dealer[:score] == MATCH_WINS
    'Dealer'
  elsif player[:score] == MATCH_WINS
    'Player'
  end
end

def play_again?
  answer = ''
  prompt "Play again? y/n"
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

def deal_hands(game_deck, player, dealer)
  player[:hand] << deal_card(game_deck) << deal_card(game_deck)
  dealer[:hand] << deal_card(game_deck) << deal_card(game_deck)
  player[:total] = calculate_hand_value(player[:hand])
  dealer[:total] = calculate_hand_value(dealer[:hand])
end

def discard_hands(dealer, player)
  player[:hand] = []
  dealer[:hand] = []
  player[:bust] = false
  dealer[:bust] = false
end

def wait_prompt(msg)
  prompt msg
  gets
end

clear_screen
prompt "Welcome to Blackjack!"
display_cards(['AC', 'JS'], false)
wait_prompt "Press Enter"
loop do
  pause_prompt("First to five wins is the champ!", 1.0)
  player = { name: 'Player', hand: [], total: 0, score: 0, bust: false }
  dealer = { name: 'Dealer', hand: [], total: 0, score: 0, bust: false }
  loop do
    game_deck = initialize_deck
    game_deck = shuffled_deck(game_deck)
    deal_hands(game_deck, player, dealer)

    player_move(player, dealer, game_deck) if player[:total] != TOP_SCORE

    dealer_move(player, dealer, game_deck) if !player[:bust]

    winner = determine_winner(dealer[:total], player[:total])
    prompt "dealer: #{dealer[:total]} player:#{player[:total]}"
    display_winner(winner)

    dealer[:score], player[:score] = update_score(winner, dealer, player)
    pause_prompt("player: #{player[:score]} <> Dealer: #{dealer[:score]}", 1.0)

    match_win = match_won?(dealer, player) 
    if match_win
      prompt "#{match_win} wins the match!"
      break
    else
      wait_prompt "Press Enter"
    end
    discard_hands(dealer, player)
  end
  break if !play_again?
end
