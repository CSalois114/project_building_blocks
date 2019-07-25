# substring

# This method takes a word as the first argument and then an array of valid
# substrings, DICTIONARY in this case, as the second argument. It returns a
# hash listing each substring (case insensitive) that was found in the 
# original string and how many times it was found

DICTIONARY = ["below","down","go","going","horn","how","howdy","it","i",
    "low","own","part","partner","sit"]

def substring(string , dictionary)
  matches = {}
  dictionary.each do |word|
    if string.match(/#{word}/i)
      matches[word] = string.scan(/#{word}/i).length  
    end
  end
  matches
end

substring("Howdy partner, sit down! How's it going?", DICTIONARY)