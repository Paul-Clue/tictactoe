#!/usr/bin/env ruby
lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# winning_combo = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

puts "Welcome to Tic-Tac-Toe.\nPlayer one please enter Your name."
player_one = gets.chomp
puts 'Now player two please enter your name.'
player_two = gets.chomp
puts "\n"
puts "Hello #{player_one} and #{player_two}!\n"
puts "In order to win the game,\n
a player must place three of their marks in a\n
horizontal, vertical, or diagonal row.\n"
puts "\n"
puts "#{player_one} please choose your mark by entering \"x\" or \"o\" below.\n"
player_one_mark = gets.chomp

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
# mark = gets.chomp

puts "#{player_two} your turn. Enter the number of where you would like to place your mark. "
# mark = gets.chomp

puts "\n"

puts "#{player_one} wins the match!"

puts "#{player_two} wins the match!"
