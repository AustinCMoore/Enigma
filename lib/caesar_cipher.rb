# require "./character_set"

class CaesarCipher
  # include CharacterSet

  def initialize(message, key, date)
    @message = message
    @key     = key
    @date    = date
  end

  def self.create_offset(date)
    split_offset((date.to_i)**2)
  end

  def self.split_offset(number)
    digits = number.digits
    offset = [digits[3], digits[2], digits[1], digits[0]]
  end

  def self.split_keys(key)
    key.chars.each_cons(2).map do |duo|
      duo.join.to_i
    end
  end

  def self.find_shifts(keys, offsets) #refactor to work for any char_set
    shifts = []
    i = 0
    until i == 4
      shifts << (keys[i] + offsets[i])
      i += 1
    end
    return shifts
  end

  # def self.return_char_set
  #   make_char_set
  # end
  #
  # def self.return_char_hash
  #   make_char_hash(make_char_set)
  # end

  def self.make_char_set
    characters = ("a".."z").to_a
    characters << " "
  end

  def self.make_char_hash(characters)#refactor, passing in a char set is messy
    index = 0
    index_by_character = Hash.new { |hash, key| hash[key] = 0 }
    make_char_set.each do |character|
      index_by_character[character] += index
      index += 1
    end
    return index_by_character
  end

  def self.valid_char?(character) #refactor above to improve
    make_char_hash(make_char_set).has_key?(character)
  end

  def self.index_by_char(character)
    make_char_hash(make_char_set)[character]
  end

  def self.char_by_index(index)
    make_char_set[index]
  end

  def self.encrypt(message, key, date)
    message = message.downcase
    offsets = create_offset(date)
    keys = split_keys(key)
    shifts = find_shifts(keys, offsets)
    char_set = make_char_set
    char_hash = make_char_hash(char_set)

    message.each_char do |character| #until end of string
      if valid_char?(character) #true for valid character, false if not
        char_by_index((index_by_char(character) + shifts.first) % char_set.length) #okay... shorten this
      end
    end
  end

  #we now have shifts as modulus in [A,B,C,D] format (no hash needed)
    #for character set (mix in)
      #designing as if we may one day want other characters
      #no need to enter characters, so we will use range to create
      #but we will create hash table for any given character set
      #hash table used to validate each character
      #what if we use ordinal values???


    #for a given message
      #receives as string, downcases it
      #until end of string
      #"validates" characters
        #Create valid letter set, containing all a,b,c...z AND SPACE
          #if character is in letter set
            #use current shift
            #rotate shift
          #if character is not in letter set
            #next string character, do not shift
end
