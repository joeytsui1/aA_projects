def partition(arr, num)
    part_arr = Array.new(2) {Array.new(0)}
    arr.each do |ele|
        if ele >= num
            part_arr[1] << ele
        else
            part_arr[0] << ele
        end
    end
    return part_arr
end

def merge (hash1, hash2)
    new_hash = Hash.new{0}

    hash1.each {|key, value| new_hash[key] = value}
    
    hash2.each do |key, value|
        new_hash.key?(key) ? new_hash[key] = value : new_hash[key] = value
    end
    new_hash
end

def censor (sentence, curses)
    new_sen = sentence.split(' ').map do |word|
        if curses.include?(word.downcase)
            replace_vowels(word)
        else
            word
        end
    end
    new_sen.join(" ")
end

def replace_vowels (word)
    vowels = "aeiou"
    new_word = ""
    word.each_char do |char|
        vowels.include?(char.downcase) ? new_word += "*" : new_word += char
    end
    new_word
end

def power_of_two? (num)
    while num >= 1
        return true if num === 1
        num /= 2.0
    end
    return false
end

def power_of_two?(num)
    if num < 1 
        return false
    elsif num == 1
        return true
    end

    return power_of_two?(num/2.0)
end