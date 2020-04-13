#!/usr/bin/env ruby
require_relative '../lib/user_interface.rb'

def start_game(play = '')
  res = false
  until play.downcase == 'n' || play.downcase == 'y'
    puts "Start Game \n Enter Y/N"
    play = gets.chomp
  end
  res = true if play.downcase == 'y'
  res
end

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

start_game
player_hash =get_player_name

game_on = Game_mode.new(player_hash)
dashboard_arr = %w[1 2 3 4 5 6 7 8 9]
unless player_hash.empty?
  player1_history = Array.new
  player2_history = Array.new
        player = ''
        dashboard_arr.each_index do |x|
          can_move = true
           player = player_hash["X"] if x.even?
           player = player_hash["O"] if x.odd?
          
          ans = game_on.valid_move?(player, dashboard_arr, player_hash)
          if ans[0]
            player_history = player1_history if player == player_hash["X"]
              player_history = player2_history if player == player_hash["O"]
              input = ans[1]
              player_history.push(input)
              dashboard_arr[input.to_i - 1] = player_hash.key(player)
            else
              until ans[0]
              puts "#{player}, your move is not valid. Spot taken!"
              ans = game_on.valid_move?(player, dashboard_arr,player_hash)
              end
              player_history = player1_history if player == player_hash["X"]
              player_history = player2_history if player == player_hash["O"]
              input = ans[1]
              player_history.push(input)
              dashboard_arr[input.to_i - 1] = player_hash.key(player)
          end
          
          if game_on.check_win(player, player_history)
            game_on.game_over(player)
            puts game_on.dashboard(dashboard_arr)
            break
          elsif x== 8
            puts "Wow! it's a draw."
        end
          puts game_on.dashboard(dashboard_arr)
        end  
end







