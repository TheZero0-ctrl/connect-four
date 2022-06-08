require_relative "display"
class Board
    include Display
    attr_accessor :grid, :loc
    def initialize
        @grid = Array.new(6) {Array.new(7) {empty_circle}}
    end
    def update_grid(location, sym)
        @grid.reverse.each_with_index do |row,i|
            if row[location] == empty_circle
                row[location] = sym
                @loc = [(i-5).abs,location]
                break
            end
        end
        @grid
    end
end
