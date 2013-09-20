# Solutions by Aydin Gungordu - www.aydingungordu.com

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

class EightQueens


	def printBoard(chessboard)
		row=0
		col=0
		puts " -------------- "
		while row<8 do 
			col=0
			while col < 8 do
				print chessboard[row, col]
				col+=1
			end
			puts " "
			row+=1
		end
		puts " -------------- "
	end

	def canInsert?(col,row, chessboard)
	#	puts rowSafe?(row, chessboard)
	#	puts colSafe?(col, chessboard)
	#	puts diagonalSafe?(col,row, chessboard)

		return rowSafe?(row,chessboard) && colSafe?(col,chessboard) && diagonalSafe?(col,row,chessboard)
	end

	def rowSafe?(row,chessboard)
			col=0
			while(col<8) do
				if chessboard[col,row].to_s.eql?("Q")
			#		puts "Row: %d unsafe on column %d" %[row,col]
					return false
				end
			col+=1
		end
		return true
	end

	def colSafe?(col,chessboard)
		8.times do |row|
			#print @@@chessboard[col,row]
			if chessboard[col,row].to_s.eql?("Q")
				#	puts "Col: %d unsafe" %col
				return false
			end
		end
		return true
	end

	def placeQueens(row, chessboard)
        0.upto(7) do |col|
            if canInsert?(col, row, chessboard)
               chessboard.send(:[]=,col,row,"Q")
                if row == (7)
                	puts "SOLUTION:"
                    printBoard(chessboard)
                else
                    placeQueens(row+1, chessboard)
                end
                chessboard.send(:[]=,col,row,".")
            end
        end
       # printBoard(chessboard)
    end

	def diagonalSafe?(col,row,chessboard)
		checkCol=col
		checkRow=row

		while checkRow<8 && checkCol<8 do
			checkRow+=1
			checkCol+=1
			if chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		
		checkCol=col
		checkRow=row

		while checkRow>=0 && checkCol<8 do
			checkRow-=1
			checkCol+=1
			if chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		
		checkCol=col
		checkRow=row

		while checkRow<8 && checkCol>=0 do
			checkRow+=1
			checkCol-=1
			if chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		
		checkCol=col
		checkRow=row

		while checkRow>=0 && checkCol>=0 do
			checkRow-=1
			checkCol-=1
			if chessboard[checkCol,checkRow].eql?("Q")
				return false
			end
		end
		return true
	end

end

eq=EightQueens.new
chessboard=Matrix.build(8, 8) {|row, col| "." }
eq.placeQueens(0,chessboard)


	
