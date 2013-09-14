# Solution by Aydin Gungordu - www.aydingungordu.com

class BinaryConverter
    def main
	print "Enter binary number:"

	input = gets.chomp

	while !input.is_binary? do
		print "That is not binary, please make sure to enter a binary number:"
		input = gets.chomp
	end
	binary=input.reverse.split("")

	factor = 1
	decimal=0

	binary.each do |bit|
		decimal+=bit.to_i * factor
		factor*=2
	end

	print "Decimal equivalent of %s is %d \n" % [input, decimal]
	end
end

class String
    def is_binary?
       !!(self =~ /^[-+]?[0-1]+$/)
    end
end

cvt=BinaryConverter.new
cvt.main