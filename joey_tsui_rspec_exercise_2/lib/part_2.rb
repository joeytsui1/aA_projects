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

    str.each_char.with_index do |char, i |
        (i..str.length-1).each do |j|
            arr << str[i..j]
        end
    end
    return arr
end

def palindrome_substrings (str)
    subs = substrings(str)
    new_arr = subs.select do |sub|
        sub if palindrome?(sub) && sub.length > 1
    end
end