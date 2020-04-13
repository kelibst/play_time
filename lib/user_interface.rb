class GameMode
  attr_reader :winning_steps
  def initialize
    @winning_steps = [
      [1, 2, 3], # top_row
      [4, 5, 6], # middle_row
      [7, 8, 9], # bottom_row
      [1, 4, 7], # left_column
      [2, 5, 8], # center_column
      [3, 6, 9], # right_column
      [1, 5, 9], # left_diagonal
      [3, 5, 7] # right_diagonal
    ].freeze
  end

  def dashboard(board)
    puts " #{board[0]} | #{board[1]} | #{board[2]} "
    puts '-----------'
    puts " #{board[3]} | #{board[4]} | #{board[5]} "
    puts '-----------'
    puts " #{board[6]} | #{board[7]} | #{board[8]} "
  end

  def make_move(player, input = '')
    nums = '1'..'9'
    until nums.include?(input)
      puts "#{player} turn"
      input = gets.chomp
    end
    input
  end

  def check_win(_player, player_history)
    player_history.sort!

    win = false
    if player_history.length >= 3
      @winning_steps.each do |x|
        history_count = 0
        player_history.each do |y|
          history_count += 1 if x.include?(y.to_i)
          win = true if history_count == 3
        end
      end

    end
    win
  end

  def game_over(player)
    puts "Wow! #{player} Won!"
  end

  def valid_move?(player, dashboard_arr)
    input = make_move(player)
    good_move = true
    good_move = false if dashboard_arr[input.to_i - 1] == 'X' || dashboard_arr[input.to_i - 1] == 'O'
    [good_move, input]
  end
end
