require_relative "./interface"

interface = Interface.new(ARGV)
interface.encrypt

# $ ruby ./lib/encrypt.rb message.txt encrypted.txt
# Created 'encrypted.txt' with the key 82648 and date 240818
