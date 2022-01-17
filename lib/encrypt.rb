require_relative "./interface"

interface = Interface.new(ARGV)
interface.encrypt
# require "pry" ; binding.pry

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
