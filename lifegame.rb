# frozen_string_literal: true

WIDTH = 3
HEIGHT = 3

def create_random_board
  board = []

  WIDTH.times do |x|
    board << []
    HEIGHT.times do |_y|
      board[x] << rand(2)
    end
  end

  board
end

def display(board)
  p '===' * board.length
  board.each { p _1.join(' | ') }
  p '===' * board.length
end

def line(board:, y:)
  return nil if  y < 0 || y >= HEIGHT
  board[y]
end

def cell(line:, x:)
  return 0 if x < 0 || x >= WIDTH
  line[x]
end

def count_around_alive_cell(board, y:, x:)
  count = 0
  
  top = line(board: board, y: y - 1)
  mid = line(board: board, y: y)
  bot = line(board:board, y: y + 1)
  
  [top, mid, bot].compact.each_with_index do |l, y|
    count += cell(line: l, x: x-1)
    count += cell(line: l, x: x) if y != 1
    count += cell(line: l, x: x+1)
  end

  count
end

board = create_random_board
display(board)

p count_around_alive_cell(board, y: 0, x: 0)
p count_around_alive_cell(board, y: 1, x: 2)
p count_around_alive_cell(board, y: 1, x: 1)
p count_around_alive_cell(board, y: 2, x: 0)
