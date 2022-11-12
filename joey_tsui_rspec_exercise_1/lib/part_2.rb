def hipsterfy (word)
    vowels = "aeiou"
    i = word.length-1
    while i >= 0
        word.each_char do |char|
            if vowels.include?(char)
                return word[0...i] + word[i+1..-1]
            end
            i -= 1
        end
    end
    return word
end

def vowel_counts (str)
    new_hash = Hash.new(0)

    str.each_char do |char|
        new_hash[char.downcase] += 1
    end
    return new_hash
end

def caesar_cipher (str, n)
    alpha = ("a".."z").to_a
    new_str = ""
    str.each_char do |char|
        if alpha.include?(char)
            new_str += alpha[(alpha.index(char) + n) % 26]
        else
            new_str += char
        end
    end
    return new_str
end