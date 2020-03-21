#!/usr/bin/env ruby

dashboard_arr = %w[1 2 3 4 5 6 7 8 9]

def dashboard(board)
        puts " #{board[0]} | #{board[1]} | #{board[2]} "
        puts '-----------'
        puts " #{board[3]} | #{board[4]} | #{board[5]} "
        puts '-----------'
        puts " #{board[6]} | #{board[7]} | #{board[8]} "
end


dashboard(dashboard_arr)


#get user input and transfor it into index for the array

# def index(user_input)
#   user_input.to_i -1
# end

# def plyer_move(dashboard_arr, index, player)
#   dashboard_arr(index) = player
# end

# def good_move?(dashboard_arr, index)
#   if (dashboard_arr(index) =="X") || (dashboard_arr(index) == "O") false : true 
# end


# def make_move?(dashboard_arr, index)
#   true if  index.between?(0,8) && good_move?(dashboard_arr, index) 
# end

def current_player(dashboard_arr)
   dashboard_arr.each_index {|x| x.even?} 
end

for x in dashboard_arr

  print current_player(dashboard_arr)
 
end

# class Run 
#     def initialize(player1, player2)
#         @player1 = player1
#         @player2 = player2
#     end
#     def dashboard(board)
#       puts " #{board[0]} | #{board[1]} | #{board[2]} "
#       puts '-----------'
#       puts " #{board[3]} | #{board[4]} | #{board[5]} "
#       puts '-----------'
#       puts " #{board[6]} | #{board[7]} | #{board[8]} "
#     end
  
# end


# dashboard_arr = %w[1 2 3 4 5 6 7 8 9]
# start =Run.new("keli", "Kelivin")
# start.dashboard(dashboard_arr)

