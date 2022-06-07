require_relative "board"
require_relative "display"
require_relative "player"


class ConnectFour
    include Display
    attr_accessor :player_1, :player_2, :board
    def initialize(player1,player2)
        @player_1 = player1
        @player_2 = player2
        @board = Board.new
        @current_player = player1
        @other_player = player2
        @play = true
    end
    def play
        puts description
        while play
            display_grid(board.grid)
        end
    end
end