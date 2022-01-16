# module CharacterSet
#   def make_char_set
#     ("a".."z").to_a << " "
#   end
#
#   def make_char_hash(characters)#refactor, passing in a char set is messy
#     index = 0
#     index_by_char = Hash.new { |hash, key| hash[key] = 0 }
#     make_char_set.each do |character|
#       index_by_char[character] += index
#       index += 1
#     end
#     return index_by_char
#   end
#
#   def valid_char?(char) #refactor above to improve
#     make_char_hash(make_char_set).has_key?(char)
#   end
# end
