#!/usr/bin/env ruby

winning_Steps = [ 
[1,2,3], # top_row 
[4,5,6], # middle_row 
[7,8,9], # bottom_row 
[1,4,7], # left_column 
[2,5,8], # center_column 
[3,6,9], # right_column 
[1,5,9], # left_diagonal 
[7,5,3] # right_diagonal 
]



dashboard_arr = %w[1 2 3 4 5 6 7 8 9]

def dashboard(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

nums = "1".."9"

#creating hashes to store player names and key
player_hash = Hash.new

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

  def win?(arr)
    if arr.length >= 2
      winning_Steps.include?(arr.sort!)
    end
  end

  user = player_hash[1] if player == 1
  user = player_hash[2] if player == 2
  
  arr1 = []
  arr2 = []


  user1_won = nil
  user2_won = nil
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
      arr1<<dashboard_arr[input.to_i - 1]
      puts arr1
      dashboard_arr[input.to_i - 1] = 'X'
      user1_won = true if win?(arr1)
      break
     end
     puts "#{user}, #{input} is taken try again!"
    elsif player == 2 && nums.include?(input)
      unless dashboard_arr[input.to_i - 1] == "X" || dashboard_arr[input.to_i - 1] =="O"
        arr2<<dashboard_arr[input.to_i - 1]
        puts arr2
        dashboard_arr[input.to_i - 1] = 'O'
        user2_won = true if win?(arr2)
        break
       end
       puts "#{user}, #{input} is taken try again!"
  end
  end
  if user1_won
    puts "Wow #{user} won!!!"
    
    elsif user2_won
      puts "Wow #{user} won!!!"

  end
  dashboard(dashboard_arr)
end
end


