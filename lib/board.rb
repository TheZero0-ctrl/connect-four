require_relative "display"
class Board
    include Display
    attr_accessor :grid
    def initialize
        @grid = Array.new(6) {Array.new(7) {empty_circle}}
    end
    def update_grid(location, sym)
        @grid.reverse.each do |row|
            if row[location] == empty_circle
                row[location] = sym
                break
            end
        end
        @grid
    end
end
