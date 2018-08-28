class Simon
  COLORS = ["red", "blue","green", "yellow"]

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @seq = Array.new
    @sequence_length = 1
    @game_over = false
  end

  def play
    puts "====================================================================================================================="
    puts "-----------------------------------ULTIMATE SIMON: FIBONACCI'S MEMORY CHALLENGE--------------------------------------"
    puts "====================================================================================================================="
    puts ""
    puts "Before you stands a cranky old wizard bedecked in a robe and holding a magic staff, a clear crystal at the tip."
    puts "He says \"Welcome, I am the GREAT WIZARD FIBONACCI. If you want to even learn the most rudimentary of spells,"
    puts "you must first be tested.  Watch.  My staff will change colors sequentially.  You must remember this sequence of"
    puts "colors, in order.  Fail, and you'd best flee from FIREBALL range, buster!\""
    puts ""
    puts ""
    print "Enter Any Input to Begin >"
    dummy = gets.chomp
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
         add_random_color
       display = ""
       @seq.each do |color|
          system("clear")
          puts "====================================================================================================================="
          puts "-----------------------------------ULTIMATE SIMON: FIBONACCI'S MEMORY CHALLENGE--------------------------------------"
          puts "====================================================================================================================="
          puts ""
          puts "Fibonacci's staff glows, rapidly shifting hue."
          puts color
          sleep(1)
        end
       sleep(2)
       system("clear")
  end

  def require_sequence
    puts "====================================================================================================================="
    puts "-----------------------------------ULTIMATE SIMON: FIBONACCI'S MEMORY CHALLENGE--------------------------------------"
    puts "====================================================================================================================="
    puts ""
    puts "Fibonacci says, \"Now, how much of the colors can you remember?\""
    puts "Available Colors: red, blue, green, yellow"
      idx = 0
      while idx < @sequence_length
      print "Enter a color> "
      input = gets.chomp()
      @game_over = true if input != @seq[idx]
      idx += 1
    end
  end

  def add_random_color
      @seq << COLORS.sample
  end

  def round_success_message
      #Messages break rspec
       puts "==============================================="
       puts "Fibonacci says \"CORRECT!!!!!! Good job remembering!\""
       puts "\"But let's see how you handle a sequence of #{@sequence_length +1 }\""
       puts "==============================================="
  end

  def game_over_message
    if @sequence_length == 1
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
      raise "YOU FAIL SO HARD YOU CRASHED THE GAME - PLEASE RELOAD"
    elsif @sequence_length > 1 && @sequence <= 5
      puts""
      puts "Fibonacci shakes his head and says \"Only #{@sequence_length}? Oh well.  I should have known"
      puts "that you were a mediocre pupil.  Go back to scrubbing the Cockatrice pen!\""
      puts "GAME OVER. Sequnce Size: #{@sequence_length}"
  elsif @sequence_length > 5 && @sequence_length < 10
      puts ""
      puts "Fibonacci cracks a smile, one hand on his hip. \"Not too shabby,\" he says, \"Perhaps you do"
      puts "have what it takes to be a wizard after all!  If you practice, maybe you won't disappoint me"
      puts "nearly as much as usual!\""
  elsif @sequence_length > 9000
      puts ""
      puts "FIBONACCI takes his crystal in his hand and crushes it whilst shouting:"
      puts "\"IT'S OVER NINE THOUSAND!\""
      puts "Congratulations, you have unlocked the secret ending! Achievement unlocked."
    end
  end

  def reset_game
    @game_over = false
    @sequence_length = 1
    @seq = []
  end
end
