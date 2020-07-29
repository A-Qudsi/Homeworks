class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @sequence_length = 1
    @game_over = false
    @seq = []
  end

  def play
    self.game_over_message
    self.reset_game
    while @game_over != true 
      take_turn
    end


  end

  def take_turn
    self.show_sequence
    self.require_sequence

    unless @game_over
      self.round_success_message
      @sequence_length += 1
    end
  end

  def show_sequence
    self.add_random_color
    system("clear")
    @seq.each do |color|
      puts color
      sleep(1)
      system("clear")
      sleep(1)
    end
  end

  def require_sequence
    puts "Enter the color sequence as seen"
    @seq.each do |color|
      user_color = gets.chomp
      if color != user_color
        @game_over = true
        break
      end
    end
  end

  def add_random_color
    @seq << COLORS.sample
  end

  def round_success_message
    "Great job off to the next round"
  end

  def game_over_message
    puts "Game over, better luck next time."
  end

  def reset_game
    @sequence_length = 1
    @game_over = false
    @seq = []
  end
end
