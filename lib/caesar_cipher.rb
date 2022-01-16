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

  #these will become helper methods in a new class
  # create_offset(date) #array of integers for [A, B, C, D]
  # split_keys(key) #array of integers for [A, B, C, D]

      #for the shifts (each letter's shift)
        #for each letter, sum each key and offset
        #rotate corresponding letter set that # of positions
        #message
      #receives a string, downcases it
      #shifts "valid" characters using sum of the offsets and the keys
      #"validates" characters
        #Create valid letter set, containing all a,b,c...z AND SPACE
          #if character is in letter set
            #use next shift ABCD
          #if character is not in letter set
            #skip entirely.
end
