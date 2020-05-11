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
  
  # argument passed
  $block = ARGV[0] if ARGV[0] # accept 512 bit binary string as message block
end

# Set variables (these are global variables given to us by the parent sha256.rb script)
if defined? $block
  $block = $block
  $block_number = $block_number
end

# ----------------
# Message Schedule
# ----------------
# Get size of block
size = $block.size

# The message block provides the first 16 words for the message schedule (512 bits / 32 bits = 16 words)
$schedule = $block.scan(/.{32}/).map { |w| w.to_i(2) } # convert from binary string to integer for calculations

# Remember the values used to calculate each word from 16 to 63
memory = Array.new(16) # leave first 16 blank because they were not calculated from previous values

# Calculate remaining 48 words
16.upto(63) do |i|
  $schedule << add(sigma1($schedule[i - 2]), $schedule[i - 7], sigma0($schedule[i - 15]), $schedule[i - 16])
  memory << [sigma1($schedule[i - 2]), $schedule[i - 7], sigma0($schedule[i - 15]), $schedule[i - 16]] # store the values used in the calculation as we go
end

# --------
# Settings
# --------
indent = " " * 2

# ---------
# Animation
# ---------

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-------"
puts "#{indent}block #{$block_number}:"
puts "#{indent}-------"
puts "#{indent}#{$block}"
delay(:slowest)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-------"
puts "#{indent}block #{$block_number}:"
puts "#{indent}-------"
puts "#{indent}#{$block}"
puts
puts "#{indent}----------------"
puts "#{indent}message schedule:"
puts "#{indent}----------------"
delay(:slowest)

# Frame
64.times do |i|
  system "clear"
  puts $state + "\n" if defined? $state
  puts "#{indent}-------"
  puts "#{indent}block #{$block_number}:"
  puts "#{indent}-------"
  if i <= 15
    puts "#{indent}#{$block[((i + 1) * 32)..-1].ljust(size, " ")}"
  else
    puts "#{indent}#{" " * size}" # leave space where it used to be
  end
  puts
  puts "#{indent}----------------"
  puts "#{indent}message schedule:"
  puts "#{indent}----------------"

  (i + 1).times do |j|
    # first 16 value are just words from the message block
    if i <= 15
      puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])}"
    end
    # show values used in calculation for last 48 words
    if i >= 16
      if j < i - 16
        # show nothing
      elsif j == i - 16
        puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])} ->    #{bits(memory[i][3])}"
      elsif j == i - 15
        puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])} -> σ0 #{bits(memory[i][2])}"
      elsif j == i - 7
        puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])} ->    #{bits(memory[i][1])}"
      elsif j == i - 2
        puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])} -> σ1 #{bits(memory[i][0])}"
      elsif j == i
        puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])} = σ1(t-2) + (t-7) + σ0(t-15) + (t-16)"
      else
        puts "#{indent}W#{j.to_s.ljust(2, " ")} #{bits($schedule[j])}"
      end
    end
  end

  # pause before calculating remaining 48 words after the initial 16
  if i == 15
    delay(:normal)
  else
    delay(:fastest)
  end
end
delay(:normal)

# Frame
system "clear"
puts $state + "\n" if defined? $state
puts "#{indent}-------"
puts "#{indent}block #{$block_number}:"
puts "#{indent}-------"
puts "#{indent}#{" " * size}"
puts
puts "#{indent}----------------"
puts "#{indent}message schedule:"
puts "#{indent}----------------"
47.upto(63) do |i|
  puts "#{indent}W#{i.to_s.ljust(2, " ")} #{bits($schedule[i])}"
end
delay(:end)

# Save Final State
$state = <<-FRAME
#{$state}
#{indent}-------
#{indent}block #{$block_number}:
#{indent}-------
#{indent}#{" " * size}

#{indent}----------------
#{indent}message schedule:
#{indent}----------------
#{indent}W#{47.to_s.ljust(2, " ")} #{bits($schedule[47])}
#{indent}W#{48.to_s.ljust(2, " ")} #{bits($schedule[48])}
#{indent}W#{49.to_s.ljust(2, " ")} #{bits($schedule[49])}
#{indent}W#{50.to_s.ljust(2, " ")} #{bits($schedule[50])}
#{indent}W#{51.to_s.ljust(2, " ")} #{bits($schedule[51])}
#{indent}W#{52.to_s.ljust(2, " ")} #{bits($schedule[52])}
#{indent}W#{53.to_s.ljust(2, " ")} #{bits($schedule[53])}
#{indent}W#{54.to_s.ljust(2, " ")} #{bits($schedule[54])}
#{indent}W#{55.to_s.ljust(2, " ")} #{bits($schedule[55])}
#{indent}W#{56.to_s.ljust(2, " ")} #{bits($schedule[56])}
#{indent}W#{57.to_s.ljust(2, " ")} #{bits($schedule[57])}
#{indent}W#{58.to_s.ljust(2, " ")} #{bits($schedule[58])}
#{indent}W#{59.to_s.ljust(2, " ")} #{bits($schedule[59])}
#{indent}W#{60.to_s.ljust(2, " ")} #{bits($schedule[60])}
#{indent}W#{61.to_s.ljust(2, " ")} #{bits($schedule[61])}
#{indent}W#{62.to_s.ljust(2, " ")} #{bits($schedule[62])}
#{indent}W#{63.to_s.ljust(2, " ")} #{bits($schedule[63])}
FRAME

system "clear"
puts $state
