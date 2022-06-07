require_relative "./lib/board"
require_relative "./lib/display"

board = Board.new

puts board.update_grid(0,board.yellow_circle)