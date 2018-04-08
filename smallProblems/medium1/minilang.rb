def minilang(code)
  register = 0
  stack =[]
  code = code.split
  code.each do |cmd|
    case cmd
    when 'PUSH' then stack.push(register)
    when 'ADD' then register += stack.pop
    when 'SUB' then register -+ stack.pop
    when 'MULT' then register *= stack.pop
    when 'DIV' then register /= stack.pop
    when 'MOD' then register %= stack.pop
    when 'POP' then register = stack.pop
    when 'PRINT' then puts register
    else register = cmd.to_i
    end
  end
end



p minilang('4 PUSH 3 MULT PRINT')


