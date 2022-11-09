def palindrome?(str)
    i = 0
    while i < str.length - 1
        if str[i] != str[-1 -i]
            return false
        end
        i += 1
    end
    return true
end

def substrings(str)
    arr = []
    str.each_char.with_index do |char, i|
        (i..str.length-1).each do |j|
            arr << str[i..j]
        end
    end

    arr
end

def palindrome_substrings(str)
    substrings_arr = substrings(str)

    substrings_arr.select do |substring|
        if palindrome?(substring) && substring.length > 1
            substring
        end
    end
end

# def palindrome_substrings(str)
#     substrings(str).select {|substr| palindrome?(substr) && substr.length > 1}
# end