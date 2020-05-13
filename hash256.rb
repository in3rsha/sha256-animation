require_relative "sha256lib.rb"

# ----------
# hash256.rb - The hash function used in Bitcoin. Basically just runs sha256.rb twice.
# ----------

# Command Line Arguments
$input = ARGV[0] || "0x0100000000000000000000000000000000000000000000000000000000000000000000003ba3edfd7a7b12b27ac72c3e67768f617fc81bc3888a51323a9fb8aa4b1e5e4a29ab5f49ffff001d1dac2b7c"    # "string"|"0xaabbcc"|"0b10110100"
$delay = ARGV[1] || "fast" # [enter|normal|fast|nodelay]

# Assume that every input is hexadecimal bytes
if $input[0..1] != "0x"
  $input = "0x" + $input # prepend 0x if there isn't one (so the upcoming functions can detect it correctly)
end

# Make sure it's a valid size (even number of characters)
if $input.size % 2 != 0
  puts "Invalid input to hash256.rb. Expecting even number of hex characters (i.e. bytes)."
  exit
end

# Convert hex to bytes
$type = input_type($input)
$bytes = bytes($input, $type)
$message = $bytes.map { |x| x.to_s(2).rjust(8, "0") }.join

# Note about hitting enter to step
if $delay == "enter"
  puts "Hit enter to step through."
  STDIN.gets
end

# Catch Ctrl-C to prevent unsightly errors when terminating early
Signal.trap("SIGINT") do
  exit
end

# 1. First Hash
load "sha256.rb"

# 2. Use output of first hash as input to second hash
$input = "0x" + $digest # prepend 0x to show that it's hex bytes
$type = input_type($input)
$bytes = bytes($input, $type)
$message = $bytes.map { |x| x.to_s(2).rjust(8, "0") }.join

# 2. Second Hash
load "sha256.rb"
