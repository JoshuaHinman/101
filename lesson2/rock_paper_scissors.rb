VALID_CHOICES = ['rock', 'paper', 'scissors', 'lizard', 'spock']
WINS = [['scissors', 'cuts', 'paper'], ['scissors', 'decapitates', 'lizard'],
        ['paper', 'covers', 'rock'], ['paper', 'disproves', 'spock'],
        ['rock', 'crushes', 'lizard'], ['rock', 'crushes', 'scissors'],
        ['lizard', 'poisons', 'spock'], ['lizard', 'eats', 'paper'],
        ['spock', 'smashes', 'scissors'], ['spock', 'vaporizes', 'rock']]
ABBREVIATIONS = { 'r' => 'rock', 'p' => 'paper', 'sc' => 'scissors',
                  'l' => 'lizard', 'sp' => 'spock',
                  'q' => 'quit', 'ru' => 'rules' }

def prompt(message)
  Kernel.puts("=> #{message}")
end

def result_with_message(first, second)
  WINS.each do |w|
    if first == w[0] && second == w[2]
      return w.join(' ').upcase()
    end
  end
  false
end

def display_result(player, computer)
  player_result = result_with_message(player, computer)
  computer_result = result_with_message(computer, player)
  if player_result
    prompt(player_result << '!')
    prompt("You won!")
  elsif computer_result
    prompt(computer_result << '!')
    prompt("Computer won!")
  else
    prompt("It's a tie!")
  end
end

computer_score = 0
player_score = 0
quit = false
rules = false

system('clear') || system('cls')
loop do
  choice = ''
  loop do
    prompt("Choose one: #{VALID_CHOICES.join(', ')} (or rules, quit)")
    choice = Kernel.gets().chomp().downcase()
    ABBREVIATIONS.each { |k, v| k == choice ? choice = v : false }
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

  break if quit == true

  if rules == true
    rules = false
    WINS.each { |w| puts w.map(&:capitalize).join(' ') }
  else
    computer_choice = VALID_CHOICES.sample

    prompt("You chose: #{choice} , Computer chose: #{computer_choice}")
    display_result(choice, computer_choice)

    if result_with_message(choice, computer_choice)
      player_score += 1
    elsif result_with_message(computer_choice, choice)
      computer_score += 1
    end
    prompt("Player Score #{player_score} <<>> Computer Score #{computer_score}")
  end
end
