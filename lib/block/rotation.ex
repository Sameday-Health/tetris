import EnumType

defenum Tetris.Block.Rotation do
  @moduledoc """
    Number of clockwise 90 degree rotations applied to the associated block
  """
  value Zero, 0
  value One, 1
  value Two, 2
  value Three, 3

  @num_types 4
  def rotate_right(rotation) do
    value = Integer.mod(rotation.value + 1, @num_types)
    Tetris.Block.Rotation.from(value)
  end

  def rotate_left(rotation) do
    value = Integer.mod(rotation.value - 1, @num_types)
    Tetris.Block.Rotation.from(value)
  end

  def rotate_cells(cells, rotation) do
    cells
    |> Enum.map(fn cell -> 
      cell |> rotate_cell(rotation)
    end)
  end

  defp rotate_cell(cell, rotation) do
    num_rotations = rotation.value

    if num_rotations > 0 do
      1..num_rotations
      |> Enum.reduce(cell, fn _x, {r, c} ->
        rotate_right(r, c)
      end)
    else
      cell
    end
  end

  defp rotate_right(r, c) do
    # rotate clockwise by 90 degrees
    {c, -r}
  end
end