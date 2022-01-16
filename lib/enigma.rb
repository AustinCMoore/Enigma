class Enigma
  #modules
  def todays_date
    Date.today.strftime"%d%m%y"
  end

  def make_key
    rand(99999).to_s.rjust(5, "0")
  end
#-----------------------------------------
#class methods
  def create_offset(date)
    split_offset((date.to_i)**2)
  end

  def split_offset(number)
    digits = number.digits
    offset = [digits[3], digits[2], digits[1], digits[0]]
  end

  def split_keys(key)
    key.chars.each_cons(2).map do |duo|
      duo.join.to_i
    end
  end
  #character set
#----------------------------------------------------

  def encrypt(message, key = make_key, date = todays_date)
    #these will become helper methods in a new class
    create_offset(date) #array of integers for [A, B, C, D]
    split_keys(key) #array of integers for [A, B, C, D]

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

  def decrypt(cipher, key, date)
    
  end

end
