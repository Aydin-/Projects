n = gets.chomp.to_i

array= Array.new(n, true)

while p<Math::sqrt(n) do

	i=p
	
	while (i<=n) do
		array[i] = false # not a prime
		i+=p
	end

	while array[p]!=true do
		p++
	end

end

#Input: an integer n > 1
 
#Let A be an array of Boolean values, indexed by integers 2 to n,
#initially all set to true.
 
 #for i = 2, 3, 4, ..., not exceeding √n:
 # if A[i] is true:
  #  for j = i2, i2+i, i2+2i, ..., not exceeding n :
   #   A[j] := false
 
#Now all i such that A[i] is true are prime.



