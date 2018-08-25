class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = Array.new
    @sequence_length = 1
    @game_over = false
  end

  def play
    # puts "====================================================================================================================="
    # puts "-----------------------------------ULTIMATE SIMON: FIBONACCI'S MEMORY CHALLENGE--------------------------------------"
    # puts "====================================================================================================================="
    # puts ""
    # puts "Before you stands a cranky old wizard bedecked in a robe and holding a magic staff, a clear crystal at the tip."
    # puts "He says \"Welcome, I am the GREAT WIZARD FIBONACCI. If you want to even learn the most rudimentary of spells,"
    # puts "you must first be tested.  Watch.  My staff will change colors sequentially.  You must remember this sequence of"
    # puts "colors, in order.  Fail, and you'd best flee from FIREBALL range, buster!\""
    # puts ""
    # puts ""
    until game_over
      take_turn
    end
    game_over_message
    reset_game
  end

  def take_turn
     show_sequence
     require_sequence
     round_success_message if game_over == false
     @sequence_length += 1
  end

  def show_sequence
       @sequence_length.times do
         @seq << add_random_color
       end
       puts "Fibonacci's staff glows, rapidly shifting hue."
       display = ""
       @seq.each {|color| display << " #{color} "}
       puts display
       sleep(1)
       system("clear")
  end

  def require_sequence
  #  @sequence_length.times do
  #  print "Enter a color> "
  #  input = gets.chomp()
  end

  def add_random_color
      @seq << COLORS.sample
  end

  def round_success_message
      #Messages break rspec
      # puts "==============================================="
      # puts "Fibonacci says \"CORRECT!!!!!! Good job remembering!\""
      # puts "\"But let's see how you handle a sequence of #{sequence_length +1 }\""
      # puts "==============================================="
  end

  def game_over_message
    if sequence_length == 1
      puts "Fibonacci says \"By thunder. You...you have failed...miserably."
      puts "in all of my years of spell casting I have never seen a failure"
      puts "more pathetic.  Your memory is a vaccuous singularity incapable"
      puts "of holding even the most rudimentary of mental processes.  In fact,"
      puts "your mere presence on this plane of existence is an affront to the"
      puts "mere concept of thought.  I am afraid you must be banished."
      puts "GOOD BYE!\""
      puts "The wizard incants the darkest magic of all...the  magic of recursion."
      puts "you spend an eternity inside a never-ending pocket dimension where"
      puts "your body implodes in on itself infinitely."
      puts "GAME OVER. Sequence Size: 1"
      #The following line breaks rspec because rspec game overs with a sequence of 1 at some point
      #raise "YOU FAIL SO HARD YOU CRASHED THE GAME - PLEASE RELOAD"
    end #end of if
  end #end of game over message

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end#end of reset

end# end of class
