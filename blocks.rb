require_relative "sha256lib.rb"

# -------
# Default
# -------
if !defined? $input
	# default
  $input = "abc"
  $message = $input.unpack("B*")[0]
  # argument passed
  $message = ARGV[0] if ARGV[0] # accept binary message string
  
  # calculate padded message
  $padded = padding($message)
end

# --------------
# Message Blocks
# --------------
$blocks = split($padded, 512)

# ---------
# Animation
# ---------
system "clear"
puts $state + "\n" if defined? $state
puts "--------------"
puts "message blocks:"
puts "--------------"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "--------------"
puts "message blocks:"
puts "--------------"
$blocks.each.with_index do |block, i|
  puts "#{i}: #{block}"
  delay(:normal)
end
delay(:slow)

# Save Final State
contents = "" # contruct string with each block so we can use it inside the final frame
$blocks.each.with_index do |block, i|
  contents << "#{i}: #{block}"
  contents << "\n" if i < $blocks.size - 1 # do not add extra new line after last block
end

$state = <<-FRAME
#{$state}
--------------
message blocks:
--------------
#{contents}
FRAME
