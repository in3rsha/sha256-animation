# coding: utf-8
require_relative "sha256lib.rb"

# -------
# Default
# -------
if !defined? $input
	# default
  $input = "abc"
  # argument passed
	$input = ARGV[0] if ARGV[0] # only accept strings for now
	
  $message = $input.unpack("B*")[0] # 011000010110001001100011
  $padded = padding($message)
  $blocks = split($padded, 512)
  
  # Set initial hash state using initial hash values
  $hash = IV

  # For each message block
  $blocks.each do |block|
    # Prepare 64 word message schedule
    schedule = calculate_schedule(block)

    # Remember starting hash values
    initial = $hash.clone

    # Apply compression function to update hash values
    $hash = compression(initial, schedule, constants = K)
  end
end

# Start
system "clear"
puts $state + "\n" if defined? $state
puts "----------------"
puts "final hash value: (H#{$blocks.size})"
puts "----------------"
registers = ("a".."h").to_a
8.times do |i|
  puts "#{registers[i]} = #{bits($hash[i])}"
end
delay(:slowest)

# Frame - Hexadecimal
system "clear"
puts $state + "\n" if defined? $state
puts "----------------"
puts "final hash value: (H#{$blocks.size})"
puts "----------------"
8.times do |i|
  puts "#{registers[i]} = #{bits($hash[i])} = #{hex($hash[i])}"
end
delay(:slowest)

# Frame - Concatenate
$digest = ""
8.times do |i|
  $digest << hex($hash[i])
  system "clear"
  puts $state + "\n" if defined? $state
  puts "----------------"
  puts "final hash value: (H#{$blocks.size})"
  puts "----------------"
  8.times do |j|
    puts "#{registers[j]} = #{bits($hash[j])} = #{hex($hash[j])}"
  end
  puts
  puts "#{$digest}"
  delay(:fastest)
end
delay(:end)
delay(:end) # extra delay for the absolute final frame
