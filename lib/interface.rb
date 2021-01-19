# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Style/ClassVars
# rubocop:disable Metrics/MethodLength
module Validation
  # def valid(num)
  #   @@invalid_num << num
  #   @@invalid_num
  # end
end

class Players
  # include Validation
  @@lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  @@invalid_num = []

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

  def first_board
    @@lines.each do |line|
      line.each do |char|
        print "| #{char} |"
      end
      puts
    end
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

# rubocop:enable Metrics/CyclomaticComplexity
# rubocop:enable Style/ClassVars
# rubocop:enable Metrics/MethodLength
