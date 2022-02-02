require "./players"
require "./questions"

class Game
  def initialize()
    @player1 = Players.new("Player 1")
    @player2 = Players.new("Player 2")
    # @question = Questions.new
    @current_player = @player1
    puts "---GAME START---"
    sleep 0.3
  end

  def start
    turn = 1
    while @player1.is_alive? && @player2.is_alive?
      question = Questions.new

      puts "#{@current_player.name}: What does #{question.num1} plus #{question.num2} equal?"
      print "> "
      input = gets.chomp.to_i
      
      if question.is_correct?(input)
        sleep 0.5;
        puts "YES! You are correct!"
      else
        puts "Seriously? "
        sleep 0.5
        puts "No..."
        sleep 0.3
        @current_player.wrong
      end

      if game_over?()
        final_score()
        puts "---- GAME OVER! ----"
        sleep 1.0
        puts "Good bye!"
        break
      end

      if turn == 1
        @current_player = @player2
      else 
        @current_player = @player1
      end
      
      score()
      sleep 0.5;
      puts "---- NEW TURN ----"
    end
  end

  def score
    puts "P1: #{@player1.lives}/3 vs. P2: #{@player2.lives}/3"
  end

  def game_over?
    @player1.lives <= 0 || @player2.lives <= 0
  end

  def final_score
    if !@player1.is_alive?
      winner(@player2)
    elsif !@player2.is_alive?
      winner(@player1)
    end
  end

  def winner(player)
    puts "#{player.name} wins with a score of #{player.lives}/3"
  end
end
