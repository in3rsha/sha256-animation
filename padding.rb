require_relative "sha256lib.rb"

# -------
# Default
# -------
if !defined? $input
	# default
  $input = "abc"
  $message = $input.unpack("B*")[0] # 011000010110001001100011
  # argument passed
  $message = ARGV[0] if ARGV[0] # accept binary message string
end

# -------
# Padding
# -------

# pad the message so that it's a multiple of 512 bits
$l = $message.size      # length of message
$k = (448 - $l - 1) % 512 # pad with zeros up to 448 bits (64 short of 512 bits)

#        message                  padding            size M
# -------------------------------------------------------------
# |         M         |1|...00000000000000000000|...0000001100|
# -------------------------------------------------------------
#  <----------------- 448 bits ----------------> <- 64 bits ->

$padded = $message + "1" + ("0" * $k) + $l.to_s(2).rjust(64, "0")

# ---------
# Animation
# ---------
system "clear"
puts $state + "\n" if defined? $state
puts "-------"
puts "padding:"
puts "-------"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "-------"
puts "padding: (#{$message.size} bits)"
puts "-------"
puts "message: #{$message}"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "-------"
puts "padding: (#{($message + "1").size} bits)"
puts "-------"
puts "message: #{$message}1"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "-------"
puts "padding: (#{($message + "1").size} bits -> #{($message + "1").size + $k} bits)"
puts "-------"
print "message: #{$message}1"
if $delay == "enter" || $delay == "nodelay" # show all padded zeros in one go if we're stepping through with keyboard
  puts "0" * $k
else
  $k.times do |i|
    print "0"
    sleep 0.005
  end
end
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "-------"
puts "padding: (#{($message + "1").size + $k} bits)"
puts "-------"
print "message: #{$message}1#{"0" * $k}"
delay(:normal)

system "clear"
puts $state + "\n" if defined? $state
puts "-------"
puts "padding: (#{$padded.size} bits)"
puts "-------"
puts "message: #{$padded}"
delay(:end)

# Save Final State
$state = <<-FRAME
#{$state}
-------
padding: (#{$padded.size} bits)
-------
message: #{$padded}
FRAME
