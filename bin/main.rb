#!/usr/bin/env ruby
# rubocop:disable Metrics/BlockNesting

require_relative '../lib/interface'

# lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
lines = [%w[1 2 3], %w[4 5 6], %w[7 8 9]]
char_array = %w[1 2 3 4 5 6 7 8 9]
# winning_combo = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

puts "Welcome to Tic-Tac-Toe.\nPlayer one please enter Your name."
player_one = gets.chomp
puts 'Now player two please enter your name.'
player_two = gets.chomp
puts "\n"
puts "Hello #{player_one} and #{player_two}!\n"
puts "In order to win the game,
a player must place three of their marks in a
horizontal, vertical, or diagonal row."
puts "\n"
puts "#{player_one} please choose your mark by entering \"x\" or \"o\" below.\n"
player_one_mark = gets.chomp

while player_one_mark != 'x' && player_one_mark != 'o'
  puts 'You can only select an "x" or an "o" for your mark.'
  puts "\n"
  puts "#{player_one} please choose your mark by entering \"x\" or \"o\" below.\n"
  player_one_mark = gets.chomp
end
player_two_mark = if player_one_mark == 'x'
                    'o'
                  else
                    'x'
                  end

puts "\n"
puts "#{player_one} your mark is -- #{player_one_mark}."
puts "And #{player_two} your mark is -- #{player_two_mark}."
puts "\n"
puts "\n"
lines.each do |line|
  puts "#{line} "
end
puts "\n"
puts "#{player_one} your turn. Enter the number of where you would like to place your mark. "
mark = gets.chomp
puts "\n"

game_on = true
moves = 0
x_wins = false
o_wins = false
x_wins2 = []
o_wins2 = []
char_index = 0
while game_on
  break unless (moves >= 9) == false

  until char_array.include? mark
    break unless o_wins == false

    puts 'You can only select an integer, and that integer must be on the game board.'
    puts "\n"
    puts "#{player_one} your turn. Enter the number of where you would like to place your mark. "
    mark = gets.chomp
    next unless char_array.include? mark
  end
  lines.each_with_index do |v, s|
    v.each_with_index do |i, t|
      if i == mark
        lines[s][t] = player_one_mark
        char_array[char_index] = player_one_mark
      end
      char_index += 1
    end
  end

  puts "\n"
  puts "\n"
  moves += 1
  lines.each do |line|
    puts "#{line} "
  end

  # Check The Score
  score = 0
  lines.each do |v|
    score += 1 if v == %w[x x x]
    next unless score == 1

    game_on = false
    x_wins = true
    x_wins2 = lines
    break
  end

  puts '------------------------'
  puts '------------------------'
  # Columns
  score = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      score += 1 if v[s - 1] == 'x'
    end
    next unless score == 3

    game_on = false
    x_wins = true
    x_wins2 = lines
    break
  end

  score = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      score += 1 if v[s] == 'x'
    end
    next unless score == 3

    game_on = false
    x_wins = true
    x_wins2 = lines
    break
  end

  score = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      score += 1 if v[s + 1] == 'x'
    end
    next unless score == 3

    game_on = false
    x_wins = true
    x_wins2 = lines
    break
  end

  score = 0
  index = 0
  lines.each do |v|
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

  puts "#{player_two} your turn. Enter the number of where you would like to place your mark. "
  mark = gets.chomp unless x_wins == true || moves == 9
  char_index = 0
  until char_array.include? mark
    break unless x_wins == false

    puts 'You can only select an integer, and that integer must be on the game board.'
    puts "\n"
    puts "#{player_two} your turn. Enter the number of where you would like to place your mark. "
    mark = gets.chomp
    next unless char_array.include? mark
  end
  lines.each_with_index do |v, s|
    v.each_with_index do |i, t|
      if i == mark
        lines[s][t] = player_two_mark
        char_array[char_index] = player_two_mark
      end
      char_index += 1
    end
  end

  puts "\n"
  puts "\n"
  moves += 1
  lines.each do |line|
    puts "#{line} "
  end

  # Check The Score
  score = 0
  lines.each do |v|
    score += 1 if v == %w[o o o]
    next unless score == 1

    game_on = false
    o_wins = true
    o_wins2 = lines
    break
  end

  puts '------------------------'
  puts '------------------------'
  # Columns
  score = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      score += 1 if v[s - 1] == 'o'
    end
    next unless score == 3

    game_on = false
    o_wins = true
    o_wins2 = lines
    break
  end

  score = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      score += 1 if v[s] == 'o'
    end
    next unless score == 3

    game_on = false
    o_wins = true
    o_wins2 = lines
    break
  end

  score = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      score += 1 if v[s + 1] == 'o'
    end
    next unless score == 3

    game_on = false
    o_wins = true
    o_wins2 = lines
    break
  end

  score = 0
  index = 0
  lines.each do |v|
    break if x_wins

    1.step(1) do |s|
      s += index
      score += 1 if v[s - 1] == 'o'
    end
    index += 1
    next unless score == 3

    game_on = false
    o_wins = true
    o_wins2 = lines
    break
  end
end

puts "\n"
if x_wins
  puts "#{player_one} wins the match!"
elsif o_wins
  puts "#{player_two} wins the match!"
else
  puts "It's a tie?!"
end
lines.each do |line|
  puts "#{line} "
end

# rubocop:enable Metrics/BlockNesting
