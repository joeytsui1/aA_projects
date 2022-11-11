def zip (*arrs)
    new_arr = []

    arrs[0].each_with_index do |arr, i|
        inner_arr = []
        arrs.each {|arr| inner_arr << arr[i]}
        new_arr << inner_arr
    end
    return new_arr
    # (0...arrs[0].length).map {|i| arrs.map {|arr| arr[i]}}
end

def prizz_proc (arr, proc1, proc2)
    arr.select {|ele| (proc1.call(ele) || proc2.call(ele)) && !(proc1.call(ele) && proc2.call(ele))}
end

# def zany_zip (*arrs)
#     (0...arrs.map(&:length).max).map {|i| arrs.map {|arr| arr[i]}}
# end

def zany_zip(*arrs)
    length = arrs.inject(0) do |acc, arr|
        if arr.length > acc
            acc = arr.length
        end
        acc
    end

    new_arr = []
    (0...length).each do |i|
        inner_arr = []
        arrs.each do |arr|
        inner_arr << arr[i]
        end
        new_arr << inner_arr
    end
    return new_arr
end

# def maximum (arr, &proc)
#     max = arr[0]
#     arr.each do |ele|
#         if proc.call(ele) >= proc.call(max)
#             max = ele
#         end
#     end
#     return max
# end

def maximum (arr, &proc)
    arr.inject(arr.first) do |acc, ele|
        if proc.call(ele) >= proc.call(acc)
            acc = ele
        end
        acc
    end
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

def silly_syllables(sentence)
    words = sentence.split(' ')
    new_sen = [] 
    words.each do |word|
        first_index = vowels_finder(word)[0]  
        last_index = vowels_finder(word)[-1]
        if first_index == last_index
            new_sen << word
        else 
            new_sen << word[first_index ..last_index]
        end 
    end 
    return new_sen.join(' ')        
end 

    
def vowels_finder(word)
    vowels = 'aeiou'
    arr = [] 
    word.each_char.with_index do |char, i|  
        if vowels.include?(char)
            arr << i
        end 
    end 
    arr 
end 
