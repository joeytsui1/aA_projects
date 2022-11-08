def select_even_nums (arr)
    even_num = arr.select(&:even?)
end

def reject_puppies(arr)
    arr.reject {|hash| hash["age"] <= 2}
end

def count_positive_subarrays (arrays)
    arrays.count {|array| array.sum > 0}
end

def aba_translate (str)
    vowels = "aeiou"
    new_str = ""
    str.each_char.with_index do |char, i|
        if vowels.include?(char)
            new_str += str[i] + "b" + str[i]
        else
            new_str += str[i]
        end
    end
    return new_str
end

def aba_array (arr)
    new_words = arr.map {|word| aba_translate(word)}
end