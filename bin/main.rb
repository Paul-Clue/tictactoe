#!/usr/bin/env ruby

puts "Welcome to Tic-Tac-Toe.\nPlayer one please enter Your name."
player_1 = gets.chomp
puts "Now player two please enter your name."
player_2 = gets.chomp
puts "\n"
puts "Hello #{player_1} and #{player_2}!\n"
puts "In order to win the game,\na player must place three of their marks in a\nhorizontal, vertical, or diagonal row.\n"
puts "#{player_1} please choose your mark by entering \"x\" or \"o\" below.\n"
player_1_mark = gets.chomp
