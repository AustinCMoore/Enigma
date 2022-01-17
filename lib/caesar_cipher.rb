require_relative "./character_set"

class CaesarCipher
  include CharacterSet
  attr_reader :message,
              :key,
              :date,
              :shifts,
              :output,
              :char_set,
              :char_hash

  def initialize(message, key, date)
    @message   = message.downcase
    @key       = key
    @date      = date
    @shifts    = []
    @output    = ""
    @char_set  = []
    @char_hash = {}
  end

  def build_offsets
    split_offset((@date.to_i)**2)
  end

  def split_offset(offset) #refactor to hash
    digits = offset.digits
    [digits[3], digits[2], digits[1], digits[0]]
  end

  def build_keys #refactor to hash
    @key.chars.each_cons(2).map do |char_duo|
      char_duo.join.to_i
    end
  end

  def build_shifts #refactor to use hashes so counter not necessary
    keys = build_keys
    offsets = build_offsets
    i = 0
    until i == 4
      @shifts << (keys[i] + offsets[i])
      i += 1
    end
    @shifts
  end

  def build_char_set
    @char_set = make_char_set
  end

  def build_char_hash
    @char_hash = make_char_hash(@char_set)
  end

  def shift_index(index, shift)
    (index + shift) % @char_set.length
  end

  def unshift_index(index, shift)
    (index - shift) % @char_set.length
  end

  def encode_message #decode/encode doing alot of the same things...
    @message.each_char do |char|
      if @char_hash.has_key?(char)
        @output << @char_set[shift_index(@char_hash[char], @shifts.first)]
        @shifts.rotate!
      else
        @output << char
      end
    end
    return @output
  end

  def decode_message
    @message.each_char do |char|
      if @char_hash.has_key?(char)
        @output << @char_set[unshift_index(@char_hash[char], @shifts.first)]
        @shifts.rotate!
      else
        @output << char
      end
    end
    return @output
  end

  def encrypt #encrypt/decrypt doing a lot of the same things...
    build_shifts
    build_char_set
    build_char_hash
    encode_message
    {
      encryption: @output,
      key: @key,
      date: @date
    }
  end

  def decrypt
    build_shifts
    build_char_set
    build_char_hash
    decode_message
    {
      decryption: @output,
      key: @key,
      date: @date
    }
  end
end
