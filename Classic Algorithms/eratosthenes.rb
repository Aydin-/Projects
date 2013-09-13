
#Input: an integer n > 1
 
#Let A be an array of Boolean values, indexed by integers 2 to n,
#initially all set to true.
 
 #for i = 2, 3, 4, ..., not exceeding √n:
 # if A[i] is true:
  #  for j = i2, i2+i, i2+2i, ..., not exceeding n :
   #   A[j] := false
 
#Now all i such that A[i] is true are prime.

# why doesn't this produce the correct results?

n = gets.chomp.to_i

int_array= Array.new(n, true)

i=2
i2=2

while (i < Math.sqrt(n)) do

	if int_array[i]==true
		j=i2
		while (j<=n) do
			int_array[j] = false # not a prime
			j+=i
		end
	end
	i+=1
end
puts "Prime numbers:"
int_array.each_with_index {|val, index| 
if index > 2
	puts "#{val} => #{index}" 
end
}



