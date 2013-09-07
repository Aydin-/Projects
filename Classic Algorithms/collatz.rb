
#Collatz Conjecture - Start with a number n > 1. Find the number of steps it takes to reach one using
#the following process: If n is even, divide it by 2. If n is odd, multiply it by 3 and add 1.
class Collatz
    def main

       input = gets
        
        if input.is_i?
            print 'got integer '
        else
         print 'Enter only an integer value, n > 1. '
        end

        n=input.to_i

        steps = 0

        print '%d' % n,
        
        while n > 1 do
            if n % 2 == 0 
                n /= 2
            else 
                n = (n * 3) + 1
            end
            steps += 1
            print ' -> %d' % n
        end   
        print ' -- Result:: %d steps take to reach ONE.' % steps
    end

end

class String
    def is_i?
       !!(self =~ /^[-+]?[0-9]+$/)
    end
end

c=Collatz.new
c.main


