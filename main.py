from enum import Enum

class Rotation(Enum):
  ZERO = 0
  ONE = 1
  TWO = 2
  THREE = 3

class Block:
  def __init__(self):
    self.cells = []
    self.rotation = Rotation.ZERO
    self._num_rotations = 4

  def rotate_right(self):
    new_rotation_value = (self.rotation.value + 1) % self._num_rotations
    self.rotation = Rotation(new_rotation_value)
    return self

  def rotate_left(self):
    new_rotation_value = (self.rotation.value - 1) % self._num_rotations
    self.rotation = Rotation(new_rotation_value)
    return self

  def get_cells(self):
    return [self._rotated_cell(cell) for cell in self.cells]

  def _rotated_cell(self, cell):
    num_rotations = self.rotation.value
    (r, c) = cell
    for i in range(num_rotations):
      (r, c) = self._rotate_cell(r, c)
    return (r, c)

  def _rotate_cell(self, r, c):
    # rotate clockwise by 90 degrees
    return (c, -r)

class StraightBlock(Block):
  def __init__(self):
    super().__init__()
    self.cells = [(0,0), (0, 1), (0,2), (0,3)]

class Board:
  def __init__(self, num_rows, num_cols):
    self.num_rows = num_rows
    self.num_cols = num_cols
    self.rows = [self.generate_empty_row for i in range(num_rows)]

  def generate_empty_row(self):
    return [False for i in range(self.num_cols)]

  """
    updates the board with block dropped from column.
  """
  def place_block(self, block, column):
    pass
    
  """
    block - an instance of Block
    position - (row, column) where row and column are integer
    returns true if block has "collided" with another block and is unable to fall further.
  """
  def detect_collision(self, block, position):
    pass

  def print_board(self):
    pass
