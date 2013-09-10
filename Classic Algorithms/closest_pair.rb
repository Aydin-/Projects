#Closest pair problem - The closest pair of points problem or closest pair problem is a problem of computational geometry:
# given n points in metric space, find a pair of points with the smallest distance between them.

# Solution by Aydin Gungordu - www.aydingungordu.com

points = [[1,2],[0,4],[3,4],[3,2],[5,5],[-2,-2],[0,0],[15,5]]

counter=0
min_distance=0
closest_pair=[]

points.each do |point1|
	points.each do |point2|

		if point1!=point2
			dx=point2[0]-point1[0]
			dy=point2[1]-point1[1]
			
			distance =Math.sqrt((dx*dx)+(dy*dy))

			if counter ==0 || distance<min_distance
				min_distance=distance
				closest_pair=Array.new
				closest_pair.push(point1)
				closest_pair.push(point2)
			end

			print "Point %d,%d and %d,%d, distance: %0.4f\n" %[point1[0],point1[1],point2[0],point2[1],distance]
			counter+=1
		end
	end
	points.delete(point1)
end

print "Closest pair: "
print closest_pair
print "Distance: %0.4f" %min_distance

print "\n"