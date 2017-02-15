class Board
  attr_accessor :board

  def initialize m,n
    @rows = m
    @cols = n
   @board = Array.new(m)
    m.times do |i|
      @board[i] = Array.new(n)
    end
   end
  
  def display
  
 @rows.times do |i|
      @cols.times do |j|
     print "|#{@board[i][j]}|"

     end
     print "\n"
    end
  end 

  
 def set_board_position m,n,token
 @board[m][n] = token
 end
 
 def check_row_win 
  
  for i in 0...@rows
      row_win = 0
      for j in 0...@cols-1
         if (board[i][j] != nil && @board[i][j] == @board[i][j+1] ) then
         row_win += 1
        end
    end
    if row_win == @rows-1 then
       return true
    end
  
  end
  return false
  end

  def check_col_win 
  
      for j in 0...@cols
        col = 0
        for i in 0...@rows-1
        if (board[i][j] != nil && @board[i][j] == @board[i+1][j]) then
         col += 1
       end
    end
    if col == @cols-1 then
  return true
end
  end
  return false
end

def check_diagonal_win
  diagonal_win = 0
 for i in 0...@rows-1
      for j in 0...@cols-1
        if(i == j)
          if  (board[i][j] != nil && @board[i][j] == @board[i+1][j+1]) then
             diagonal_win += 1
          end
        end
    end
end
  if diagonal_win == @rows-1 then
   return true  
  else
    return false
  end
end

def check_second_diagonal
  diagonal_win = 0
 for i in 0...@rows-1
       for j in (@cols-1).downto(1)
         d = i - j
         if (d != -1 && 1)
      
          if  (board[i][j] != nil && @board[i][j] == @board[i+1][j-1]) then
             diagonal_win += 1
             
          end
        else
          diagonal_win = 0
        end
        end
    end
  if diagonal_win == @rows-1 then
   return true  
  else
    return false
  end
end


 def check_win
  r = check_row_win
  #puts "row #{r}"
  c = check_col_win
  #puts "col #{c}"
  d1 = check_diagonal_win
  #puts "diagonal #{d1}"
  d2 = check_second_diagonal
 # puts "diagonal 2 #{d2}"
  if (r || c) || (d1 || d2)
    return true
    else
      return false
    end
 end 

def check_if_pos_set r,c
if @board[r][c] == nil then
  return false
else
  return true
end
end 

def check_board_fill
  
  count = 0
 (0...@rows).each do |i|
    (0...@cols).each do |j|
     if board[i][j] == nil
      count += 1
     end
   end
 end
  if count != 0 then
      return false
 else
  return true
end
end
end



