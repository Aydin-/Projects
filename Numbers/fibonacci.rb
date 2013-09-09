# Solution by Aydin Gungordu - www.aydingungordu.com

print "How many Fibonaccis you be wanting? "
n = gets.chomp.to_i

fibonacci=Array.new

while fibonacci.length < n do 
	if(fibonacci.length <2)
		fibonacci.push(fibonacci.length)	
	else
		fibonacci.push(fibonacci[fibonacci.length-1]+fibonacci[fibonacci.length-2])
	end
end

print fibonacci
print "\n"