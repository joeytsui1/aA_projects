def zip (*arrs)
    new_arr = []
    (0..arrs[0].length-1).each do |i|
        i_arr = []
        arrs.each do |arr|
            i_arr << arr[i]
        end
        new_arr << i_arr
    end
    new_arr
end

def prizz_proc (arr, proc1, proc2)
    arr.select {|ele| (proc1.call(ele) || proc2.call(ele)) && !(proc1.call(ele) && proc2.call(ele))}
end

def zany_zip (*arrs)
    length = arrs.inject(0) do |acc, arr|
        acc = arr.length if arr.length > acc
        acc
    end

    new_arr = []
    (0...length).each do |i|
        i_arr = []
        arrs.each do |arr|
            i_arr << arr[i]
        end
        new_arr << i_arr
    end
    return new_arr
end

def maximum (arr, &blk)
    arr.inject(arr[0]) do |acc, ele| 
        acc = ele if blk.call(ele) >= blk.call(acc)
        acc
    end

end

def my_group_by (arr, &blk) 
    hash = Hash.new {|h, k| h[k] = []}

    arr.each do |ele|
        hash[blk.call(ele)] << ele
    end
    return hash
end

def max_tie_breaker (arr, proc, &blk)
    arr.inject(arr[0]) do |acc, ele|
        if blk.call(ele) > blk.call(acc)
            acc = ele
        elsif blk.call(ele) == blk.call(acc) && proc.call(ele) > proc.call(acc)
            acc = ele
        end
        acc
    end
end

def silly_syllables (sen)
    words = sen.split(' ')

    new_sen = words.map do |word|
        if word.length > 2
            change_word(word)
        else
            word
        end
    end
    new_sen.join(' ')
end

def change_word(word)
    vowels = "aeiou"
    arr = []

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            arr << i
        end
    end
    
    arr.length > 1 ? word[arr[0]..arr[-1]] : word
end