require 'matrix'
#A child is running up a staircase with n steps, and can hop either 1 step, 2 steps, 
# or 3 steps at a time. Implement a method to count how many possible ways the child can run up the stairs.

def numPermutations(n)
	if n<0 
		return 0 
	elsif n==0
		return 1 else 
	return numPermutations(n - 1) + numPermutations(n - 2) + numPermutations(n - 3);
	end 
end


#Write an algorithm to print all ways of arranging eight queens on an 8x8 chess board so that none of them 
#share the same row, column or diagonal. In this case, "diagonal" means all diagonals, not just the two that bisect the board.

# Does not work.

class EightQueens
	@@numQueens=0
	@@chessboard=Matrix.build(8, 8) {|row, col| "." }
	@@Queens=Array.new

	def placeQueens(row)
		gridsize = 8
	
		if (row== gridsize) 
			 "FOUND RESULT!" 
			 printBoard
		else
			gridsize.times do |col|
				if(canInsert?(col,row))
					@@chessboard.send(:[]=,col,row,"Q")
					placeQueens(row + 1);
				end
			end
		end
	end

	def printBoard
		row=0
		col=0
		puts " -------------- "
		while row<8 do 
			col=0
			while col < 8 do
				print @@chessboard[row, col]
				col+=1
			end
			puts " "
			row+=1
		end
		puts " -------------- "
	end

	def canInsert?(col,row)
		puts rowSafe?(row)
		puts colSafe?(col)
		puts diagonalSafe?(col,row)

		return rowSafe?(row) && colSafe?(col) && diagonalSafe?(col,row)
	end

	def rowSafe?(row)
			col=0
			while(col<8) do
				if @@chessboard[col,row].to_s.eql?("Q")
					puts "Row: %d unsafe on column %d" %[row,col]
					return false
				end
			col+=1
		end
		return true
	end

	def colSafe?(col)
		8.times do |row|
			#print @@@chessboard[col,row]
			if @@chessboard[col,row].to_s.eql?("Q")
					puts "Col: %d unsafe" %col
				return false
			end
		end
		return true
	end

	def diagonalSafe?(col,row)
		checkCol=col
		checkRow=row

		while checkRow<8 && checkCol<8 do
			checkRow+=1
			checkCol+=1
			if @@chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		
		checkCol=col
		checkRow=row

		while checkRow>=0 && checkCol<8 do
			checkRow-=1
			checkCol+=1
			if @@chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		
		checkCol=col
		checkRow=row

		while checkRow<8 && checkCol>=0 do
			checkRow+=1
			checkCol-=1
			if @@chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		
		checkCol=col
		checkRow=row

		while checkRow>=0 && checkCol>=0 do
			checkRow-=1
			checkCol-=1
			if @@chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		return true
	end

end

eq=EightQueens.new
eq.placeQueens(0)

	
