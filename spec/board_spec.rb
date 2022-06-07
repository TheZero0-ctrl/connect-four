require_relative "../lib/board.rb"

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
end