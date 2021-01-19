module Validation
  $invalid_move = []
  def valid?(num)
    invalid_move << num
    invalid_move
  end
end

class Players
  include Validations
  @@lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
  def player_move(num, mark)
    case num
    when 1
       @@lines[0][0] = mark
       break
    when 2
       @@lines[0][1] = mark
       break
    when 3
       @@lines[0][2] = mark
       break
    when 4
       @@lines[1][0] = mark
       break
    when 5
       @@lines[1][1] = mark
       break
    when 6
      @@lines[1][2] = mark
      break
    when 7
       @@lines[2][0] = mark
       break
    when 8
       @@lines[2][1] = mark
       break
    when 9
       @@lines[2][2] = mark
       break
    else
    puts "you entered an invalid number please try again"
  end

end
