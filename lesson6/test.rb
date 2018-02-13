def generate_win_lines (brd)
  win_lines = []
  width = brd[:width]
  (1..(brd.length-2)).each do |i|
    puts i
    x, y = index_to_xy(i, width)
    p x.to_s + " "+ y.to_s + " "
    #left to right - x,y  x+1,y  x+2,y
    if in_bounds(x+1,y,brd) && in_bounds(x+2,y,brd)
      win_lines << [i, xy_to_index(x+1,y, width), xy_to_index(x+2,y, width)]
    end
    #top to bottom - x,y  x,y+1  x,y+2
    if in_bounds(x,y+1,brd) && in_bounds(x,y+2,brd)
      win_lines << [i, xy_to_index(x,y+1, width), xy_to_index(x,y+2, width)]
    end
    #diagonal up right - x,y  x+1,y-1  x+2,y-2
    if in_bounds(x+1,y-1,brd) && in_bounds(x+2,y-2,brd)
      win_lines << [i, xy_to_index(x+1,y-1, width), xy_to_index(x+2,y-2, width)]
    end
    #diagonal down right - x,y x+1,y+1  x+2,y+2
    if in_bounds(x+1,y+1,brd) && in_bounds(x+2,y+2,brd)
      win_lines << [i, xy_to_index(x+1,y+1, width), xy_to_index(x+2,y+2, width)]
    end
  end
  win_lines
end

def index_to_xy(num , width)
  num -=1
  y = num / width
  x = num % width
  return x, y
end

def xy_to_index(x,y,width)
  (y * width) + x + 1
end

def in_bounds( x , y , brd)
  width = brd[:width]
  height = brd[:height]
  x >= 0 && x < width && y >= 0 && y < height
end

def new_board(width, height)
  board = {}
  (width*height).times { |num| board[num+1] = ' ' }
  board[:width] = width
  board[:height] = height
  board
end

board = new_board(4,4)
p board
p generate_win_lines(board)
(1..9).each {|i| p index_to_xy(i, 3)}
