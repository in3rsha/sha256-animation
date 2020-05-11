# coding: utf-8
require_relative "sha256lib.rb"

# -------
# Default
# -------
if !defined? $input
	# default
  $input = "abc"
  $message = $input.unpack("B*")[0] # 011000010110001001100011
  $padded = padding($message)
  $blocks = split($padded, 512)
  $block_number = 0               # message block number
  $block = $blocks[$block_number]
  $t = 63 # the word in the message schedule we want to calculate
  
  # arguments passed
  if ARGV[0] # message block
  	$block = ARGV[0].rjust(512, "0") # accept binary string as message block
  end
  
  if ARGV[1] # word number
  	$t = ARGV[1].to_i # choose a word in the message schedule to calculate (16-63)
  end
end

# The message block provides the first 16 words for the message schedule (512 bits / 32 bits = 16 words)
$schedule = $block.scan(/.{32}/).map { |w| w.to_i(2) } # convert from binary string to integer for calculations

# Calculate remaining 48 words
16.upto(63) do |i|
  $schedule << add(sigma1($schedule[i - 2]), $schedule[i - 7], sigma0($schedule[i - 15]), $schedule[i - 16])
end

# convenient variables for word numbers in the schedule
t    = ($t-0).to_s.ljust(2, " ")
t_1  = ($t-1).to_s.ljust(2, " ")
t_2  = ($t-2).to_s.ljust(2, " ")
t_3  = ($t-3).to_s.ljust(2, " ")
t_4  = ($t-4).to_s.ljust(2, " ")
t_5  = ($t-5).to_s.ljust(2, " ")
t_6  = ($t-6).to_s.ljust(2, " ")
t_7  = ($t-7).to_s.ljust(2, " ")
t_8  = ($t-8).to_s.ljust(2, " ")
t_9  = ($t-9).to_s.ljust(2, " ")
t_10 = ($t-10).to_s.ljust(2, " ")
t_11 = ($t-11).to_s.ljust(2, " ")
t_12 = ($t-12).to_s.ljust(2, " ")
t_13 = ($t-13).to_s.ljust(2, " ")
t_14 = ($t-14).to_s.ljust(2, " ")
t_15 = ($t-15).to_s.ljust(2, " ")
t_16 = ($t-16).to_s.ljust(2, " ")

# --------
# Settings
# --------
indent = " " * 2

# ---------
# Animation
# ---------

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits($schedule[$t-15])} ROTR 7
#{indent}W#{t_14} #{bits($schedule[$t-14])}      #{bits($schedule[$t-15])} ROTR 18
#{indent}W#{t_13} #{bits($schedule[$t-13])}      #{bits($schedule[$t-15])}  SHR 3
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
7.times do |i|
  system "clear"
  puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(rotr(i + 1, $schedule[$t-15]))} ROTR 7
#{indent}W#{t_14} #{bits($schedule[$t-14])}      #{bits($schedule[$t-15])} ROTR 18
#{indent}W#{t_13} #{bits($schedule[$t-13])}      #{bits($schedule[$t-15])}  SHR 3
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
  delay(:fastest)
end
delay(:normal)

# Frame
18.times do |i|
  system "clear"
  puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(rotr(7, $schedule[$t-15]))} ROTR 7
#{indent}W#{t_14} #{bits($schedule[$t-14])}      #{bits(rotr(i + 1, $schedule[$t-15]))} ROTR 18
#{indent}W#{t_13} #{bits($schedule[$t-13])}      #{bits($schedule[$t-15])}  SHR 3
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
  delay(:fastest)
end
delay(:normal)

# Frame
3.times do |i|
  system "clear"
  puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(rotr(7, $schedule[$t-15]))} ROTR 7
#{indent}W#{t_14} #{bits($schedule[$t-14])}      #{bits(rotr(18, $schedule[$t-15]))} ROTR 18
#{indent}W#{t_13} #{bits($schedule[$t-13])}      #{bits(shr(i + 1, $schedule[$t-15]))}  SHR 3
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:fastest)
end
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(rotr(7, $schedule[$t-15]))} ROTR 7
#{indent}W#{t_14} #{bits($schedule[$t-14])}      #{bits(rotr(18, $schedule[$t-15]))} ROTR 18
#{indent}W#{t_13} #{bits($schedule[$t-13])}      #{bits(shr(3, $schedule[$t-15]))} XOR
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(rotr(7, $schedule[$t-15]))}
#{indent}W#{t_14} #{bits($schedule[$t-14])}      #{bits(rotr(18, $schedule[$t-15]) ^ shr(3, $schedule[$t-15]))} XOR
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(rotr(7, $schedule[$t-15]) ^ rotr(18, $schedule[$t-15]) ^ shr(3, $schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }      #{bits($schedule[$t-2])} ROTR 17
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }      #{bits($schedule[$t-2])} ROTR 19
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits($schedule[$t-2])}  SHR 10
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
17.times do |i|
  system "clear"
  puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }      #{bits(rotr(i + 1, $schedule[$t-2]))} ROTR 17
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }      #{bits($schedule[$t-2])} ROTR 19
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits($schedule[$t-2])}  SHR 10
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:fastest)
end
delay(:normal)

# Frame
19.times do |i|
  system "clear"
  puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }      #{bits(rotr(17, $schedule[$t-2]))} ROTR 17
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }      #{bits(rotr(i + 1, $schedule[$t-2]))} ROTR 19
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits($schedule[$t-2])}  SHR 10
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:fastest)
end
delay(:normal)

# Frame
10.times do |i|
  system "clear"
  puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }      #{bits(rotr(17, $schedule[$t-2]))} ROTR 17
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }      #{bits(rotr(19, $schedule[$t-2]))} ROTR 19
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits(shr(i + 1, $schedule[$t-2]))}  SHR 10
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:fastest)
end
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }      #{bits(rotr(17, $schedule[$t-2]))} XOR
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }      #{bits(rotr(19, $schedule[$t-2]))}
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits(shr(10, $schedule[$t-2]))}
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }      #{bits(rotr(19, $schedule[$t-2]) ^ rotr(17, $schedule[$t-2]))} XOR
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits(shr(10, $schedule[$t-2]))}
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:normal)

# Frame
system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits(rotr(19, $schedule[$t-2]) ^ rotr(17, $schedule[$t-2]) ^ shr(10, $schedule[$t-2]))} σ1
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   }                                  = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:slow)

# Frame
result = add(sigma1($schedule[$t-2]), $schedule[$t-7], sigma0($schedule[$t-15]), $schedule[$t-16])

system "clear"
puts <<-MS
#{indent}----------------
#{indent}message schedule: (expansion)
#{indent}----------------
#{indent}W#{t_16} #{bits($schedule[$t-16])}  ->  #{bits($schedule[$t-16])}
#{indent}W#{t_15} #{bits($schedule[$t-15])}  ->  #{bits(sigma0($schedule[$t-15]))} σ0
#{indent}W#{t_14} #{bits($schedule[$t-14])}
#{indent}W#{t_13} #{bits($schedule[$t-13])}
#{indent}W#{t_12} #{bits($schedule[$t-12])}
#{indent}W#{t_11} #{bits($schedule[$t-11])}
#{indent}W#{t_10} #{bits($schedule[$t-10])}
#{indent}W#{t_9 } #{bits($schedule[$t-9]) }
#{indent}W#{t_8 } #{bits($schedule[$t-8]) }
#{indent}W#{t_7 } #{bits($schedule[$t-7]) }  ->  #{bits($schedule[$t-7])}
#{indent}W#{t_6 } #{bits($schedule[$t-6]) }
#{indent}W#{t_5 } #{bits($schedule[$t-5]) }
#{indent}W#{t_4 } #{bits($schedule[$t-4]) }
#{indent}W#{t_3 } #{bits($schedule[$t-3]) }
#{indent}W#{t_2 } #{bits($schedule[$t-2]) }  ->  #{bits(sigma1($schedule[$t-2]))} σ1
#{indent}W#{t_1 } #{bits($schedule[$t-1]) }
#{indent}W#{t   } #{bits(result)} = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)
MS
delay(:end)

# Spare Frame
# system "clear"
# puts <<-MS
# 47 00000110010111000100001111011010  ->  00000110010111000100001111011010
# 48 11111011001111101000100111001011  ->  11111011001111101000100111001011 ROTR 7
# 49 11001100011101100001011111011011      11111011001111101000100111001011 ROTR 18
# 50 10111001111001100110110000110100      11111011001111101000100111001011  SHR 3
# 51 10101001100110010011011001100111
# 52 10000100101110101101111011011101
# 53 11000010000101000110001010111100
# 54 00010100100001110100011100101100
# 55 10110010000011110111101010011001
# 56 11101111010101111011100111001101  ->  11101111010101111011100111001101
# 57 11101011111001101011001000111000
# 58 10011111111000110000100101011110
# 59 01111000101111001000110101001011
# 60 10100100001111111100111100010101
# 61 01100110100010110010111111111000  ->  01100110100010110010111111111000 ROTR 17
# 62 11101110101010111010001011001100      01100110100010110010111111111000 ROTR 19
# 63                                       01100110100010110010111111111000  SHR 10
# MS
# sleep 0.2
