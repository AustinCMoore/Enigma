require 'date'
require_relative "./caesar_cipher"
require_relative "./defaultargs"

class Enigma
  include DefaultArgs

  def encrypt(message, key = make_key, date = todays_date)
    caesar_cipher = CaesarCipher.new(message, key, date)
    caesar_cipher.encrypt
  end

  def decrypt(message, key, date = todays_date)
    caesar_cipher = CaesarCipher.new(message, key, date)
    caesar_cipher.decrypt
  end
end
