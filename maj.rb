# coding: utf-8
require_relative "sha256lib.rb"

# --------
# Majority
# --------
# Maj(x, y, z) = (x & y) ^ (x & z) ^ (y & z)
#
# Use the majority of x, y, z to set the result bit.

# -----
# Input
# -----
# defaults
x = 0b00000000111111110000000011111111 # 0x428a2f98
y = 0b00000000000000001111111111111111 # 0x71374491
z = 0b11111111111111110000000000000000 # 0xb5c0fbcf
# arguments passed
if ARGV.size == 3
	x = ARGV[0].to_i(2)
	y = ARGV[1].to_i(2)
	z = ARGV[2].to_i(2)
end

# ---------
# Animation
# ---------
32.downto(1) do |i|
  system "clear"
  maj = bits( (x & y) ^ (x & z) ^ (y & z) )
  puts "▼".rjust(i+3, " ")
  puts "x: #{bits(x)} #{bits(x)[i-1]}"
  puts "y: #{bits(y)} #{bits(y)[i-1]}"
  puts "z: #{bits(z)} #{bits(z)[i-1]}"
  puts "   #{'-'*32}"
  puts maj[i-1..-1].rjust(35, " ")
  sleep(0.1)
end
sleep 1
