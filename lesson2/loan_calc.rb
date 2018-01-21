
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

loan_amt = 0
duration_in_months = 0
apr = 0
quit = false
while quit == false

  loop do
    prompt("Please enter the loan amount:")
    loan_amt = Kernel.gets().chomp()
    if number?(loan_amt)
      loan_amt = loan_amt.to_f
      break
    else
      prompt("That is not a valid number")
    end
  end

  loop do
    prompt("Please enter the loan duration in months:")
    duration_in_months = Kernel.gets().chomp()
    if integer?(duration_in_months)
      duration_in_months = duration_in_months.to_i
      break
    else
      prompt("That is not a valid number")
    end
  end

  loop do
    prompt("Please enter the APR (eg 4.1):")
    apr = Kernel.gets().chomp()
    if number?(apr)
      apr = (apr.to_f / 100.0)
      break
    else
      prompt("That is not a valid number")
    end
  end

  monthly_interest_rate = apr / 12.0

  x = (1 - (1 + monthly_interest_rate)**-duration_in_months)
  x = (monthly_interest_rate / x)
  monthly_payment = loan_amt * x
  puts "Your monthly payment will be $#{monthly_payment.round(2)}"
  puts "Would you like to calculate another loan payment? y/n"
  answer = Kernel.gets().chomp()
  quit = true if answer.downcase() != 'y'

end
