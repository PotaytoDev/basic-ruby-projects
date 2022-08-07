def substrings(string, dictionary)
  string_array = string.downcase.split

  string_array.reduce(Hash.new(0)) do |substrings_hash, string_word|
    dictionary.each do |dictionary_word|
      if string_word.include?(dictionary_word)
        substrings_hash[dictionary_word] += 1
      end
    end
    substrings_hash
  end
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("Howdy partner, sit down! How's it going?", dictionary)