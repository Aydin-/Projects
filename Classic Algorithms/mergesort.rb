# Solution by Aydin Gungordu - www.aydingungordu.com

def mergeSort(array)
	if array==nil
		return
	end

	if array.length==1
		return array
	end

	if array.length==2
		if(array[0]<array[1])
			return [array[0],array[1]]
		else
			return [array[1],array[0]]
		end
	end

	left,right = array.each_slice( (array.size/2.0).round ).to_a

	retval=Array.new
	retval=merge(mergeSort(left),mergeSort(right))
	retval
end

def merge(left,right)
    result=Array.new

    while left.length > 0 || right.length > 0 do

        if left.length  > 0 && right.length  > 0
            if left.first <= right.first
            	result<<left.first
                left.shift
            else
	            result<<right.first
	            right.shift
            end
        elsif left.length  > 0
           result<<left.first
           left.shift
        elsif right.length > 0
         	result<<right.first
            right.shift
        end
    end 
    return result
end

puts mergeSort([4,5,2,7,8,2,5,8,0,2])