# rubocop:disable Metrics/CyclomaticComplexity
# rubocop:disable Metrics/PerceivedComplexity

class Player
  attr_accessor :mark, :move, :name

  def initialize
    @mark = ''
    @move = ''
    @name = ''
  end
end

$lines = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
$char_array = %w[1 2 3 4 5 6 7 8 9]

class Board < Player
  def updated_board(mak, pmk)
    char_index = 0
    mark = mak
    player_mark = pmk
    $lines.each_with_index do |v, s|
      v.each_with_index do |i, t|
        if i == mark
          $lines[s][t] = player_mark
          $char_array[char_index] = player_mark
        end
        char_index += 1
      end
    end
  end

  def p_one_loop(mak, o_w, p_one)
    mark = mak
    o_wins = o_w
    player_one = p_one
    until $char_array.include? mark
      break unless o_wins == false

      puts 'You can only select an integer, and that integer must be on the game board.'
      puts "\n"
      puts "#{player_one} your turn. Enter the number of where you would like to place your mark. "
      mark = gets.chomp
      next unless $char_array.include? mark
    end
    mark
  end

  def update_array
    $lines.each do |line|
      line.each do |c|
        print "|_#{c}_| "
      end
      puts ''
    end
  end

  def score_test_x
    game_on = true
    x_wins = false
    score = 0
    $lines.each do |v|
      score += 1 if v == %w[x x x]
      next unless score == 1

      game_on = false
      x_wins = true
      break
    end

    puts '------------------------'
    puts '------------------------'
    # Columns
    score = 0
    $lines.each do |v|
      break if x_wins

      1.step(1) do |s|
        score += 1 if v[s - 1] == 'x'
      end
      next unless score == 3

      game_on = false
      x_wins = true
      break
    end

    score = 0
    $lines.each do |v|
      break if x_wins

      1.step(1) do |s|
        score += 1 if v[s] == 'x'
      end
      next unless score == 3

      game_on = false
      x_wins = true
      break
    end

    score = 0
    $lines.each do |v|
      break if x_wins

      1.step(1) do |s|
        score += 1 if v[s + 1] == 'x'
      end
      next unless score == 3

      game_on = false
      x_wins = true
      break
    end

    score = 0
    index = 0
    $lines.each do |v|
      break if x_wins

      1.step(1) do |s|
        s += index
        score += 1 if v[s - 1] == 'x'
      end
      index += 1
      next unless score == 3

      game_on = false
      x_wins = true
      break
    end
    game_on
  end

  def score_test_o
    game_on = true
    o_wins = false
    score = 0

    $lines.each do |v|
      score += 1 if v == %w[o o o]
      next unless score == 1

      game_on = false
      o_wins = true
      break
    end

    puts '------------------------'
    puts '------------------------'
    # Columns
    score = 0
    $lines.each do |v|
      break if o_wins

      1.step(1) do |s|
        score += 1 if v[s - 1] == 'o'
      end
      next unless score == 3

      game_on = false
      o_wins = true
      break
    end

    score = 0
    $lines.each do |v|
      break if o_wins

      1.step(1) do |s|
        score += 1 if v[s] == 'o'
      end
      next unless score == 3

      game_on = false
      o_wins = true
      break
    end

    score = 0
    $lines.each do |v|
      break if o_wins

      1.step(1) do |s|
        score += 1 if v[s + 1] == 'o'
      end
      next unless score == 3

      game_on = false
      o_wins = true
      break
    end

    score = 0
    index = 0
    $lines.each do |v|
      break if o_wins

      1.step(1) do |s|
        s += index
        score += 1 if v[s - 1] == 'o'
      end
      index += 1
      next unless score == 3

      game_on = false
      o_wins = true
      break
    end
    game_on
  end
end

# rubocop:enable Metrics/PerceivedComplexity
# rubocop:enable Metrics/CyclomaticComplexity
