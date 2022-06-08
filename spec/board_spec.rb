require_relative "../lib/board.rb"
require_relative "../lib/connect-four"
require_relative "../lib/player"

describe Board do
    let(:board) {Board.new()}
    context 'when initialize' do
        it "returns grid" do
            expect(board.grid).to eql([
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ])
        end
    end

    context "when data of row changed" do
        it "returns new grid" do
            expect(board.update_grid(0,"\e[33m\u25cf\e[0m")).to eql([
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ])
        end
        it "is another case" do
            board.grid = ([
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ])
            expect(board.update_grid(0,"\e[33m\u25cf\e[0m")). to eql([
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ])
        end
    end

    # context "what is near list" do
    #     it "returns the list of cell sourring location" do
    #         board.update_grid(0,"\e[33m\u25cf\e[0m")
    #         expect(board.near).to eq([
    #             [-1,0],
    #             [1,0],
    #             [0,-1],
    #             [1,1],
    #             [1,-1],
    #             [-1,1],
    #             [-1,-1],
    #         ])
    #     end

    #     it "is another case" do
    #         board.update_grid(1,"\e[33m\u25cf\e[0m")
    #         board.update_grid(1,"\e[33m\u25cf\e[0m")
    #         expect(board.near).to eq([
    #             [0,1],
    #             [2,1],
    #             [1,0],
    #             [2,2],
    #             [2,0],
    #             [0,2],
    #             [0,0],
    #         ])
    #     end
            
    # end

    # context "filter the near list" do
    #     it "return valid list" do
    #         board.update_grid(0,"\e[33m\u25cf\e[0m")
    #         expect(board.filter_near).to eq([
    #             [1,0],
    #             [1,1],
    #         ])
    #     end

    #     it "is another case" do
    #         board.update_grid(1,"\e[33m\u25cf\e[0m")
    #         board.update_grid(1,"\e[33m\u25cf\e[0m")
    #         expect(board.filter_near).to eq([
    #             [0,1],
    #             [2,1],
    #             [1,0],
    #             [2,2],
    #             [2,0],
    #             [0,2],
    #             [0,0],
    #         ])
    #     end
        
    # end
end

describe ConnectFour do
    let(:connect_four) {ConnectFour.new()}
    context "when switching trun" do
        it "change the cureent player" do
            connect_four.switch_trun
            expect(connect_four.current_player.name).to eq("player2")
        end
    end

    context "when draw" do
        it "return true" do
            connect_four.board.grid = Array.new(6) {Array.new(7) {"\e[33m\u25cf\e[0m"}}
            expect(connect_four).to be_draw
        end
        it "return false" do
            connect_four.board.grid = [
                ["\u25cb","\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ]
            expect(connect_four).not_to be_draw
        end
    end

    context "when win" do
        it "return true" do
            connect_four.board.grid = [
                ["\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ]
            expect(connect_four.win?([0,3])).to eq(true)
        end
        it "another case" do
            connect_four.board.grid = [
                ["\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ]
            expect(connect_four.win?([0,2])).to eq(false)
        end

        it "verticle case" do
            connect_four.board.grid = [
                ["\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ]
            expect(connect_four.win?([5,0])).to eq(true)
        end
        it "diagonal case" do
            connect_four.board.grid = [
                ["\e[33m\u25cf\e[0m","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ]
            expect(connect_four.win?([1,3])).to eq(true)
        end

        it "digonal false case" do
            connect_four.board.grid = [
                ["\u25cb","\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\u25cb","\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
                ["\e[33m\u25cf\e[0m","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb","\u25cb"],
            ]
            expect(connect_four).not_to be_win([3,2])
        end
    end
end