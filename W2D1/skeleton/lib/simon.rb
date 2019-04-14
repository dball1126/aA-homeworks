class Simon
  COLORS = %w(red blue green yellow)

  attr_accessor :sequence_length, :game_over, :seq

  def initialize
    @game_over = false 
    @sequence_length = 1
    @seq = []
  end

  def play
        until @game_over
          self.take_turn 
        end
        self.game_over_message
        self.reset_game
  end

  def take_turn
     turn_seq = self.show_sequence
      user_seq = self.require_sequence

      if @game_over != true 
        @sequence_length += 1
        self.round_success_message
      end

  end

  def show_sequence
      self.add_random_color
      @seq
  end

  def require_sequence
      @user_seq = gets.chomp
       if @user_seq == @seq
        @game_over = true
       end
  end

  def add_random_color
      random_num = rand(COLORS.length)  
    @seq << COLORS[random_num]
  end

  def round_success_message
        p "YOU GOT IT"
  end

  def game_over_message
    p "you WIN"
  end

  def reset_game
    self.game_over = false
    @sequence_length = 1
    @seq = []

  end
end
