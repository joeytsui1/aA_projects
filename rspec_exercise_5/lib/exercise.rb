def zip (*arrs)
    (0...arrs[0].length).map {|i| arrs.map {|arr| arr[i]}}
end

def prizz_proc (arr, proc1, proc2)
    arr.select {|ele| (proc1.call(ele) || proc2.call(ele)) && !(proc1.call(ele) && proc2.call(ele))}
end

def zany_zip (*arrs)
    (0...arrs.map(&:length).max).map {|i| arrs.map {|arr| arr[i]}}
end

def maximum (arr, &proc)
    max = arr[0]
    arr.each do |ele|
        if proc.call(ele) >= proc.call(max)
            max = ele
        end
    end
    return max
end

def my_group_by (arr, &proc)
    new_hash = Hash.new {|hash, key| hash[key] = []} 

    arr.each do |ele|
        new_hash[proc.call(ele)] << ele
    end
    return new_hash
end

def max_tie_breaker (arr, proc, &blk)
    max = arr[0]
    arr.each do |ele|
        if blk.call(ele) > blk.call(max)
            max = ele
        elsif blk.call(ele) == blk.call(max)
            if proc.call(ele) > blk.call(max)
                max = ele
            end
        end
    end
    return max
end

def silly_syllables(sen)
    words = sen.split(" ")
    words.map {|word| remove_vowels(word)}.join(' ')
end

def remove_vowels(word)
    vowels = "aeiou"

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            word = word[0...i] + word[i+1..-1]
        end
    end
end

