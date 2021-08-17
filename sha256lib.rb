# =======
# SHA-256
# =======

# -----
# Utils - Handy functions for converting integers and strings to binary
# -----
# Convert integer to binary string (32 bits)
def bits(x, n = 32)
  if x >= 0
    return "%0#{n}b" % x
  else
    # Note: Ruby NOT function returns a negative number, and .to_s(2) displays this mathematical representation in base 2.
  	# Note: So to get the expected unsigned notation you need to get the individual bits instead.
  	# Note: When doing so, ignore the first bit because that's the sign bit.
  	# https://www.calleerlandsson.com/rubys-bitwise-operators/
    return (n - 1).downto(0).map { |i| x[i] }.join
  end
end

# Convert integer to hexadecimal string (32 bits)
def hex(i)
  return i.to_s(16).rjust(8, "0")
end

# Convert string to binary string
def bitstring(string)
  bytes = string.bytes              # convert ascii characters to bytes (integers)
  binary = bytes.map { |x| bits(x, 8) } # convert bytes to binary strings (8 bits in a byte)
  return binary.join
end

# Use standard delay times between frames
def delay(speed)
  if $delay == "enter"
    STDIN.gets # gets on its own will try and read the contents of files passed in through ARGV (then use STDIN if not)
  elsif $delay == "nodelay"
    sleep 0
  else
    # Set speed
    multiplier = 1
    case $delay
    when "fast"
      multiplier = 0.5
    end

    case speed
    when :fastest
      sleep 0.1 * multiplier
    when :fast
      sleep 0.2 * multiplier
    when :normal
      sleep 0.4 * multiplier
    when :slow
      sleep 0.6 * multiplier
    when :slowest
      sleep 0.8 * multiplier
    when :end
      sleep 1.0 * multiplier
    else
      sleep speed
    end
  end
end

# Detect input type base on prefix (i.e. binary, hex, or otherwise just a string)
def input_type(input)
  # Check if input is referencing a file
  if(File.file?(input))
  	return "file"
  else
	  # Check for hex or binary prefix
	  case input[0..1]
	  when "0b"
		# check it's a valid binary string
		if input[2..-1] =~ /[^0-1]/ # only 1s and 0s
		  puts "Invalid binary string: #{input}"
		  exit
		end
		return "binary"
	  when "0x"
		# check it's a valid hex string
		if input[2..-1] !~ /^[0-9A-F]+$/i # only hex chars (case-insensitive)
		  puts "Invalid hex string: #{input}"
		  exit
		end
		return "hex"
	  else
		return "string"
	  end
  end
end

# Convert input (hex, ascii) to array of bytes
def bytes(input, type)
  case type
  when "binary"
    bin = input[2..-1] # trim 0b prefix
    if (bin.size % 8 == 0) # if we have been given a bitstring that makes up an exact number of bytes (8 bits in a byte)
      bytes = bin.scan(/.{8}/).map {|byte| byte.to_i(2)} # convert the bits to array of bytes (in decimal)
    else
      bytes = "(bitstring is not an exact amount of bytes)" # helpful note
    end
  when "hex"
    hex = input[2..-1] # trim 0x prefix
    bytes = [hex].pack("H*").unpack("C*") # convert hex string to bytes
  else
    bytes = input.bytes # convert ASCII string to bytes
  end

  return bytes
end

# ----------
# Operations
# ----------
# Addition modulo 2**32
def add(*x)
  total = x.inject(:+)
  return total % 2 ** 32 # limits result of addition to 32 bits
end

# Rotate right (circular right shift)
def rotr(n, x)
  right = (x >> n)              # right shift
  left = (x << 32 - n)          # left shift
  result = right | left         # combine to create rotation effect
  return result & (2 ** 32 - 1) # use mask to truncate result to 32 bits
end

# Shift right
def shr(n, x)
  result = x >> n
  return result
end

# ---------
# Functions - Combined rotations and shifts using operations above
# ---------
# σ0
def sigma0(x)
  return rotr(7, x) ^ rotr(18, x) ^ shr(3, x)
end

# σ1
def sigma1(x)
  return rotr(17, x) ^ rotr(19, x) ^ shr(10, x)
end

# Σ0 (uppercase)
def usigma0(x)
  return rotr(2, x) ^ rotr(13, x) ^ rotr(22, x)
end

# Σ1
def usigma1(x)
  return rotr(6, x) ^ rotr(11, x) ^ rotr(25, x)
end

# Choice - Use first bit to choose the (1)second or (0)third bit
def ch(x, y, z)
  return (x & y) ^ (~x & z)
end

# Majority - Result is the majority of the three bits
def maj(x, y, z)
  return (x & y) ^ (x & z) ^ (y & z)
end

# -------------
# Preprocessing
# -------------
# Pad binary string message to multiple of 512 bits
def padding(message)
  l = message.size  # size of message (in bits)
  k = (448 - l - 1) % 512 # pad with zeros up to 448 bits (64 bits short of 512 bits)
  l64 = bits(l, 64) # binary representation of message size (64 bits in length)
  return message + "1" + ("0" * k) + l64 # don't forget "1" bit between message and padding
end

# Cut padded message in to 512-bit message blocks
def split(message, size = 512)
  return message.scan(/.{#{size}}/)
end

# ----------------
# Message Schedule
# ----------------
# Calculate the 64 words for the message schedule from the message block
def calculate_schedule(block)
  # The message block provides the first 16 words for the message schedule (512 bits / 32 bits = 16 words)
  schedule = block.scan(/.{32}/).map { |w| w.to_i(2) } # convert from binary string to integer for calculations

  # Calculate remaining 48 words
  16.upto(63) do |i|
    schedule << add(sigma1(schedule[i - 2]), schedule[i - 7], sigma0(schedule[i - 15]), schedule[i - 16])
  end

  return schedule
end

# ---------
# Constants
# ---------
# Constants = Cube roots of the first 64 prime numbers (first 32 bits of the fractional part)
K = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311].map { |prime| prime ** (1 / 3.0) }.map { |i| (i - i.floor) }.map { |i| (i * 2 ** 32).floor }

# -----------
# Compression - Run compression function on the message schedule and constants
# -----------
# Initial Hash Values = Square roots of the first 8 prime numbers (first 32 bits of the fractional part)
IV = [2, 3, 5, 7, 11, 13, 17, 19].map { |prime| prime ** (1 / 2.0) }.map { |i| (i - i.floor) }.map { |i| (i * 2 ** 32).floor }

def compression(initial, schedule, constants)
  # state register - set initial values ready for the compression function
  h = initial[7]
  g = initial[6]
  f = initial[5]
  e = initial[4]
  d = initial[3]
  c = initial[2]
  b = initial[1]
  a = initial[0]

  # compression function - update state for every word in the message schedule
  64.times do |i|
    # calculate temporary words
    t1 = add(schedule[i], constants[i], usigma1(e), ch(e, f, g), h)
    t2 = add(usigma0(a), maj(a, b, c))

    # rotate state registers one position and add in temporary words
    h = g
    g = f
    f = e
    e = add(d, t1)
    d = c
    c = b
    b = a
    a = add(t1, t2)
  end

  # Final hash values are previous intermediate hash values added to output of compression function
  hash = []
  hash[7] = add(initial[7], h)
  hash[6] = add(initial[6], g)
  hash[5] = add(initial[5], f)
  hash[4] = add(initial[4], e)
  hash[3] = add(initial[3], d)
  hash[2] = add(initial[2], c)
  hash[1] = add(initial[1], b)
  hash[0] = add(initial[0], a)
  #hash = initial.zip(updated).map {|i, u| add(i, u)} # succinct method for adding one array on top of another (but not as readable)

  # return final state
  return hash
end

# -------
# SHA-256 - Complete SHA-256 function
# -------
def sha256(string)
  # 0. Convert String to Binary
  # ---------------------------
  message = bitstring(string)

  # 1. Preprocessing
  # ----------------
  # Pad message
  padded = padding(message)

  # Split up in to 512 bit message blocks
  blocks = split(padded, 512)

  # 2. Hash Computation
  # -------------------
  # Set initial hash state using initial hash values
  hash = IV

  # For each message block
  blocks.each do |block|
    # Prepare 64 word message schedule
    schedule = calculate_schedule(block)

    # Remember starting hash values
    initial = hash.clone

    # Apply compression function to update hash values
    hash = compression(initial, schedule, constants = K)
  end

  # 3. Result
  # ---------
  # Convert hash values to hexadecimal and concatenate
  return hash.map { |w| "%08x" % w }.join
end

# --------
# Examples
# --------
#require 'digest' # for testing
#puts sha256("") == Digest::SHA256.hexdigest("") #=> e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855
#puts sha256("abc") == Digest::SHA256.hexdigest("abc") #=> ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
#puts sha256("learnmeabitcoin") == Digest::SHA256.hexdigest("learnmeabitcoin") #=> ef235aacf90d9f4aadd8c92e4b2562e1d9eb97f0df9ba3b58258739cb013db2
#puts sha256("xyz"*1000) == Digest::SHA256.hexdigest("xyz"*1000)
