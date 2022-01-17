require_relative "./interface"

interface = Interface.new(ARGV)
interface.decrypt

# $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818
# Created 'decrypted.txt' with the key 82648 and date 240818
