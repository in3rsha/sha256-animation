require_relative "sha256lib.rb"

# -------------------
# Initial Hash Values - H0
# -------------------
# The first thirty-two bits of the fractional parts of the square roots of the first eight prime numbers.
#
# Why?
#  * These initial values don't _need_ to be anything in particular.
#  * These are random-looking, irrational, and relatively independent from each other.
#  * Using publicly-available numbers means that the initial hash values are less likely to have been chosen to allow for a backdoor.

# H0 = 6a09e667
# H1 = bb67ae85
# H2 = 3c6ef372
# H3 = a54ff53a
# H4 = 510e527f
# H5 = 9b05688c
# H6 = 1f83d9ab
# H7 = 5be0cd19

primes = [2, 3, 5, 7, 11, 13, 17, 19]

# --------
# Settings
# --------
indent = " " * 2

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression:"
puts "#{indent}-----------"
registers = ("a".."h").to_a
8.times do |i|
  puts "#{indent}#{registers[i]} ="
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} ="
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} ="
end
delay(:slowest)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = √#{primes[i]}"
end
delay(:slowest)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = #{Math.sqrt(primes[i]).round(10)}"
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = #{(Math.sqrt(primes[i]) - Math.sqrt(primes[i]).floor).round(10)}"
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = #{(Math.sqrt(primes[i]) - Math.sqrt(primes[i]).floor).round(10)} * 2^32"
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = #{((Math.sqrt(primes[i]) - Math.sqrt(primes[i]).floor) * 2 ** 32).floor}"
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0) (initial hash value)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = #{bits(((Math.sqrt(primes[i]) - Math.sqrt(primes[i]).floor) * 2 ** 32).floor)}"
end
delay(:slow)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H0)"
puts "#{indent}-----------"
8.times do |i|
  puts "#{indent}#{registers[i]} = #{bits(((Math.sqrt(primes[i]) - Math.sqrt(primes[i]).floor) * 2 ** 32).floor)}"
end
delay(:end)
