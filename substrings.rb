def count_substrings(text, dictionary) 
    text = text.downcase
    occurences = dictionary.each_with_object({}) do | word, result |
        matches = text.scan(word).length
        result[word] = matches if matches > 0 
    end
    occurences
end

dictionary = ["below", "down", "go", "going", "horn","how","howdy","it", "i","low","own","part","partner","sit"]

puts count_substrings("below",dictionary)