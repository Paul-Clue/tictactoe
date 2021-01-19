#!/usr/bin/env ruby

require_relative '../lib/interface'

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

game_on = true

while game_on
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
  board = Players.new
  board.fist_board
  repeat_loop = true
  while repeat_loop
    puts "\n"
    puts "#{player_one} your turn. Enter the number of where you would like to place your mark. "
    played_num = gets.chomp.to_i
    board.player_move(played_num, player_one_mark)

    player_one_num = Players.new
    player_one_num.player_move(played_num, player_one_mark)
    # I winner will be checked here
    check = player_one_num.valid(played_num)
    if check == true
      puts 'number taken, please enter a valid number'
      repeat_loop = true
    else
      repeat_loop = false
      puts "#{player_two} your turn. Enter the number of where you would like to place your mark. "
      board.fist_board
      played_num = gets.chomp.to_i
      board.player_move(played_num, player_two_mark)

      player_two_num = Players.new
      player_two_num.player_move(played_num, player_two_mark)
      # I winner will be checked here as well
      check = player_two_num.valid(played_num)
      if check == true
        puts 'number taken, please enter a valid number'
        repeat_loop = true
      else
        repeat_loop = false
        game_on = false
      end
    end
  end
  #   game_on = false if winner # and/or draw (the exact condition in this milestone is not important)
  if is_winner == player_one
    #     puts "\n"
    puts "*********#{player_one}wins the match!******"
  elsif puts "\n"
    puts "********#{player_two} wins the match!******"
  else
    #     puts "\n"
    puts 'It is a draw ! do you wan play again?'
    puts 'y / n'
    response = gets.chomp
    unless response game_on = false
    end
  end
end
