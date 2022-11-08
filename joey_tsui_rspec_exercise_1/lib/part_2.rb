def hipsterfy(word) 
    vowels = "aeiou"
    i = word.length - 1
    while i >= 0
        if vowels.include?(word[i])
            return word[0...i] + word[i+1..-1]
        end
        i -= 1
    end
    return word
end

def vowel_counts(string)
    vowels = "aeiou"
    counter = Hash.new(0)

    string.each_char do |char|
        counter[char.downcase] += 1 if vowels.include?(char.downcase)
    end
    return counter
end

def caesar_cipher(str, num)
    alphabet = "abcdefghijklmnopqrstuvwxyz"
    new_str = ''

    str.each_char do |char| 
        if alphabet.include?(char)
            new_str += alphabet[(alphabet.index(char)+ num) % 26]
        else
            new_str += char
        end
    end
    return new_str
end