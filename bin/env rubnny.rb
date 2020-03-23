#!/usr/bin/env ruby

dashboard_arr = %w[1 2 3 4 5 6 7 8 9]

def dashboard(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

#creating hashes to store player names and key
 player_hash = Hash.new

loop do
  puts "Ready? \n Enter n to exit the game!"

  play = gets.chomp

  puts 'Exiting game!!!' if play.downcase == 'n'
  break if play.downcase == 'n'
  loop do
    puts "Player 1 Enter your name"
    player1_name = gets.chomp

    if player1_name.empty?
      puts "please Enter at least one character"
    else
      player_hash[1] = player1_name
      break
    end

  end

  loop do
    puts "Player 2 Enter your name"
    player2_name = gets.chomp

    if player2_name.empty?
      puts "please Enter at least one character"
    else
      player_hash[2] = player2_name
      break
    end

  end


  puts "Player 1 enter your name. \n Your marker will be X"


  dashboard_arr.each_index do |x|
    nums = '1'..'9'

    player = 1 if x.to_i.even?
    player = 2 if x.to_i.odd?

    puts " ========================
 ========================"
    loop do
      puts "Player#{player}\n Make a move with number from 1 to 9"
      input = gets.chomp
     
      puts 'Your move is not valid!' unless nums.include?(input)

      loop do
      if player == 1 && nums.include?(input)
         unless  dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
          dashboard_arr[input.to_i - 1] = 'X'
          break
         end
         puts "Player#{player}\n Your move is not valid select an empty space"
      input = gets.chomp
      
      puts 'Your move is not valid!' unless nums.include?(input)
      break unless nums.include?(input)
      elsif player == 2 && nums.include?(input)
        unless dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
          dashboard_arr[input.to_i - 1] = 'O'
          break
         end
         puts "Player#{player}\n Your move is not valid select an empty space"
      input = gets.chomp
      
      puts 'Your move is not valid!' unless nums.include?(input)
      break unless nums.include?(input)
      end
    end
      dashboard(dashboard_arr)
      break if nums.include?(input)
    end
  end
end
