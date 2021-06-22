require './players'
require './question'

class Game
  attr_accessor :player1, :player2
  def initialize
    puts "Player 1, what is your name?"
    @player1 = Player.new(gets.chomp)
    puts "Player 2, what is your name?"
    @player2 = Player.new(gets.chomp)
    puts "Let's get started!"
    
  end

  def start_game
    turn = 0
    while player1.points > 0 && player2.points > 0
      player = turn % 2 == 0? @player1 : @player2
      other_player = turn % 2 == 1? @player1 : @player1

      question = Question.new
      puts question.print_question
      
      if !question.check_answer(gets.chomp)
        player.points -= 1
        puts "Incorrect! You lose 1 point. You now have #{player.points} point(s)"
      else 
        puts "Correct! Great work."
      end

      if player.points > 0
        puts "SCORE: #{player.name}: #{player1.points}/3 | #{other_player.name}: #{player2.points}/3"
        puts "----- NEW TURN -----"
        turn += 1
      end

      if @player1.points <= 0 || @player2.points <= 0
        puts "----- GAME OVER -----"

        if @player1.points > @player2.points
          puts "#{@player1.name} wins!"
        elsif @player1.points < @player2.points
          puts "#{@player2.name} wins!"
        end

      end
    end
  end
end




  