#!/usr/bin/env ruby

require_relative '../lib/interface'
require 'pry'

char_array = %w[1 2 3 4 5 6 7 8 9]
player_one = Player.new
player_two = Player.new

player_one.mark = 'x'
player_two.mark = 'o'

puts "Welcome to Tic-Tac-Toe.\nPlayer one please enter Your name."
player_one.name = gets.chomp

puts 'Now player two please enter your name.'
player_two.name = gets.chomp
puts "\n"
puts "Hello #{player_one.name} and #{player_two.name}!\n"
puts "In order to win the game,
a player must place three of their marks in a
horizontal, vertical, or diagonal row."
puts "\n"

puts "\n"
puts "#{player_one.name} your mark is -- #{player_one.mark}."
puts "#{player_two.name} your mark is -- #{player_two.mark}."
puts "\n"
game = Board.new
game.update_array
puts "\n"
puts "#{player_one.name} your turn. Enter the number of where you would like to place your mark. "
mark = gets.chomp
game_on = true
moves = 0
x_wins = false
o_wins = false
skip = false
skip2 = false
while game_on
  break unless (moves >= 9) == false && x_wins == false

  break unless (moves >= 9) == false && o_wins == false

  skip = true
  until char_array.include? mark

    if mark.to_i > 9 || mark.to_i < 1
      puts "#{player_one.name} you have chosen an Invalid input, Please sellect a valid number from 1 to 9."
      skip = true
    end

    if skip
      skip2 = skip2
    else
      puts "#{player_one.name} That space has been filled. You must choose another space on the game board."
    end
    skip = false

    break unless x_wins == false

    puts "\n"
    puts "#{player_one.name} please enter the number of where you would like to place your mark. "
    mark = gets.chomp
    game.update_array
    puts "\n"
    next unless char_array.include? mark
  end
  char_array[mark.to_i - 1] = player_one.mark
  game.updated_board(mark, player_one.mark)

  puts "\n"
  moves += 1
  break if moves > 9

  game.update_array
  puts "\n"
  game_on = game.score_test_x
  x_wins = !game_on

  skip = true
  until char_array.include? mark

    if mark.to_i > 9 || mark.to_i < 1
      puts "#{player_two.name} you have chosen an Invalid input, Please sellect a valid number from 1 to 9."
      skip = true
    end

    if skip
      skip2 = skip2
    else
      puts "#{player_two.name} That space has been filled. You must choose another space on the game board."
    end
    skip = false

    break unless x_wins == false

    puts "\n"
    puts "#{player_two.name} please enter the number of where you would like to place your mark. "
    mark = gets.chomp
    game.update_array
    puts "\n"
    next unless char_array.include? mark
  end
  char_array[mark.to_i - 1] = player_two.mark
  game.updated_board(mark, player_two.mark)
  puts "\n"
  moves += 1
  game.update_array

  game_on = game.score_test_o
  o_wins = !game_on
end

puts "\n"
if x_wins
  puts "#{player_one.name} wins the match!"
elsif o_wins
  puts "#{player_two.name} wins the match!"
else
  puts "It's a tie?!"
end
game.update_array
puts "\n"
