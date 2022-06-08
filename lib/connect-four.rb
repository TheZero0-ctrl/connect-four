require_relative "board"
require_relative "display"
require_relative "player"


class ConnectFour
    include Display
    @@WINING_COMBO = [[0,-1],[0,1],[1,0],[1,-1],[1,1],[-1,-1],[-1,1]]
    attr_accessor :player_1, :player_2, :board, :current_player, :other_player, :play_game
    def initialize()
        @player_1 = Player.new(yellow_circle,"player1")
        @player_2 = Player.new(blue_circle,"player2")
        @board = Board.new
        @current_player = @player_1
        @other_player = @player_2
        @play_game = true
    end
    def play
        puts description
        while @play_game
            one_round
            p board.loc
            if win?(board.loc)
                display_grid(board.grid)
                board.grid = Array.new(6) {Array.new(7) {empty_circle}}
                puts "#{@current_player.name}, win the game"
                play_again
                player_1,player_2 = player_2,player_1
            elsif draw?
                display_grid(board.grid)
                board.grid = Array.new(6) {Array.new(7) {empty_circle}}
                board.grid.clear
                puts "neither of you won"
                play_again
                player_1,player_2 = player_2,player_1
            end
            switch_trun
        end
    end

    def getInput
        location = gets.chomp.to_i
        until location.between?(0,8)
            puts "enter correct number"
            location = gets.chomp.to_i
        end
        location
    end

    def switch_trun
        @current_player,@other_player = @other_player,@current_player
    end

    def one_round
        display_grid(board.grid)
        puts "#{@current_player.name} choose location"
        location = getInput
        board.update_grid(location-1,@current_player.sym)
    end

    def draw?
        board.grid.all? { |row| row.none? { |cell| cell == empty_circle }}
    end

    def play_again
        puts "want to play again?"
        puts "type 'y' if you want to play"
        if gets.chomp.downcase == "y"
            @play_game = true
        else
            @play_game = false
        end
    end
    def win?(loc)
        @@WINING_COMBO.each do |pos|
        
            check_position = [pos[0]+loc[0], pos[1]+loc[1]]
            if check_position[0].between?(0,5) && check_position[1].between?(0,6)
                if board.grid[check_position[0]][check_position[1]] == current_player.sym
                    check_position = [pos[0]+check_position[0], pos[1]+check_position[1]]
                    if check_position[0].between?(0,5) && check_position[1].between?(0,6)
                        if board.grid[check_position[0]][check_position[1]] == current_player.sym
                            check_position = [pos[0]+check_position[0], pos[1]+check_position[1]]
                            if check_position[0].between?(0,5) && check_position[1].between?(0,6)
                                if board.grid[check_position[0]][check_position[1]] == current_player.sym
                                    return true
                                end
                            end
                        end
                    end
                end
            end
        end
        false
    end

end
