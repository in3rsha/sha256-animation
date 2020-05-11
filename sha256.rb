require_relative "sha256lib.rb"

# -------
# Default
# -------
if !defined? $input
  # Command Line Arguments
  $input = ARGV[0] || "abc"    # "string"|"0xaabbcc"|"0b10110100"
  $delay = ARGV[1] || "normal" # [enter|normal|fast|nodelay]

  # Detect Input Type (binary, hex, or string)
  $type = input_type($input)

  # Convert Input To Bytes
  $bytes = input_to_bytes($input, $type)

  # Set message (raw bytes of input data as a binary string)
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
end

# 1. Message
load "message.rb"

# 2. Padding
load "padding.rb"

# 3. Message Blocks
load "blocks.rb"

# For each block
$blocks.each.with_index do |block, i|
	# make variables global so scripts can access them
  $block = block
  $block_number = i

  # 4. Message Schedule
  load "schedule.rb"

  # 5. Compression (Initial Hash Values)
  load "initial.rb" if $block_number == 0 # Only set initial hash values on first run

  # 5. Compression
  load "compression.rb" # Use hash values from previous compression otherwise
end

# 6. Final Hash
load "final.rb"
