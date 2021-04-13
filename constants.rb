# coding: utf-8
require_relative "sha256lib.rb"

# ---------
# Constants - K
# ---------
# SHA256 uses the same sequence of sixty-four constant 32-bit words.
#
# These words represent the first thirty-two bits of the fractional parts of the cube roots of the first sixty-four prime numbers. These are "nothing up my sleeve" constants.

# The first sixty-four primes
primes =  [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311]

# Store results for display later
roots = [];
constants = [];
hexs = [];

# For each prime number
primes.each do |prime|

  # Get the cube root of the prime
  root = prime ** (1/3.0)
  roots << root

  # Get fractional part of the number
  fractional = root - root.floor

  # Convert fractional part to hexadecimal
  #
  # Example:
  #
  #  3√2 = 1.259921049895
  #        0.259921049895       <- fractional part is what we want
  #
  #  Keep multiplying the fractional part by 16 and taking the integer as the next hex character.
  #
  #        0.259921049895 * 16  <- multiply by 16
  #      = 4.15873679832        <- the integer part is used for the hexadecimal result
  #
  #        0.15873679832  * 16
  #      = 2.53978877312
  #
  #        0.53978877312  * 16
  #      = 8.63662036992
  #
  #        ...
  #
  #  Hex:  428a2f98
  #
  # In other words, you multiply the fractional part by 2^32, floor it, then convert to hexadecimal.
  #
  hex = ""
  8.times do # 32 bits = 8 hex characters
    product = fractional * 16 # multiply fraction by 16
    carry = product.floor     # the integer part of the product is used for the next hexadecimal character
    fractional = product - product.floor # the fractional part of the product is used for next round
    hex << carry.to_s(16)
  end

  # Save results
  hexs << hex
  constants << hex.to_i(16)
end

# ---------
# Animation
# ---------
system "clear"
puts "-------------"
puts "constants (K)"
puts "-------------"
sleep 0.1
(64+1+3).times do |i| # extra 3 iterations to see through
  system "clear"
  puts "-------------"
  puts "constants (K)"
  puts "-------------"
  i.times do |j|
    # 3 or more behind
    if j <= i-4
      puts "#{j.to_s.ljust(2, " ")} = #{bits(constants[j])}"
    end

    # 2 behind
    if j == i-3
      puts "#{j.to_s.ljust(2, " ")} = 3√#{primes[j].to_s.ljust(3, " ")} =   #{bits(constants[j])}"
    end

    # 1 behind
    if j == i-2
      puts "#{j.to_s.ljust(2, " ")} = 3√#{primes[j].to_s.ljust(3, " ")} =   #{(roots[j] - roots[j].floor).to_s[2..-1]}"
    end

    # current
    if j == i-1
      puts "#{j.to_s.ljust(2, " ")} = 3√#{primes[j].to_s.ljust(3, " ")} = #{roots[j]}"
    end

    # dont try and show trailing 64, 65, 66 (this is just to format last 3)
    break if j >= 63
  end

  sleep 0.1
end
sleep 1
