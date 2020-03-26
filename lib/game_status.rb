# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def won?(board)
  # check for winning combos
  WIN_COMBINATIONS.each do |combo|
    if combo.all?{|i| board[i] == "X"} || combo.all?{|i| board[i] == "O"}
      return combo   
    end
  end
  # if no combos have won, return false
  return false
end

def full?(board)
  board.all?{|i| i == "X" || i == "O"}
end

def draw?(board)
  if full?(board)
    !(won?(board))
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    winning_combo = won?(board)
    board[winning_combo[0]]
  else
    nil
  end
end