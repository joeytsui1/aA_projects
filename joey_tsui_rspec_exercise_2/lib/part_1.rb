def partition (arr, num)
    part_arr = Array.new(2) {Array.new(0)}

    arr.each do |ele|
        if ele < num
            part_arr[0] << ele
        else
            part_arr[1] << ele
        end
    end
    return part_arr
end

def merge(hash1, hash2)
    new_hash = Hash.new(0)

    hash1.each do |k, v|
        new_hash[k] = v
    end

    hash2.each do |k,v|
        new_hash[k] = v
    end

    return new_hash
end

def censor (sen, curses)
    words = sen.split(' ')

    new_sen = words.map do |word|
        if curses.include?(word.downcase)
            change_word(word)
        else
            word
        end
    end
    new_sen.join(" ")
end

def change_word(word)
    vowels = "aieou"

    new_word = ""
    word.each_char do |char|
        if vowels.include?(char.downcase)
            new_word += "*"
        else
            new_word += char
        end
    end
    return new_word
end

def power_of_two? (num)
    while num >= 1
        return true if num == 1
        num /= 2.0
    end
    return false
end