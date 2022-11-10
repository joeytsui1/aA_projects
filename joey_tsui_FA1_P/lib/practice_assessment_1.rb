# Define your methods here. 

def first_letter_vowel_count(sen)
    vowels ="aeiou"
    words = sen.split(" ")
    words.count {|word| vowels.include?(word[0].downcase)}
end

def count_true (arr, proc)
    arr.count {|ele| proc.call(ele)}
end

def procformation (arr, proc1, proc2, proc3)
    arr.map do |ele|
        if proc1.call(ele)
            proc2.call(ele)
        else
            proc3.call(ele)
        end
    end
end

def array_of_array_sum (arrays)
    return arrays.flatten.sum
end

def selective_reverse (string)
    vowels = "aeiou"

    words = string.split(' ')
    new_sen = words.map do |word|
        if vowels.include?(word[0]) || vowels.include?(word[-1])
            word
        else 
            word.reverse
        end
    end
    new_sen.join(" ")
end

def hash_missing_keys(hash, *args)
    args.reject {|arg| hash.has_key?(arg)}
end