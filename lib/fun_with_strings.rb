module FunWithStrings
  def palindrome?
    #downcase then get rid of non-words
    new_str = self.downcase.gsub(/\W/, "")
    return new_str == new_str.reverse
  end
  def count_words
    #downcase then get rid of non-words except for space
    new_str = self.downcase.gsub(/[^\w\s]/, "")
    words = new_str.split(" ")
    frequencies = Hash.new(0)
    
    words.each do |word|
      frequencies[word] += 1
    end
    
    return frequencies
  end
  def anagram_groups
    original = self.split(" ")
    new_str = self.downcase
    words = new_str.split(" ")
    
    #sort characters in each word
    for i in (0...words.length) do
      words[i] = words[i].chars.sort.join
    end
    
    hash = Hash.new do |h,k| 
      h[k] = Array.new
    end
    
    #push anagram into the same hash key
    for i in (0...words.length) do
      hash[words[i]].push(original[i])
    end
    
    #contruct an array of arrays of anagrams
    arr = Array.new
    hash.each_value do |anagram|
      arr.push(anagram)
    end
    
    return arr
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
