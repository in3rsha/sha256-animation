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
  
  # arguments passed
  if ARGV[0] # message block
  	$block = ARGV[0].rjust(512, "0") # accept binary string as message block
  end

  # message schedule
  $schedule = calculate_schedule($block)
end

# Starting Hash Values - Use Initital Hash Values or hash values from previous compression
if $block_number == 0
  initial = IV          # Use initial hash values
  $hash = initial.clone # Set the initial hash values
else
  initial = $hash.clone # Use the result of the previous compression
end

# Schedule (Wt)
w = $schedule

# Constants (Kt)
k = K

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
puts "#{indent}compression: (H#{$block_number})"
puts "#{indent}-----------"
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
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
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
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
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
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
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
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
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
delay(:slowest)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
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
t1 = add(w[0], k[0], usigma1($hash[4]), ch($hash[4], $hash[5], $hash[6]), $hash[7])
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
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
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
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

# Start
t2 = add(usigma0($hash[0]), maj($hash[0], $hash[1], $hash[2]))
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a = #{bits($hash[0])}"
puts "#{indent}b = #{bits($hash[1])}"
puts "#{indent}c = #{bits($hash[2])}"
puts "#{indent}d = #{bits($hash[3])}"
puts "#{indent}e = #{bits($hash[4])}"
puts "#{indent}f = #{bits($hash[5])}"
puts "#{indent}g = #{bits($hash[6])}"
puts "#{indent}h = #{bits($hash[7])}"
delay(:slowest)

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a = #{bits($hash[0])} ↓"
puts "#{indent}b = #{bits($hash[1])} ↓"
puts "#{indent}c = #{bits($hash[2])} ↓"
puts "#{indent}d = #{bits($hash[3])} ↓"
puts "#{indent}e = #{bits($hash[4])} ↓"
puts "#{indent}f = #{bits($hash[5])} ↓"
puts "#{indent}g = #{bits($hash[6])} ↓"
puts "#{indent}h = #{bits($hash[7])}"
delay(:normal)

# Start - Rotate Register Upwards
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a = "
puts "#{indent}b = #{bits($hash[0])} ↓"
puts "#{indent}c = #{bits($hash[1])} ↓"
puts "#{indent}d = #{bits($hash[2])} ↓"
puts "#{indent}e = #{bits($hash[3])} ↓"
puts "#{indent}f = #{bits($hash[4])} ↓"
puts "#{indent}g = #{bits($hash[5])} ↓"
puts "#{indent}h = #{bits($hash[6])} ↓"
delay(:normal)

# Start - a is T1 + T2
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a =                                  <- T1 + T2"
puts "#{indent}b = #{bits($hash[0])}"
puts "#{indent}c = #{bits($hash[1])}"
puts "#{indent}d = #{bits($hash[2])}"
puts "#{indent}e = #{bits($hash[3])}"
puts "#{indent}f = #{bits($hash[4])}"
puts "#{indent}g = #{bits($hash[5])}"
puts "#{indent}h = #{bits($hash[6])}"
delay(:normal)

# Start - a is T1 + T2
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a = #{bits(add(t1, t2))} <- T1 + T2"
puts "#{indent}b = #{bits($hash[0])}"
puts "#{indent}c = #{bits($hash[1])}"
puts "#{indent}d = #{bits($hash[2])}"
puts "#{indent}e = #{bits($hash[3])}"
puts "#{indent}f = #{bits($hash[4])}"
puts "#{indent}g = #{bits($hash[5])}"
puts "#{indent}h = #{bits($hash[6])}"
delay(:normal)

# Start - Add T1 to e
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a = #{bits(add(t1, t2))} <- T1 + T2"
puts "#{indent}b = #{bits($hash[0])}"
puts "#{indent}c = #{bits($hash[1])}"
puts "#{indent}d = #{bits($hash[2])}"
puts "#{indent}e = #{bits($hash[3])} + T1"
puts "#{indent}f = #{bits($hash[4])}"
puts "#{indent}g = #{bits($hash[5])}"
puts "#{indent}h = #{bits($hash[6])}"
delay(:normal)

# Start - Add T1 to e
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}W0 = #{bits(w[0])} (message schedule)"
puts "#{indent}K0 = #{bits(k[0])} (constant)"
puts
puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K0  + W0  = #{bits(t1)}"
puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
puts
puts "#{indent}a = #{bits(add(t1, t2))} <- T1 + T2"
puts "#{indent}b = #{bits($hash[0])}"
puts "#{indent}c = #{bits($hash[1])}"
puts "#{indent}d = #{bits($hash[2])}"
puts "#{indent}e = #{bits(add($hash[3], t1))} + T1"
puts "#{indent}f = #{bits($hash[4])}"
puts "#{indent}g = #{bits($hash[5])}"
puts "#{indent}h = #{bits($hash[6])}"
delay(:slowest)

# Apply Changes
$hash[7] = $hash[6]
$hash[6] = $hash[5]
$hash[5] = $hash[4]
$hash[4] = $hash[3]
$hash[3] = $hash[2]
$hash[2] = $hash[1]
$hash[1] = $hash[0]
$hash[0] = ""

$hash[4] = add($hash[4], t1)
$hash[0] = add(t1, t2)

# -------------------
# Remaining Animation
# -------------------
1.upto(63) do |i|

  # T1 = h + Σ1(e) + Ch(e, f, g) + Kt + Wt
  t1 = add(w[i], k[i], usigma1($hash[4]), ch($hash[4], $hash[5], $hash[6]), $hash[7])

  # T2 = Σ0(a) + Maj(a, b, c)
  t2 = add(usigma0($hash[0]), maj($hash[0], $hash[1], $hash[2]))

  # Frame - T1, T2
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
  puts "#{indent}-----------"
  puts "#{indent}W#{i} = #{bits(w[i])} (message schedule)"
  puts "#{indent}K#{i} = #{bits(k[i])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K#{i.to_s.ljust(2, " ")} + W#{i.to_s.ljust(2, " ")} = #{bits(t1)}"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
  puts
  puts "#{indent}a = #{bits($hash[0])} <- T1 + T2"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}"
  puts "#{indent}d = #{bits($hash[3])}"
  puts "#{indent}e = #{bits($hash[4])} + T1"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)

  # Frame - Shift Up
  $hash[7] = $hash[6]
  $hash[6] = $hash[5]
  $hash[5] = $hash[4]
  $hash[4] = $hash[3]
  $hash[3] = $hash[2]
  $hash[2] = $hash[1]
  $hash[1] = $hash[0]
  $hash[0] = ""

  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
  puts "#{indent}-----------"
  puts "#{indent}W#{i} = #{bits(w[i])} (message schedule)"
  puts "#{indent}K#{i} = #{bits(k[i])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K#{i.to_s.ljust(2, " ")} + W#{i.to_s.ljust(2, " ")} = #{bits(t1)}"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
  puts
  puts "#{indent}a =                                  <- T1 + T2"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}"
  puts "#{indent}d = #{bits($hash[3])}"
  puts "#{indent}e = #{bits($hash[4])} + T1"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)

  # Frame - Update e and a
  $hash[4] = ($hash[4] + t1) % 2 ** 32
  $hash[0] = (t1 + t2) % 2 ** 32

  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-----------"
  puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
  puts "#{indent}-----------"
  puts "#{indent}W#{i} = #{bits(w[i])} (message schedule)"
  puts "#{indent}K#{i} = #{bits(k[i])} (constant)"
  puts
  puts "#{indent}T1 = Σ1(e) + Ch(e, f, g) + h + K#{i.to_s.ljust(2, " ")} + W#{i.to_s.ljust(2, " ")} = #{bits(t1)}"
  puts "#{indent}T2 = Σ0(a) + Maj(a, b, c)                = #{bits(t2)}"
  puts
  puts "#{indent}a = #{bits($hash[0])} <- T1 + T2"
  puts "#{indent}b = #{bits($hash[1])}"
  puts "#{indent}c = #{bits($hash[2])}"
  puts "#{indent}d = #{bits($hash[3])}"
  puts "#{indent}e = #{bits($hash[4])} + T1"
  puts "#{indent}f = #{bits($hash[5])}"
  puts "#{indent}g = #{bits($hash[6])}"
  puts "#{indent}h = #{bits($hash[7])}"
  delay(:fastest)
end
delay(:slowest)

system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
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

system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts
puts
puts
puts
puts
puts
puts "#{indent}a = #{" " * 32}   #{bits($hash[0])}"
puts "#{indent}b = #{" " * 32}   #{bits($hash[1])}"
puts "#{indent}c = #{" " * 32}   #{bits($hash[2])}"
puts "#{indent}d = #{" " * 32}   #{bits($hash[3])}"
puts "#{indent}e = #{" " * 32}   #{bits($hash[4])}"
puts "#{indent}f = #{" " * 32}   #{bits($hash[5])}"
puts "#{indent}g = #{" " * 32}   #{bits($hash[6])}"
puts "#{indent}h = #{" " * 32}   #{bits($hash[7])}"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts
puts
puts
puts
puts
puts "#{indent}    H#{$block_number}:"
puts "#{indent}a = #{bits(initial[0])}   #{bits($hash[0])}"
puts "#{indent}b = #{bits(initial[1])}   #{bits($hash[1])}"
puts "#{indent}c = #{bits(initial[2])}   #{bits($hash[2])}"
puts "#{indent}d = #{bits(initial[3])}   #{bits($hash[3])}"
puts "#{indent}e = #{bits(initial[4])}   #{bits($hash[4])}"
puts "#{indent}f = #{bits(initial[5])}   #{bits($hash[5])}"
puts "#{indent}g = #{bits(initial[6])}   #{bits($hash[6])}"
puts "#{indent}h = #{bits(initial[7])}   #{bits($hash[7])}"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts
puts
puts
puts
puts
puts "#{indent}    H#{$block_number}:"
puts "#{indent}a = #{bits(initial[0])} + #{bits($hash[0])}"
puts "#{indent}b = #{bits(initial[1])} + #{bits($hash[1])}"
puts "#{indent}c = #{bits(initial[2])} + #{bits($hash[2])}"
puts "#{indent}d = #{bits(initial[3])} + #{bits($hash[3])}"
puts "#{indent}e = #{bits(initial[4])} + #{bits($hash[4])}"
puts "#{indent}f = #{bits(initial[5])} + #{bits($hash[5])}"
puts "#{indent}g = #{bits(initial[6])} + #{bits($hash[6])}"
puts "#{indent}h = #{bits(initial[7])} + #{bits($hash[7])}"
delay(:slow)

system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number} -> H#{$block_number+1})"
puts "#{indent}-----------"
puts
puts
puts
puts
puts
puts "#{indent}    H#{$block_number+1}:"
puts "#{indent}a = #{bits(add(initial[0], $hash[0]))}"
puts "#{indent}b = #{bits(add(initial[1], $hash[1]))}"
puts "#{indent}c = #{bits(add(initial[2], $hash[2]))}"
puts "#{indent}d = #{bits(add(initial[3], $hash[3]))}"
puts "#{indent}e = #{bits(add(initial[4], $hash[4]))}"
puts "#{indent}f = #{bits(add(initial[5], $hash[5]))}"
puts "#{indent}g = #{bits(add(initial[6], $hash[6]))}"
puts "#{indent}h = #{bits(add(initial[7], $hash[7]))}"
delay(:slow)

system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-----------"
puts "#{indent}compression: (H#{$block_number+1})"
puts "#{indent}-----------"
puts "#{indent}a = #{bits(add(initial[0], $hash[0]))}"
puts "#{indent}b = #{bits(add(initial[1], $hash[1]))}"
puts "#{indent}c = #{bits(add(initial[2], $hash[2]))}"
puts "#{indent}d = #{bits(add(initial[3], $hash[3]))}"
puts "#{indent}e = #{bits(add(initial[4], $hash[4]))}"
puts "#{indent}f = #{bits(add(initial[5], $hash[5]))}"
puts "#{indent}g = #{bits(add(initial[6], $hash[6]))}"
puts "#{indent}h = #{bits(add(initial[7], $hash[7]))}"
delay(:end)

$hash[0] = add(initial[0], $hash[0])
$hash[1] = add(initial[1], $hash[1])
$hash[2] = add(initial[2], $hash[2])
$hash[3] = add(initial[3], $hash[3])
$hash[4] = add(initial[4], $hash[4])
$hash[5] = add(initial[5], $hash[5])
$hash[6] = add(initial[6], $hash[6])
$hash[7] = add(initial[7], $hash[7])

# Save Final State
$state = <<-FRAME
#{$state}
#{indent}-----------
#{indent}compression: (H#{$block_number+1})
#{indent}-----------
#{indent}a = #{bits($hash[0])}
#{indent}b = #{bits($hash[1])}
#{indent}c = #{bits($hash[2])}
#{indent}d = #{bits($hash[3])}
#{indent}e = #{bits($hash[4])}
#{indent}f = #{bits($hash[5])}
#{indent}g = #{bits($hash[6])}
#{indent}h = #{bits($hash[7])}
FRAME
