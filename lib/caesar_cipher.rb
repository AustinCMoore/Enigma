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

  def valid_date? #emergency addition
    @date.to_i > 31
  end

  def pad_offset(offset)
    offset.to_s.rjust(4, "0") #emergency addition
  end

  def build_offsets
    offset = @date.to_i ** 2
    if valid_date? == false #emergency addition
      offset = pad_offset(offset)
    end
      split_offset(offset)
  end

  def split_offset(offset)
    if offset.class == String #emergency addition
      return offset.chars.map {|digit| digit.to_i}
    end
    digits = offset.to_i.digits
    [digits[3], digits[2], digits[1], digits[0]]
  end

  def build_keys
    @key.chars.each_cons(2).map do |char_duo|
      char_duo.join.to_i
    end
  end

  def build_shifts
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
    @char_hash = make_char_hash(build_char_set)
  end

  def shift_index(index, shift)
    (index + shift) % @char_set.length
  end

  def unshift_index(index, shift)
    (index - shift) % @char_set.length
  end

  def encode_message #this & decode_message could become one method
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

  def encrypt #This could become a sequence
    build_shifts
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
    build_char_hash
    decode_message
    {
      decryption: @output,
      key: @key,
      date: @date
    }
  end
end
