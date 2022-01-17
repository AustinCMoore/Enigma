module CharacterSet
  #we could eliminate the need for make_char_set with ordinals,
  #however this design looks to a future feature where the user creates
  #their character set. An array is a natural way to store this information,
  #and requires less work as the character set grows. My understanding is that
  #memory is cheaper than processing, so my design decision is to keep this.
  def make_char_set
    ("a".."z").to_a << " "
  end

  def make_char_hash(char_set)
    index = 0
    index_by_char = Hash.new { |hash, key| hash[key] = 0 }
    char_set.each do |char|
      index_by_char[char] += index
      index += 1
    end
    return index_by_char
  end
end
