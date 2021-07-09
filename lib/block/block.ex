defmodule Tetris.Block do

  alias Tetris.Block.Rotation
  alias Tetris.Block.Type
  alias Tetris.Board

  @moduledoc """

  ## Example Usage

  iex> %Tetris.Block{type: Tetris.Block.Type.Straight}
  """
  defstruct type: nil, rotation: Rotation.Zero

  # defines Block as a type for type checking. t is just a convention
  @type t :: %__MODULE__{
    type: Tetris.Block.Type.t(),
    rotation: Tetris.Block.Rotation.t()
  }
  
  @type cells :: [Board.cell()]

  @doc """
    returns the list of cells occupied by the block relative to the block origin at (0,0)
  """
  @spec get_cells(Tetris.Block.t()) :: cells
  def get_cells(block) do
    block.type
    |> Type.get_cells()
    |> Rotation.rotate_cells(block.rotation)
  end

  @doc """
    rotate the block clockwise
  """
  @spec rotate_right(Tetris.Block.t()) :: Tetris.Block.t()
  def rotate_right(block) do
    new_rotation = 
      block.rotation
      |> Rotation.rotate_right()

    %{block | rotation: new_rotation}
  end

  @doc """
    rotate the block counter-clockwise
  """
  @spec rotate_left(Tetris.Block.t()) :: Tetris.Block.t()
  def rotate_left(block) do
    new_rotation = 
      block.rotation
      |> Rotation.rotate_left()

    %{block | rotation: new_rotation}
  end
end