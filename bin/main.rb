#!/usr/bin/env ruby
require_relative '../lib/user_interface'
winning_Steps = [ 
[1,2,3], # top_row 
[4,5,6], # middle_row 
[7,8,9], # bottom_row 
[1,4,7], # left_column 
[2,5,8], # center_column 
[3,6,9], # right_column 
[1,5,9], # left_diagonal 
[3,5,7], # right_diagonal 
[1,5,6,8]
].freeze

game_over = false

player1_history = []
player2_history = []

player1_won = false
player2_won = false


nums = "1".."9"

dashboard_arr = %w[1 2 3 4 5 6 7 8 9]
#creating hashes to store player names and key
player_hash = Hash.new
counter=0


loop do 
  puts "Ready? \n Enter n to exit the game!"
  
  play = gets.chomp
  
  puts 'Exiting game!!!' if play.downcase == 'n'
  break if play.downcase == 'n'
  
  
  def get_player_name(player_hash)
  player1_name= ""
  player2_name= ""
  until !player1_name.empty?
    puts "Player 1 Enter your name"
    player1_name = gets.chomp
  end
  player_hash[1] = player1_name
  
  until !player2_name.empty?
    puts "Player 2 Enter your name"
    player2_name = gets.chomp
  end
  player_hash[2] = player2_name
  
  player_hash
  end
  
  puts get_player_name(player_hash)
  
  dashboard_arr.each_index do |x|
    player = 1 if x.to_i.even?
    player = 2 if x.to_i.odd?
  
  
    user = player_hash[1] if player == 1
    user = player_hash[2] if player == 2
    
    loop do
  
    puts "#{user}, \n Make a move with number from 1 to 9"
    input = gets.chomp
   
    puts 'Your move is not valid!' unless nums.include?(input)
  
    until nums.include?(input)
      puts "#{user},\n Make a move with number from 1 to 9"
      input = gets.chomp
     
      puts 'Your move is not valid!' unless nums.include?(input)
    end
  
    if player == 1 && nums.include?(input)
      unless  dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
        player1_history.push(input.to_i)
      
        
        dashboard_arr[input.to_i - 1] = 'X'
  
        if check_win(winning_Steps, player1_history)
          puts "Wow!! #{user} won"
          game_over = true
          break
        end
        break
       end
       puts "#{user}, #{input} is taken try again!"
      elsif player == 2 && nums.include?(input)
        unless dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
          player2_history.push(input.to_i)
  
          dashboard_arr[input.to_i - 1] = 'O'
          if check_win(winning_Steps, player2_history)
            puts "Wow!! #{user} won"
            game_over = true
          end
           
          break
         end
         puts "#{user}, #{input} is taken try again!"
    end
    end
   
    dashboard(dashboard_arr)
   if game_over
    puts "Thanks for Playing!"
    break 
   end
  end
  break
  end
  
  
  