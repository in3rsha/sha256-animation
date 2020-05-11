# -----
# Input
# -----
# just do a simple XOR if binary string arguments passed
if ARGV.size >= 2
	width = ARGV.map(&:size).max # work out the longest binary string (for display purposes)
	system "clear"
	ARGV.each do |binary|
		puts binary.rjust(width, " ")
	end
	puts "-" * width
	puts ARGV.map{|x| x.to_i(2)}.reduce(0, :^).to_s(2).rjust(width, "0")
	exit
end

# ---------
# Animation
# ---------
# If no arguments passed, show an animation that showcases the XOR operator across 3 inputs
off   = 0b00000000000000000000000000000000
on    = 0b11111111111111111111111111111111
split = 0b10101010101010101010101010101010
delay = 0.4

# Up To All 1
system "clear"
puts ("%032b" % off)
puts ("%032b" % off) + " XOR"
puts ("%032b" % off) + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ off ^ off)
sleep delay

system "clear"
puts ("%032b" % on)
puts ("%032b" % off) + " XOR"
puts ("%032b" % off) + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ off ^ off)
sleep delay

system "clear"
puts ("%032b" % on)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % off) + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ on ^ off)
sleep delay

system "clear"
puts ("%032b" % on)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ on ^ on)
sleep delay

# Back To All 0
system "clear"
puts ("%032b" % off)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ on ^ on)
sleep delay

system "clear"
puts ("%032b" % off)
puts ("%032b" % off)  + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ off ^ on)
sleep delay

system "clear"
puts ("%032b" % off)
puts ("%032b" % off)  + " XOR"
puts ("%032b" % off)  + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ off ^ off)
sleep delay

# Only One 1
system "clear"
puts ("%032b" % on)
puts ("%032b" % off) + " XOR"
puts ("%032b" % off) + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ off ^ off)
sleep delay

system "clear"
puts ("%032b" % off)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % off) + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ on ^ off)
sleep delay

system "clear"
puts ("%032b" % off)
puts ("%032b" % off) + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ off ^ on)
sleep delay

# Majority 1
system "clear"
puts ("%032b" % off)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (off ^ on ^ on)
sleep delay

system "clear"
puts ("%032b" % on)
puts ("%032b" % off) + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ off ^ on)
sleep delay

system "clear"
puts ("%032b" % on)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % off)  + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ on ^ off)
sleep delay

# All 1
system "clear"
puts ("%032b" % on)
puts ("%032b" % on)  + " XOR"
puts ("%032b" % on)  + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ on ^ on)
sleep delay
sleep delay

# Split
system "clear"
puts ("%032b" % on)
puts ("%032b" % on)    + " XOR"
puts ("%032b" % split) + " XOR"
puts "--------------------------------"
puts "%032b" % (on ^ on ^ split)
sleep delay

# Split - Rotate
def rotr(n, x)
  mask = 2**32 - 1
  right = (x >> n) & mask
  left  = (x << 32-n) & mask
  result = right | left
end

9.times do |i|
	system "clear"
	puts ("%032b" % on)
	puts ("%032b" % on)    + " XOR"
	puts ("%032b" % rotr(i, split)) + " XOR"
	puts "--------------------------------"
	puts "%032b" % (on ^ on ^ rotr(i, split))
	sleep delay/2
end
sleep delay

9.times do |i|
	system "clear"
	puts ("%032b" % on)
	puts ("%032b" % off)    + " XOR"
	puts ("%032b" % rotr(i, split)) + " XOR"
	puts "--------------------------------"
	puts "%032b" % (on ^ off ^ rotr(i, split))
	sleep delay/2
end
sleep delay

9.times do |i|
	system "clear"
	puts ("%032b" % off)
	puts ("%032b" % off)    + " XOR"
	puts ("%032b" % rotr(i, split)) + " XOR"
	puts "--------------------------------"
	puts "%032b" % (off ^ off ^ rotr(i, split))
	sleep delay/2
end
sleep delay

