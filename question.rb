class Question
  attr_accessor :number1, :number2, :answer, :check
  def initialize
    @number1 = rand(1..10)
    @number2 = rand(1..10)
    @answer = @number1 + @number2
  end

  def print_question
    puts "What is #{@number1} + #{@number2}?"
  end

  def check_answer(answer)
    if answer.to_i == @number1 + @number2
      @check = true
    else
      @check = false
    end
  end
end