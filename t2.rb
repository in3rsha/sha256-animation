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

# T1
t1 = add(w[0], k[0], usigma1($hash[4]), ch($hash[4], $hash[5], $hash[6]), $hash[7])

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
puts "#{indent}compression: (T2)"
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
delay(:normal)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 ="
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
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
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

# Maj(a, b, c)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> "
puts "#{indent}b = #{bits($hash[1])} -> "
puts "#{indent}c = #{bits($hash[2])} -> "
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Maj(a, b, c)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])} -> #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])} -> #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Maj(a, b, c)
32.downto(1) do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T2)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
  puts "#{indent}    #{  " " * 32    }    #{"▼".rjust(i, " ")}"
  puts "#{indent}a = #{bits($hash[0])} -> #{bits($hash[0])} #{bits(initial[0])[i-1]}"
  puts "#{indent}b = #{bits($hash[1])} -> #{bits($hash[1])} #{bits(initial[1])[i-1]}"
  puts "#{indent}c = #{bits($hash[2])} -> #{bits($hash[2])} #{bits(initial[2])[i-1]}"
  puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))[i-1..-1].rjust(32, " ")} Maj(a, b, c)"
  puts "#{indent}e = #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Maj(a, b, c)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])} -> #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])} -> #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Maj(a, b, c)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} ->"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:fast)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:fast)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}    #{bits($hash[0])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:fast)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}    #{bits($hash[0])}"
puts "#{indent}c = #{bits($hash[2])}    #{bits($hash[0])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
2.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T2)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
  puts
  puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(i+1, $hash[0]))} ROTR 2"
  puts "#{indent}b = #{bits($hash[1])}    #{bits($hash[0])}"
  puts "#{indent}c = #{bits($hash[2])}    #{bits($hash[0])}"
  puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
  puts "#{indent}e = #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Σ0(a)
13.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T2)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
  puts
  puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(2, $hash[0]))} ROTR 2"
  puts "#{indent}b = #{bits($hash[1])}    #{bits(rotr(i+1, $hash[0]))} ROTR 13"
  puts "#{indent}c = #{bits($hash[2])}    #{bits($hash[0])}"
  puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
  puts "#{indent}e = #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Σ0(a)
22.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (T2)"
  puts "#{indent}-----------"
  puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
  puts "#{indent}K0 = #{bits(k[0])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
  puts
  puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(2, $hash[0]))} ROTR 2"
  puts "#{indent}b = #{bits($hash[1])}    #{bits(rotr(13, $hash[0]))} ROTR 13"
  puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(i+1, $hash[0]))} ROTR 22"
  puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
  puts "#{indent}e = #{bits($hash[4])}"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(2, $hash[0]))}"
puts "#{indent}b = #{bits($hash[1])}    #{bits(rotr(13, $hash[0]))}"
puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(22, $hash[0]))}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(2, $hash[0]))}"
puts "#{indent}b = #{bits($hash[1])}    #{bits(rotr(13, $hash[0]))}"
puts "#{indent}c = #{bits($hash[2])}    #{bits(rotr(22, $hash[0]))} XOR"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(2, $hash[0]))}"
puts "#{indent}b = #{bits($hash[1])}    #{bits(rotr(13, $hash[0]) ^ rotr(22, $hash[0]))} XOR"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])} -> #{bits(rotr(2, $hash[0]) ^ rotr(13, $hash[0]) ^ rotr(22, $hash[0]))} Σ0(a)"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)"
puts
puts "#{indent}a = #{bits($hash[0])}    #{bits(usigma0($hash[0]))} Σ0(a)"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c) = "
puts
puts "#{indent}a = #{bits($hash[0])}    #{bits(usigma0($hash[0]))} Σ0(a)"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Σ0(a)
system "clear"
t2 = add(usigma0($hash[0]), maj($hash[0], $hash[1], $hash[2]))
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (T2)"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c) = #{bits(t2)}"
puts
puts "#{indent}a = #{bits($hash[0])}    #{bits(usigma0($hash[0]))} Σ0(a)"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}    #{bits(maj($hash[0], $hash[1], $hash[2]))} Maj(a, b, c)"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:end)
