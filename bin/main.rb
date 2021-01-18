#!/usr/bin/env ruby
lines = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
# winning_combo = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]

puts "Welcome to Tic-Tac-Toe.\nPlayer one please enter Your name."
player_1 = gets.chomp
puts 'Now player two please enter your name.'
player_2 = gets.chomp
puts "\n"
puts "Hello #{player_1} and #{player_2}!\n"
puts "In order to win the game,\na player must place three of their marks in a\nhorizontal, vertical, or diagonal row.\n"
puts "#{player_1} please choose your mark by entering \"x\" or \"o\" below.\n"
player_1_mark = gets.chomp

player_2_mark = if player_1_mark == 'x'
                  'o'
                else
                  'x'
                end

lines.each do |line|
  puts "#{line} "
end
puts "#{player_1} your turn. Enter the number of where you would like to place your mark. "
mark = gets.chomp

puts "#{player_2} your turn. Enter the number of where you would like to place your mark. "
mark = gets.chomp
