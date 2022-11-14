def element_count (arr)
    hash = Hash.new(0)

    arr.each do |ele|
        hash[ele] += 1
    end
    return hash
end

def char_replace! (str, hash)
    str.each_char.with_index do |char, i|
        if hash.has_key?(char)
            str[i] = hash[char]
        end
    end
    return str
end

# def product_inject (arr)
#     arr.inject(1) {|acc,ele| acc * ele}
# end

def product_inject (arr)
    arr.inject(1) do |acc, ele|
        acc * ele
    end
end