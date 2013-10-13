# Coding challenge
# a) Positive integer array
# If there are any 2 integers that sum up to 100? true/false
# How do I find that out?
# O(N)


ints = [1,43,1512,5,12,567,99,24,50]


def hasComplement(intsArray) 
   	map=Hash.new

   intsArray.each do |i|
        if (map[ 100-i ]==true) 
            return true
        end
        map[i]=true
    end
    return false;
end

puts hasComplement(ints)
