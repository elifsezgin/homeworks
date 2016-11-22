class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
    show_sequence
    require_sequence
    @sequence_length += 1
    round_success_message if game_over == false
  end

  def show_sequence
    add_random_color
    puts seq
  end

  def require_sequence
    puts "Enter guesses"
    i = 0
    guesses = []
    until guesses.length == sequence_length
      answer = gets.chomp
      @game_over = true unless answer == seq[i]
      guesses << answer
      i += 1
    end
    guesses
  end

  def add_random_color
    seq << COLORS[rand(4)]
  end

  def round_success_message
    puts "Success"
  end

  def game_over_message
    puts "Game over"
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
