def select_even_nums (arr)
    arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays (arrays)
    arrays.count {|array| array.sum.positive?}
end

def aba_translate (str)
    vowels = "aeiou"
    new_str = ""
    str.each_char do |char|
        if vowels.include?(char)
            new_str += char + "b" + char
        else
            new_str += char
        end
    end
    return new_str
end

def aba_array (arr)
    new_words = arr.map {|word| aba_translate(word)}
end

