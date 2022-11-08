def all_words_capitalized?(arr)
    arr.all? {|word| word[0] == word[0].upcase && word[1..-1] == word[1..-1].downcase
}
end

def no_valid_url?(arr)
    arr.none? {|url| url.end_with?(".com", ".io", ".net", ".org")}
end

def any_passing_students?(arr)

    arr.any? {|student| (student[:grades].sum) / student[:grades].length >= 75 }  
end