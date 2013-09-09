#
# Quicksort
# Solution by Aydin Gungordu - www.aydingungordu.com

def quicksort(tosort)
	if tosort.length<=1
		 return tosort
		end

	pivot_index = tosort.length/2

	less= Array.new
	greater= Array.new
	pivot=tosort.delete_at(pivot_index)

	tosort.each do |x| 
		if x<=pivot
			less << x
		else
			greater << x
		end
	end
	return quicksort(less) << pivot << quicksort(greater)
end

myarray=[5, 6, 7, 11, 2, 1, 5, 3, 4, 15, 20, 55, 11, 16, 4, -2, -5, 22, 99, 8]
	10.times do 
		newarray=Array.new
		temp=myarray.clone

		t1 = Time.now
		newarray=quicksort(temp)
		t2 = Time.now
		delta = t2 - t1

		print "\nSorted: "
		print newarray.flatten
		print "\n Quicksort time: %.7f \n" % delta

		t1 = Time.now
		newarray=myarray.sort
		t2 = Time.now
		delta = t2 - t1
		print "\n Rubysort time: %.7f \n" % delta

		myarray.shuffle!
		print "\n\nTo sort: "
		print myarray.flatten	
	end
