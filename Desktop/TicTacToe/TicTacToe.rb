require_relative 'board_m_n.rb'
require_relative 'Player.rb'

class TictacToe 
	def initialize m,n
    @nrow = m
    @ncol = n
    @board_obj = Board.new(m,n)
	@player1 = Player.new("X")
	@player2 = Player.new("O")
	@flag = true
	@board_obj.display
    end

    
    def move player_number
    puts player_number	
     puts "Enter where you want to move player #{player_number}"
	   row,col = gets.split(',').map(&:to_i)

	   if player_number == 1 then
	   t = @player1.get_token
	  else
	   t = @player2.get_token	
	end
	if (row < @nrow && col < @ncol)
	   if ! @board_obj.check_if_pos_set row,col then
	   @board_obj.set_board_position row,col,t
        puts " player #{player_number}has moved to position #{row},#{col}"
		@board_obj.display
	   else
	   	puts " This position is already set please try again"
	   	move player_number
	   end
	else
		puts "Invalid move, please enter position within range"
		move player_number
	end
    
end

    
    def playgame  
   
     while( @board_obj.check_win == false && @board_obj.check_board_fill == false)  do
		if(@flag) then
			move 1
			@flag = !@flag
		else
			move 2
			@flag = !@flag
		end
	
      end
      if(@board_obj.check_board_fill == true && @board_obj.check_win == false)
      	puts " GAME IS DRAW"

      else 
      if(!@flag) then
      	puts "Player 1 Wins"
      else
      	puts "Player 2 Wins"
      end
  end

  end
	

end

game_obj = TictacToe.new(4,4)
game_obj.playgame 
	




