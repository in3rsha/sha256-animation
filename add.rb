# -----
# Input
# -----
# defaults
numbers =
[0b01000000000000001111111111111111,
0b01000000000000000000000000000000,
0b01000000000000000000000000000000,
0b01000000000000000000000000000000,
0b01000000000000000000000000000000,
]
# arguments passed
if ARGV.size >= 2
	numbers = ARGV.map {|x| x.to_i(2)} # convert binary strings to integers
end

# ---------
# Animation
# ---------
total = numbers.inject(:+)
width = total.to_s(2).size

(numbers.size + 1).times do |i|
	system "clear"
	numbers.each.with_index do |x, j|
		print ("%032b" % x).rjust(width, " ")
		if j > 0
			if j <= i
				print " +"
			end
		end
		print "\n"
	end
	puts "--------------------------------".rjust(width, " ")
	
	if i == 0
		puts "" # numbers[0].to_s(2).rjust(32, "0").rjust(width, " ")
	elsif i < numbers.size # for each addition
		puts numbers[0..i].inject(:+).to_s(2).rjust(32, "0").rjust(width, " ")
		sleep 0.4 if i == numbers.size-1 # slight delay before the modulus function
	else
		puts (numbers[0..i].inject(:+) % 2**32).to_s(2).rjust(32, "0").rjust(width, " ") + " mod 2**32"
	end
	sleep 0.4
end
sleep 1.0

