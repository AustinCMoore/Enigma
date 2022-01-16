# require "./character_set"

class CaesarCipher
  # include CharacterSet

  def initialize(message, key, date) #do I need this? how can i use this
    @message = message
    @key     = key
    @date    = date
  end

  #------------------------------------------------------

  def self.create_offset(date)
    split_offset((date.to_i)**2)
  end

  def self.split_offset(number)
    digits = number.digits
    offset = [digits[3], digits[2], digits[1], digits[0]] #maybe different result class?
  end

  def self.split_keys(key)
    key.chars.each_cons(2).map do |duo| #maybe different result class?
      duo.join.to_i
    end
  end

#this can be refactored
  def self.find_shifts(keys, offsets)
    shifts = []
    i = 0
    until i == 4
      shifts << (keys[i] + offsets[i])
      i += 1
    end
    return shifts
  end
  #----------------------------------------------------------
#this can be a new module
  # def self.return_char_set
  #   make_char_set
  # end
  #
  # def self.return_char_hash
  #   make_char_hash(make_char_set)
  # end

#ordinal value?
  def self.make_char_set #this is static
    characters = ("a".."z").to_a
    characters << " "
  end

  def self.make_char_hash(characters) #this is also static?
    index = 0
    index_by_character = Hash.new { |hash, key| hash[key] = 0 }
    make_char_set.each do |character|
      index_by_character[character] += index
      index += 1
    end
    return index_by_character
  end

  def self.valid_char?(character) #am i making new character set every time?
    make_char_hash(make_char_set).has_key?(character)
  end

  def self.index_by_char(character)
    make_char_hash(make_char_set)[character]
  end

  def self.char_by_index(index)
    make_char_set[index]
  end

  def self.new_char(character, shift, char_set)
    char_by_index((index_by_char(character) + shift) % char_set.length)
  end

  def self.encode_message(message, shifts, char_set)
    encoded = ""
    message.each_char do |character|
      if valid_char?(character)
        encoded << new_char(character, shifts.first, char_set)
        shifts = shifts.rotate
      else
        encoded << character
      end
    end
    return encoded
  end

  def self.return_data(text, key, date)
    {
      encryption: text,
      key: key,
      date: date
    }
  end

  def self.encrypt(message, key, date)
    message = message.downcase
    shifts = find_shifts(split_keys(key), create_offset(date))
    char_set = make_char_set
    encoded = encode_message(message, shifts, char_set)
    return_data(encoded, key, date)
  end
end
