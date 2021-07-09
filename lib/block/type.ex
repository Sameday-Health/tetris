import EnumType

defenum Tetris.Block.Type do
  value LeftL, "left_l"
  value RightL, "right_l"
  value Straight, "straight"
  value Square, "square"

  @doc """
    returns the cells occupied by the block relative to the origin at (0,0)
  """
  def get_cells(Tetris.Block.Type.LeftL) do
    [{0, 0}, {1, 0}, {2, 0}, {2, -1}]  
  end

  def get_cells(Tetris.Block.Type.RightL) do
    [{0, 0}, {1, 0}, {2, 0}, {2, 1}]  
  end

  def get_cells(Tetris.Block.Type.Square) do
    [{0, 0}, {1, 0}, {0, 1}, {1, 1}]  
  end

  def get_cells(Tetris.Block.Type.Straight) do
    [{0, 0}, {0, 1}, {0, 2}, {0, 3}]  
  end
end