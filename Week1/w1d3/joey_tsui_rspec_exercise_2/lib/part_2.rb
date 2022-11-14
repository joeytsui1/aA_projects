def palindrome? (str)
    str.each_char.with_index do |char, i|
        if str[i] != str[-1-i]
            return false
        end
    end
    return true
end

# def palindrome? (str)
#     (0...str.length-1).all? {|i| str[i] == str[-1-i]}
# end

# def palindrome? (str)
#     (0...str.length-1).none? {|i| str[i] != str[-1-i]}
# end

def substrings (str)
    arr = []
    (0..str.length-1).each do |i|
        (i..str.length-1).each do |j|
            arr << str[i..j]
        end
    end
    return arr
end

def palindrome_substrings (str)
    subs = substrings(str)
    subs.select {|sub| palindrome?(sub) && sub.length > 1}
end