print "Loan amount: "
amount = gets.chomp.to_i
print "Interest rate: "
rate = gets.chomp.to_f
print "Payment: "
payment = gets.chomp.to_i
print "Monthly fee: "
fee = gets.chomp.to_i
print "Years: "
years = gets.chomp.to_i

months = years *12

amountleft=amount
	print "INTEREST  - - - REMAINING LOAN\n"
months.times do |month|

	interest= (amountleft * (rate/100))/12
	print "%0.3f             %0.3f" % [interest, amountleft]
	print "\n"
	amountleft= amountleft + interest + fee
	amountleft= amountleft - payment

end