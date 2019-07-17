require_relative "pieces"

class Board
  attr_reader :chess_board, :null_piece, :piece
  def initialize()

    @chess_board = Array.new(8) {Array.new(8)}
    @piece = Piece.new
    @null_piece = NullPiece.new
    #@chess_board[]
  end

  def [](pos)
    row, col = pos
    @chess_board[row][col]
  end

  def []=(pos, val)
    row, col = pos
    @chess_board[row][col] = val
  end

  def move_piece(start_pos, end_pos)
    raise "No piece here" if @chess_board[start_pos] == @null_piece
    raise "Not a valid position" if !valid_pos?(end_pos)
    @chess_board[end_pos] = @chess_board[start_pos]
    @chess_board[start_pos] = @null_piece



  end

  def valid_pos?(pos)
    pos.all? { |ele| ele >= 0 && ele <= 7 }
  end
end
