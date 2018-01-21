# ask for two numbers
# ask for operation
# perform operation on numbers

require 'yaml'
LANGUAGE = 'es'
MESSAGES = YAML.load_file('calculator_messages2.yml')

def messages(key)
  MESSAGES[LANGUAGE][key]
end

def prompt(message)
  Kernel.puts("=>#{message}")
end

def valid_number?(num)
  num.to_i().to_s() == num
end

def integer?(num)
  /^\d+$/.match(num)
end

def float?(num)
  /\d/.match(num) && /^\d*\.?\d*$/.match(num)
end

def number?(num)
  integer?(num) || float?(num)
end

def operator_to_message(op)
  operation = case op
              when '1'
                messages('adding')
              when '2'
                messages('subtracting')
              when '3'
                messages('multiplying')
              when '4'
                messages('dividing')
              end

  operation
end

name = ''
prompt(messages('welcome'))
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt(messages('name_error'))
  else
    break
  end
end

operator = 0
number1 = 0
number2 = 0

prompt("#{messages('greet')} #{name}")
while operator != '5'

  loop do
    prompt(messages('num1_prompt'))
    number1 = Kernel.gets().chomp()
    if number?(number1)
      break
    else
      prompt(messages('num_error'))
    end
  end

  loop do
    prompt(messages('num2_prompt'))
    number2 = Kernel.gets().chomp()
    if number?(number2)
      break
    else
      prompt(messages('num_error'))
    end
  end

  prompt(messages('operator_prompt'))

  loop do
    operator = Kernel.gets().chomp()
    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt(messages('operator_error'))
    end
  end

  prompt "#{operator_to_message(operator)}#{messages('operator_display')}"
  result =  case operator
            when '1'
              number1.to_f() + number2.to_f()
            when '2'
              number1.to_f() - number2.to_f()
            when '3'
              number1.to_f() * number2.to_f()
            when '4'
              number1.to_f() / number2.to_f()
            end
  prompt "#{messages('result_display')} #{result.round(4)}"

  prompt(messages('new_calculation_prompt'))
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end
