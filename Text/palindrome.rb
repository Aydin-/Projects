# Solution by Aydin Gungordu - www.aydingungordu.com

print "Please type a word: "
mystr = gets.chop

if mystr.reverse.eql? mystr
	print "#{mystr} is a palindrome\n"
else
	print "#{mystr} is not a palindrome\n"
end
