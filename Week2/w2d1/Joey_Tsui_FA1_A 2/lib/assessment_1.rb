def my_map! (arr, &blk)
    arr.each_with_index do |ele, i|
        
        arr[i] = blk.call(ele)
    end
    return arr
end

def two? (arr, &blk)
    count = 0

    arr.each do |ele|
        if blk.call(ele)
            count += 1
        end
    end
    count == 2
end

def nor_select (arr, prc1, prc2)
    arr.select {|ele| !prc1.call(ele) && !prc2.call(ele)}
end

def array_of_hash_sum (arr)
    count = 0

    arr.each do |hash|
        hash.each do |k, v|
            count += v
        end
    end
    return count
end

def slangify (sen)
    words = sen.split(" ")
    new_sen = []

    words.each do |word|
        new_sen << remove_first_vowel(word)
    end

    return new_sen.join(' ')
end

def remove_first_vowel(word)
    vowels = "aeiou"

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word[0...i] + word[i + 1..-1]
        end
    end
    return word
end

def char_counter (string, *chars)
    hash = Hash.new(0)

    chars.each do |char|
        hash[char] = 0
    end

    if hash.length == 0
        string.each_char do |ele|
            hash[ele] += 1
        end
    else
        string.each_char do |ele|
            if hash.has_key?(ele)
                hash[ele] += 1
            end
        end
    end
    return hash
end