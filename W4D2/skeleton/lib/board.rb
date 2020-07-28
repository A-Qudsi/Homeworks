# require "byebug"
class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    place_stones
    @name1 = name1 
    @name2 = name2

  end

  def place_stones
    @cups.each_with_index do |ele, idx|
      unless idx == 6 || idx == 13
       4.times { ele << :stone }
      end
    end
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if !start_pos.between?(0,12)
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    stones = self.cups[start_pos]
    self.cups[start_pos] = []
    i = start_pos + 1
    until stones.empty?
      if i == 14
        i = 0 
      end
      if (i != 13 && (current_player_name == @name1)) 
        self.cups[i] << stones.shift
        i+=1
      elsif (i != 6 && (current_player_name == @name2))
        self.cups[i] << stones.shift
        i+=1
      else
        i += 1 
      end
    end
    render
    next_turn(i-1)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    if ending_cup_idx == 6 || ending_cup_idx == 13
      :prompt
    elsif @cups[ending_cup_idx].count == 1
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
   (0..5).all? {|i| @cups[i] == [] } || (7..12).all? {|i| @cups[i] == [] }
  end

  def winner
    if self.cups[6] == self.cups[13]
      :draw
    elsif self.cups[6].length > self.cups[13].length
      @name1 
    else
      self.cups[13].length > self.cups[6].length
      @name2
    end
  end
end
