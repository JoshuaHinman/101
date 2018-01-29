VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WIN_CONDITIONS = [['scissors', 'cuts', 'paper'], ['scissors', 'decapitates', 'lizard'],
        ['paper', 'covers', 'rock'], ['paper', 'disproves', 'spock'],
        ['rock', 'crushes', 'lizard'], ['rock', 'crushes', 'scissors'],
        ['lizard', 'poisons', 'spock'], ['lizard', 'eats', 'paper'],
        ['spock', 'smashes', 'scissors'], ['spock', 'vaporizes', 'rock']]
VALID_ABBREVIATIONS = { 'ro' => 'rock', 'pa' => 'paper', 'sc' => 'scissors',
                  'li' => 'lizard', 'sp' => 'spock',
                  'qu' => 'quit', 'ru' => 'rules' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def win_result_with_message(first, second)
  WIN_CONDITIONS.each do |w|
    if first == w[0] && second == w[2]
      return w.join(' ').upcase()
    end
  end
  false
end

def display_result(player, computer)
  player_result = win_result_with_message(player, computer)
  computer_result = win_result_with_message(computer, player)
  if player_result
    prompt(player_result << '!' + " You won the round!")
  elsif computer_result
    prompt(computer_result << '!' + " Computer won the round!")
  else
    prompt("It's a tie!")
  end
end

def update_score(player_choice,computer_choice, player_score, computer_score)
  if win_result_with_message(player_choice, computer_choice)
    player_score += 1
  elsif win_result_with_message(computer_choice, player_choice)
    computer_score += 1
  end
  return player_score, computer_score
end

def get_user_input
  choice = ''
  quit = false
  rules = false
    loop do
      print ':'
      choice = Kernel.gets().chomp().downcase()
      VALID_ABBREVIATIONS.each { |k, v| k == choice ? choice = v : false }
      if VALID_CHOICES.include?(choice)
        break
      elsif choice == 'quit'
        quit = true
        break
      elsif choice == 'rules'
        rules = true
        break
      else
        prompt("Thats' not a valid choice.")
      end
    end
    return choice, quit, rules
end

def game_end?(player, computer)
  if player == 5
    prompt("You won the match!")
    true
  elsif computer == 5
    prompt("Computer won the match!")
    true
  end
end

def play_again?
  prompt("Play again? y/n")
  answer = Kernel.gets().chomp().downcase
  if answer == 'y'
    true
  else
    false
  end
end

def display_rules
  system('clear') || system('cls')
  WIN_CONDITIONS.each { |w| puts w.map(&:capitalize).join(' ') }
  prompt("First to five wins the match!")
end

quit = false
while quit == false

  # initialize game
  computer_score = 0
  player_score = 0
  round = 1

  system('clear') || system('cls')
  loop do
     puts "\n-------------------------------Round #{round}-------------------------------"
    prompt("Choose one: #{VALID_CHOICES.join(', ')} (or rules, quit).\n   You can type the first two letters of any command.")
    player_choice, quit, rules = get_user_input

    break if quit == true

    if rules == true
      rules = false
      display_rules  
    else
      computer_choice = VALID_CHOICES.sample
      prompt("You chose: #{player_choice} , Computer chose: #{computer_choice}")
      display_result(player_choice, computer_choice)
      player_score, computer_score = update_score(player_choice, computer_choice, player_score, computer_score)
      prompt("Player Score #{player_score} <> Computer Score #{computer_score}")
      round += 1
    end

    break if game_end?(player_score, computer_score)
  end

  if quit == false
    quit = !play_again?
  end
end
