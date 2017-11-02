
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


	def display_board(board)
	  puts " #{board[0]} | #{board[1]} | #{board[2]} "
	  puts "-----------"
	  puts " #{board[3]} | #{board[4]} | #{board[5]} "
	  puts "-----------"
	  puts " #{board[6]} | #{board[7]} | #{board[8]} "
	end

	def input_to_index(input)
		s = input.to_i
		s - 1

end



	def move(board, index, char)
		board[index] = char
		turn_count(board)
		display_board(board)
	end


	def position_taken?(board, index)
	  board[location] != " " && board[location] != ""
	end


	def valid_move?(board, index)
	  index.between?(0,8) && !position_taken?(board, index)
	end


	def turn(board)
	  puts "Please enter 1-9:"
	  i = gets.strip
		index = input_to_index(i)
		m = valid_move?(board, index)
		if m == true
			move(board, index, current_player(board))
		else m == false
			until m == true
				puts "Sorry, that was an invalid move. Please enter 1 - 9:"
				display_board(board)
				i = gets.strip
				index = input_to_index(i)
				m = valid_move?(board, index)
				move(board, index, current_player(board))
			end
		end
	end



	def turn_count(board)
	  counter = 0
	  board.each do |move|
	    if move == "X" || move == "O"
	      counter += 1
	    end
	  end
	   counter
	end


	def current_player(board)
	  turn_count(board).even? ? "X" : "O"
	end


	def won?(board)
		WIN_COMBINATIONS. find do |win_combo| 
			board[win_combo[0]] == board[win_combo[1]] && board[win_combo[0]] == board[win_combo[2]] && position_taken?(board, win_combo[1])
		end
	end
	



	def full?(board)
	  if board.detect {|i| i == " " || i == nil}
	    return false
	  else
	    return true
	  end
	end


	def draw?(board)
	won?(board) == nil && full?(board) == true
	end


	def over?(board)
	  if draw?(board) || won?(board)
	    return true
	  else
	    return false
	  end
	end


	def winner(board)
	  if win_combination = won?(board)
	    board[win_combination.first]
	  end
	end


	def play(board)
	  until over?(board) == true
			turn(board)
end
		if draw?(board) == true
			puts "Cats Game!"
		else won?(board)
	    puts "Congratulations #{winner(board)}!"

	  end


	end
