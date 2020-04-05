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
[3,5,7] # right_diagonal 
].freeze



def start_game(play = '')
  res = false
  until play.downcase == 'n' || play.downcase == 'y'
    puts "Start Game \n Enter Y/N"
    play = gets.chomp
  end
  res = true if play.downcase == 'y'
  res
end

 start_game

def get_player_name(player_hash = Hash.new)
  player1_name= ""
  player2_name= ""
  until !player1_name.empty?
    puts "Player 1 Enter your name"
    player1_name = gets.chomp
  end
  player_hash["X"] = player1_name
  puts "#{player_hash["X"]} your marker is X"
  
  until !player2_name.empty?
    puts "Player 2 Enter your name"
    player2_name = gets.chomp
  end
  player_hash["O"] = player2_name
  puts "#{player_hash["O"]} your marker is O"
  player_hash
  end

  player_hash =get_player_name


puts player_hash["X"]



dashboard_arr = %w[1 2 3 4 5 6 7 8 9]
def make_move(player, input = '')
  
  nums = "1".."9"
  until nums.include?(input)
  puts "#{player} turn"
  input = gets.chomp
  end
  input
 end

 def check_move(input, player, dashboard_arr, good_move = true)
  
     if  dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
      good_move = false
     end
     
    good_move 
 end

unless player_hash.empty?
        player = ''
        dashboard_arr.each_index do |x|
          can_move = true
           player = player_hash["X"] if x.even?
           player = player_hash["O"] if x.odd?
          
           input = make_move(player)
           if dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
            can_move = false
           else 
            can_move = true
           end
           
           until can_move == true
            puts "That spot is taken. \n Try Again..."
            input = make_move(player)
            if dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
            can_move = false
           else 
            can_move = true
           end
           end
          
          
          
   
          dashboard_arr[input.to_i - 1] = player_hash.key(player) if can_move 

          puts dashboard(dashboard_arr)
        end  
end