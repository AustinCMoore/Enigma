class CaesarCipher

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
      shifts << (keys[i] + offsets[i]) % 27 #replace integer with char_set.length
      i += 1
    end
    return shifts
  end

  #we now have shifts as modulus in [A,B,C,D] format (no hash needed)
    #for character set (mix in)
      #designing as if we may one day want other characters
      #no need to enter characters, so we will use range to create
      #but we will create hash table for any given character set
      #hash table used to validate each character
    

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
