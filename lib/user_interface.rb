

def check_win(steps, player_history, won = false )
  player_history.sort!
 if player_history.length >= 2
  won = true if steps.include?(player_history)
 end
  
won
end



def dashboard(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts '-----------'
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts '-----------'
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end



