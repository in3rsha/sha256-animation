require_relative 'sha256lib.rb'

# -------
# Default
# -------
if !defined? $input
	# default
	$input   = "abc"
	$type    = "string"
	# argument passed
	$input = ARGV[0] if ARGV[0] # only accept strings for now
	# calculate message
	$bytes   = $input.bytes
	$message = $input.bytes.map {|x| x.to_s(2).rjust(8, "0")}.join
end

# puts string.bytes.inspect                     # [97, 98, 99]
# puts string.bytes.map{|x| x.to_s(16)}.inspect # ["61", "62", "63"]
# puts string.bytes.map{|x| x.to_s(2)}.inspect  # ["1100001", "1100010", "1100011"]
# puts string.unpack("B*")                      # 011000010110001001100011

# ---------
# Animation
# ---------
system "clear"
puts "-------"
puts "message:"
puts "-------"
delay(:fast)

system "clear"
puts "-------"
puts "message:"
puts "-------"
puts "input:   #{$input} (#{$type})"
delay(:normal)

system "clear"
puts "-------"
puts "message:"
puts "-------"
puts "input:   #{$input} (#{$type})"
puts "bytes:   #{$bytes.inspect}" if defined? $bytes
delay(:normal)

system "clear"
puts "-------"
puts "message:"
puts "-------"
puts "input:   #{$input} (#{$type})"
puts "bytes:   #{$bytes.inspect}" if defined? $bytes
puts "message: #{$message}"
delay(:end)

# Save Final State
$state = <<-FRAME
-------
message:
-------
input:   #{$input} (#{$type})
bytes:   #{$bytes.inspect}
message: #{$message}
FRAME
