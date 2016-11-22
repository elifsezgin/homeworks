require "byebug"
class Board
  attr_accessor :cups, :name1, :name2

  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14) { [] }
    place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    cups.each_index do |idx|
      cups[idx].concat([:stone]*4) unless idx == 6 || idx == 13
    end
  end



  def valid_move?(start_pos)
    raise "Invalid starting cup" unless start_pos.between?(0, cups.length-1)
    raise "Invalid starting cup" if cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)

    stones = cups[start_pos]
    cups[start_pos] = []

    cup_idx = start_pos
    until stones.empty?
      cup_idx = (cup_idx + 1) % 14

      if cup_idx == 6
        cups[6] << stones.shift if current_player_name == name1
      elsif cup_idx == 13
        cups[13] << stones.shift if current_player_name == name2
      else
        cups[cup_idx] << stones.shift
      end

    end
    render
    next_turn(cup_idx)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine what #make_move returns
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif cups[ending_cup_idx].length == 1
      :switch
    else
      ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    cups[1...6].all? { |cup| cup.empty? } || @cups[7...13].all? { |cup| cup.empty? }
  end

  def winner
    player1_score = cups[6].length
    player2_score = cups[13].length
    if player1_score == player2_score
      :draw
    else
      player1_score > player2_score ? @name1 : @name2
    end
  end
end
