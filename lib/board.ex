defmodule Tetris.Board do
  alias Tetris.Block
  defstruct rows: nil

  @type t :: %__MODULE__{
    rows: [integer()]
  }
  # cell represents coordinates inside of the tetris board 
  # in row x column notation starting with index of 0
  @type column :: integer()
  @type row :: integer()
  @type cell :: {row(), column()}

  @unoccupied 0
  @occupied 1
  @doc """
    create a new board with all cells unoccupied
  """
  def create_board(rows, columns) do
    if rows <= 0 or columns <= 0 do
      raise "rows and columns must be greater than 0"
    end
    rows = 
      List.duplicate(@unoccupied, columns)
      |> List.duplicate(rows)

    %__MODULE__{rows: rows}
  end

  def is_occupied?(board, row, column) do
    cell = board.rows |> Enum.at(row) |> Enum.at(column)
    cell == @occupied
  end

  @doc """
    return a new board with block placed into the designated column
  """
  @spec place_block(__MODULE__.t(), Block.t(), column) :: Board.t()
  def place_block(board, block, column) do
    
  end

  defp is_block_set(board, block, position) do
    
  end
end