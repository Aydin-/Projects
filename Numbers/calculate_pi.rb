
print "Round Pi to how many digits?"
digits = gets.chomp.to_i
# print ('{0:.%df}' % min(20, int(digits))).format(math.pi) # nested string formatting

# calculate pi using Machin-like Formula
#print 4 * (4 * atan(1.0/5.0) - atan(1.0/239.0)))