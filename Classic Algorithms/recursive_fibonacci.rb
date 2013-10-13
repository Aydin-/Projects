# Solution by Aydin Gungordu - www.aydingungordu.com

def fibonacci(n)
	if(n==0)
		return 0
	elsif(n==1)
		return 1
	else
		return fibonacci(n-1)+fibonacci(n-2)
	end
end

1.upto(10) do |n|
	puts fibonacci(n)
end