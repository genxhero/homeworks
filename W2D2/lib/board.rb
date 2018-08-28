class Board
  attr_accessor :cups
#[:stone, :stone]
  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new}
    @name1 = name1
    @name2 = name2
    #6 and 13 are store cups
    self.place_stones
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
    ini = [:stone, :stone, :stone, :stone]
    @cups.each_with_index {|cup, idx| @cups[idx] += ini unless idx == 6 || idx == 13}
  end

  def valid_move?(start_pos)
    raise "Invalid starting cup" if start_pos > 13
    raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    i = start_pos
    current_player_name == @name1 ? skip = 13 : skip = 6
    until @cups[start_pos].empty?
      i += 1
      @cups[i % 14] << @cups[start_pos].shift unless (i % 14) == skip
    end
    render
    next_turn(i % 14)
  end

  def next_turn(ending_cup_idx)
    if ending_cup_idx  == 13 || ending_cup_idx == 6
      return :prompt
    elsif @cups[ending_cup_idx].count > 1
      return ending_cup_idx
    else
      return :switch
    end
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
  end

  def winner
  end
end
