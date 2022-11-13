def hipsterfy (word) # MAIN THIING ABOUT THIS QUESTION IS TOO KNOW HOW TO REMOVE LAST VOWEL
    vowels = "aieou" # THERES MANY WAY TO DO IT BUT IM MORE COMFORTABLE USING WHILE LOOP
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

def vowel_counts (str) #MAIN THING ABOUT THIS QUESTION IS TO UNDERSTAND HOW TO CREATE HASH AND PUT VALUE IN IT
    vowels = "aeiou"
    hash = Hash.new(0)
    str.each_char do |char|
        if vowels.include?(char.downcase)
            hash[char.downcase] += 1
        end
    end
    return hash
end

def caesar_cipher (sen, n)
    alpha = ("a".."z").to_a

    new_str = ""

    sen.each_char do |char|
        if alpha.include?(char)
            new_str += alpha[(alpha.index(char) + n) % 26]
        else
            new_str += char
        end
    end
    return new_str
end