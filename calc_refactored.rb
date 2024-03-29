# ask for the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result
# answer = Kernel.gets()
# Kernel.puts (answer)

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Add'
  when '2'
    'Subtract'
  when '3'
    'Multiply'
  when '4'
    'Divide'
  end
end
prompt('Welcome to Calculator! Enter your name:')

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("C'mon... what's your name?")
    else
      break
    end
end

loop do #main loop
  number1 = ''
  loop do
  prompt("What's the first number #{name}?")
  number1 = Kernel.gets.chomp
  if valid_number?(number1)
    break
  else
    prompt("Hmm... that doesn't look like a valid number?")
  end
  end

  number2 = ''
  loop do
  prompt("What's the second number?")
  number2 = Kernel.gets.chomp
  if valid_number?(number2)
    break
  else
    prompt("Hmm... that doesn't look like a valid number?")
  end
  end
  operator_prompt = <<-MSG
    What operation would you like to perform?
    1) add
    2) subtract
    3) multiply
    4) divide
  MSG
  prompt(operator_prompt)
    #prompt('What operation would you like to  perform? 1) add 2) subtract 3) multiply
  #4) divide')
  operator = ''
  loop do
  operator = Kernel.gets.chomp
      if %w(1 2 3 4).include?(operator)
        break
      else  
        prompt("#{name}, you must choose options 1 - 4")
  end
end

prompt("You chose to #{operation_to_message(operator)} the two numbers...")
  result = case operator
  when "1"
    number1.to_i()+ number2.to_i()
  when "2"
    number1.to_i - number2.to_i
  when "3"
    number1.to_i * number2.to_i
  when "4"
    number1.to_f /  number2.to_f

  end
  prompt("The result is #{result}")

  prompt("Do you wnat to perform another calculation? (Y to calculate again.)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end 
  
  prompt("Thank you for using Calculator, #{name}!")
