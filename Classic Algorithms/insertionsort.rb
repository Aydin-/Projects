# Solutions by Aydin Gungordu - www.aydingungordu.com

def insertionSort(a)
	1.upto(a.length-1) do |i|
		value=a[i]
		j=i-1

		while j>=0 && a[j]>value do
			a[j+1]=a[j]
			j=j-1
		end

		a[j+1] = value
		print a
		
	end
end

a=[2,4,5,3,6,7,5,1,9,2,5,6,7]
r = Random.new

10.times do
	a<<r.rand(-100...100)
end

insertionSort(a)