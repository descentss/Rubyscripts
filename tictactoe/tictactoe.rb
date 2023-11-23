# Displays all the code regarding the Board Class
class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, "-")}
  end

    def display_board
        @grid.each do |row|
            puts row.join(" ")
        end
    end

    def update_board (row, col, symbol)
        return false if @grid[row][col] != "-"
        @grid[row][col] = symbol
        true
    end

    def win? (symbol)
        # Check rows for a win
        row_win = @grid.any? do |row|
            row.all? { |cell| cell == symbol}
        end
        return true if row_win

        # Check columns for a win
        column_win=@grid.transpose.any? do |col|
            col.all? { |cell| cell == symbol}
        end
        return true if column_win

        # Check diagonals for a win
        diagonal_win = [@grid, @grid.map(&:reverse)].any? do |grid|
            (0...grid.size).all? { |i| grid[i][i] == symbol}
        end
        return true if diagonal_win
    end

    def tie? 
        all_cells_filled = @grid.all? do |row|
        row.none? { |cell| cell == "-" }
        end

        no_winner = !win?("X") && !win?("O")

        all_cells_filled && no_winner
    end
end

class Player
    attr_reader :name, :symbol

    def initialize(name, symbol)
        @name = name
        @symbol = symbol
    end

    def make_move(board)
        loop do
            puts "#{@name}, Please enter your move (row and column): for example: 11 for upper left row"
            row, col = gets.chomp.split.map(&:to_i)
            puts "You entered row: #{row}, col: #{col}"
            if board.update_board(row, col, @symbol)
                break
            else 
                puts "Invalid move, please try again"
            end
        end
    end
end

class Game
    def initialize
        @board = Board.new
        @player1 = Player.new("Player 1","X")
        @player2 = Player.new("Player 2", "O")
        @current_player = @player1
    end

    def switch_players
        @current_player = @current_player == @player1 ? @player2 : @player1
    end

    def game_over?
        @board.win?(@current_player.symbol) || @board.tie?
    end

    def finish_game
        @board.display_board
        if @board.win?(@current_player.symbol)
            puts "#{@current_player.name} wins!"
        else
            puts "It's a tie!"
        end
    end

    def play
        loop do
            puts "Displaying Board"
            @board.display_board

            puts "Asking for a move"
            @current_player.make_move(@board)

            puts "Checking if game is over"
            break if game_over?

            puts "Switching players"
            switch_players
        end
        finish_game
    end
end

tictac = Game.new
tictac.play



