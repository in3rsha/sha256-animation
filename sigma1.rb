# coding: utf-8
require_relative "sha256lib.rb"

# -----
# σ1(x)
# -----
# σ1(x) = ROTR(17, x) ^ ROTR(19, x) ^ SHR(10, x)

# -----
# Input
# -----
# default
x = 0b00000000000000000011111111111111 # 0b11101001101101011101101110100101
# argument passed
x = ARGV[0].to_i(2) if ARGV[0] # binary
# check arguments
if ARGV[0] && ARGV[0].size > 32
	puts "We only operate on 32-bit words in SHA-256. Your x is #{ARGV[0].size} bits."; exit
end

# ---------
# Animation
# ---------
system "clear"
puts "x:       #{bits(x)}"
puts "         #{'-'*32}"
puts "ROTR 17: #{bits(x)}"
puts "ROTR 19: #{bits(x)}"
puts " SHR 10: #{bits(x)}"
puts "         #{'-'*32}"
puts "σ1(x):"
sleep(0.1)

# ROTR(17, x)
(17+1).times do |i|
  system "clear"
  puts "x:       #{bits(x)}"
  puts "         #{'-'*32}"
  puts "ROTR 17: #{bits(rotr(i, x))}"
  puts "ROTR 19: #{bits(x)}"
  puts " SHR 10: #{bits(x)}"
  puts "         #{'-'*32}"
  puts "σ1(x):"
  sleep(0.1)
end
sleep(0.1)

# ROTR(19, x)
(19+1).times do |i|
  system "clear"
  puts "x:       #{bits(x)}"
  puts "         #{'-'*32}"
  puts "ROTR 17: #{bits(rotr(17, x))}"
  puts "ROTR 19: #{bits(rotr(i, x))}"
  puts " SHR 10: #{bits(x)}"
  puts "         #{'-'*32}"
  puts "σ1(x):"
  sleep(0.1)
end
sleep(0.1)

# SHR(10, x)
(10+1).times do |i|
  system "clear"
  puts "x:       #{bits(x)}"
  puts "         #{'-'*32}"
  puts "ROTR 17: #{bits(rotr(17, x))}"
  puts "ROTR 19: #{bits(rotr(19, x))}"
  puts " SHR 10: #{bits(shr(i, x))}"
  puts "         #{'-'*32}"
  puts "σ1(x):"
  sleep(0.1)
end
sleep(0.1)

# ROTR(17, x) ^ ROTR(19, x) ^ SHR(10, x)
32.downto(1) do |i|
  system "clear"
  puts "x:       #{bits(x)}"
  puts "         #{'-'*32}"
  puts "ROTR 17: #{bits(rotr(17, x))}"
  puts "ROTR 19: #{bits(rotr(19, x))} XOR"
  puts " SHR 10: #{bits(shr(10, x))} XOR"
  puts "         #{'-'*32}"
  puts "σ1(x):   #{bits(rotr(17, x) ^ rotr(19, x) ^ shr(10, x))[i-1..-1].rjust(32, " ")}"
  sleep(0.1)
end
sleep(1)

