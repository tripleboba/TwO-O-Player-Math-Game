class Game
  attr_accessor :turn, :player1, :player2

  def initialize
    @turn = 1
    @player1 = 3
    @player2 = 3
  end

  def game_over
    if @player1.lives == 0
      winner = @player2
    else 
      winner = @player1
    end
    puts "Player #{winner.name} wins with a score of #{winner.lives}/3"
    puts "Good bye!"
  end

  def update_lives(turn)
    if turn == 1
      @player1 -= 1
    else 
      @player2 -= 1
    end
    if @player1 == 0 || @player2 == 0
      game_over
    end

  def update_turn(turn)
    if turn == 1
      @turn = 2
    else 
      @turn = 1
    end
    start
  end
  
  def start
    puts "Player 1: #{@player1}/3 lives. Player 2: #{@player2}/3 lives."
    question = Question.new(turn)
    if !question.start
      update_lives(turn)
    end
    update_turn(turn)
  end
end