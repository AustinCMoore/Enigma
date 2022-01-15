class Enigma

  def encrypt(message, key, date)#key defaults to random key, date defaults to today as DDMMYY
  #given as string, so keep as string until given to key
    #key
      #validate given key (must be 5 digits)
      #if key not given
        #randomly generate key (class method?)
      #if key < 5
        #pad with zeroes until length == 5
      #if key > 5
        #? will only happen with user input
    #date
      #validate given date (must be 6 digits)
      #if date not given
        #Date.today.strftime"%d%m%y").to_i
      #if date < 6
        #? will only happen with user input
      #if date > 6
        #? will only happen with user input
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
