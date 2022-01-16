require "./caesar_cipher"
require "./defaultargs"

class Enigma
  include DefaultArgs

  def encrypt(message, key = make_key, date = todays_date)
    CaesarCipher.encrypt(message, key, date)
  end

  def decrypt(cipher, key, date = todays_date)
    CaesarCipher.encrypt(cipher, key, date)
  end

end
