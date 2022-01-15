class Enigma
  def todays_date
    Date.today.strftime"%d%m%y"
  end

  def make_key
    rand(99999).to_s.rjust(5, "0")
  end

  def encrypt(message, key = make_key, date = todays_date)

    require "pry" ; binding.pry
        #for the offsets (given 6 digit date as integer)
          #square the date
          #take the last 4 digits of that new number
          #for the A offset
            #take the 1st digit as integer
          #for the B offset
            #take the 2nd digit as integer
          #for the C offset
            #take the 3rd digit as integer
          #for the D offset
            #take the 4th digit as integer
        #for the shifts (each letter's shift)
          #for each letter, sum each key and offset
          #rotate corresponding letter set that # of positions
          #message
        #receives a string, downcases it
        #shifts "valid" characters using sum of the offsets and the keys
          #for the keys (given 5 digit key as string)
            #for the A key
              #take key as string, return 1st and 2nd digits as integer
            #for the B key
              #take key as string, return 2nd and 3rd digits as integer
            #for the C key
              #take key as string, return 3rd and 4th digits as integer
            #for the D key
              #take key as string, return 4th and 5th digits as integer
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
