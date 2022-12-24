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
  return nil if  y.negative? || y >= HEIGHT

  board[y]
end

def cell(line:, x:)
  return 0 if x.negative? || x >= WIDTH

  line[x]
end

def count_around_alive_cell(board, y:, x:)
  count = 0

  top = line(board: board, y: y - 1)
  mid = line(board: board, y: y)
  bot = line(board: board, y: y + 1)

  [top, mid, bot].compact.each_with_index do |l, y|
    count += cell(line: l, x: x - 1)
    count += cell(line: l, x: x) if y != 1
    count += cell(line: l, x: x + 1)
  end

  count
end

def live_next_generation?(board, x:, y:)
  alive_cell_count = count_around_alive_cell(board, y: y, x: x)

  if board[y][x] == 1
    alive_cell_count == (2 || 3) ? true : false
  else
    alive_cell_count == 3 ? true : false
  end
end

def generate_next(board)
  new_board = Array.new(HEIGHT){ Array.new(WIDTH, 0)}

  board.each_with_index do |line, y|
    line.each_with_index do |cell, x|
      new_board[y][x] = live_next_generation?(board, x: x, y: y) ? 1 : 0
    end
  end

  new_board
end

board = create_random_board
display(board)
display(generate_next(board))
