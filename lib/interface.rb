# rubocop:disable Metrics/CyclomaticComplexity
module Validation
  # def valid(num)
  #   @@invalid_num << num
  #   @@invalid_num
  # end
end

class Player
  attr_reader :p_mark
  attr_accessor :p_move

  def initialize(p_mark, p_move=0)
    @p_mark = p_mark
    @p_move = p_move
  end  
end  




class Board < Player
  include Validation
  # @@lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  # @@invalid_num = [1, 2, 3]
  @@lines = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
  @@char_array = %w[1 2 3 4 5 6 7 8 9]
  @@invalid_num = [1, 2, 3]

  attr_reader :board_array

  def initialize(board_array)
    @board_array = board_array
  end

  def player_move(num, mark)
    case num
    when 1
      @@lines[0][0] = mark
      @@invalid_num << num
    when 2
      @@lines[0][1] = mark
      @@invalid_num << num
    when 3
      @@lines[0][2] = mark
      @@invalid_num << num
    when 4
      @@lines[1][0] = mark
      @@invalid_num << num
    when 5
      @@lines[1][1] = mark
      @@invalid_num << num
    when 6
      @@lines[1][2] = mark
      @@invalid_num << num
    when 7
      @@lines[2][0] = mark
      @@invalid_num << num
    when 8
      @@lines[2][1] = mark
      @@invalid_num << num
    when 9
      @@lines[2][2] = mark
      @@invalid_num << num
    else
      puts 'you entered an invalid number please try again'
    end
  end

  def updated_board
    @@lines
  end

  def valid(num)
    if @@invalid_num.any?(num)
      true
    else
      @@invalid_num << num
      @@invalid_num
    end
  end
end

board = Players.new

# p board.valid()
# rubocop:enable Metrics/CyclomaticComplexity
