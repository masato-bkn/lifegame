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

display(create_random_board)
