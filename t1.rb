# coding: utf-8
require_relative "sha256lib.rb"

# -------
# Default
# -------
if !defined? $input
  $input = "abc"
  $message = $input.unpack("B*")[0] # 011000010110001001100011
  $padded = padding($message)
  $blocks = split($padded, 512)

  # message block
  $block_number = 0 # message block number
  $block = $blocks[$block_number]

  # message schedule
  $schedule = calculate_schedule($block)
end

# Schedule (Wt)
w = $schedule

# Constants (Kt)
k = K

# Initial Hash Values
initial = IV
$hash = initial.clone

# --------
# Settings
# --------
indent = " " * 2

# ---------
# Animation
# ---------

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts
puts
puts
puts
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts
puts
puts
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 ="
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:slow)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:slow)

# Ch(e, f, g)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])} ->"
puts "#{indent}f = #{bits($hash[5])} ->"
puts "#{indent}g = #{bits($hash[6])} ->"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Ch(e, f, g)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])} -> #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])} -> #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Ch(e, f, g)
32.downto(1) do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T1)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts
  puts
  puts "#{indent}a = #{bits($hash[0])}"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}"
  puts "#{indent}d = #{bits($hash[3])}    #{"▼".rjust(i, " ")}"
  puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])} -> #{bits($hash[5])} #{bits($hash[4])[i-1] == '1' ? '◄' : ' '}"
  puts "#{indent}g = #{bits($hash[6])} -> #{bits($hash[6])} #{bits($hash[4])[i-1] == '0' ? '◄' : ' '}"
  puts "#{indent}h = #{bits($hash[7])}    #{bits(ch($hash[4], $hash[5], $hash[6]))[i-1..-1].rjust(32, " ")} Ch(e, f, g)"
  delay(:fastest)
end
delay(:normal)

# Ch(e, f, g)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])} -> #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])} -> #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
delay(:normal)

# Ch(e, f, g)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
delay(:normal)

# Ch(e, f, g)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])} -> "
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:fast)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:fast)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits($hash[4])}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:fast)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}    #{bits($hash[4])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits($hash[4])}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ1(e)
6.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T1)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts
  puts
  puts "#{indent}a = #{bits($hash[0])}"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(i+1, $hash[4]))} ROTR 6"
  puts "#{indent}d = #{bits($hash[3])}    #{bits($hash[4])}"
  puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Σ1(e)
11.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T1)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts
  puts
  puts "#{indent}a = #{bits($hash[0])}"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(6, $hash[4]))} ROTR 6"
  puts "#{indent}d = #{bits($hash[3])}    #{bits(rotr(i+1, $hash[4]))} ROTR 11"
  puts "#{indent}e = #{bits($hash[4])} -> #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Σ1(e)
25.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T1)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts
  puts
  puts "#{indent}a = #{bits($hash[0])}"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(6, $hash[4]))} ROTR 6"
  puts "#{indent}d = #{bits($hash[3])}    #{bits(rotr(11, $hash[4]))} ROTR 11"
  puts "#{indent}e = #{bits($hash[4])} -> #{bits(rotr(i+1, $hash[4]))} ROTR 25"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(6, $hash[4]))}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(rotr(11, $hash[4]))}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits(rotr(25, $hash[4]))}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(6, $hash[4]))} XOR"
puts "#{indent}d = #{bits($hash[3])}    #{bits(rotr(11, $hash[4]))}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits(rotr(25, $hash[4]))}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(rotr(11, $hash[4]) ^ rotr(6, $hash[4]))} XOR"
puts "#{indent}e = #{bits($hash[4])} -> #{bits(rotr(25, $hash[4]))}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])} -> #{bits(rotr(11, $hash[4]) ^ rotr(6, $hash[4]) ^ rotr(25, $hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ1(e)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# h
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])} -> "
delay(:normal)

# h
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])} -> #{bits($hash[7])}"
delay(:normal)

# h
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])} -> #{bits($hash[7])} h"
delay(:normal)

# h
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}    #{bits($hash[7])} h"
delay(:normal)

# T1
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0 = "
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}    #{bits($hash[7])} h"
delay(:normal)

# T1
system "clear"
t1 = add(w[0], k[0], usigma1($hash[4]), ch($hash[4], $hash[5], $hash[6]), $hash[7])
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T1)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0 = #{bits(t1)}"
puts
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}    #{bits(usigma1($hash[4]))} Σ1(e)"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}    #{bits(ch($hash[4], $hash[5], $hash[6]))} Ch(e, f, g)"
puts "#{indent}h = #{bits($hash[7])}    #{bits($hash[7])} h"
delay(:end)
