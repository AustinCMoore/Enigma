require 'date'
require_relative "./caesar_cipher"
require_relative "./defaultargs"

class Enigma
  include DefaultArgs

  def encrypt(message, key, date)
    key = make_key if key.nil?
    date = todays_date if date.nil?
    caesar_cipher = CaesarCipher.new(message, key, date)
    caesar_cipher.encrypt
  end

  def decrypt(message, key, date)
    date = todays_date if date.nil?
    caesar_cipher = CaesarCipher.new(message, key, date)
    caesar_cipher.decrypt
  end
end
