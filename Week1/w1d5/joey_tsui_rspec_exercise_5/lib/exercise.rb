def zip (*arrs)
    new_arr = []

    (0..arrs[0].length-1).each do |i|
        inner_arr = []
        arrs.each do |arr|
            inner_arr << arr[i]
        end
        new_arr << inner_arr
    end
    return new_arr
end

def prizz_proc (arr, prc1, prc2)
    arr.select {|ele| (prc1.call(ele) || prc2.call(ele)) && !(prc1.call(ele) && prc2.call(ele))}
end

def zany_zip (*arrs)
    length = arrs.inject(0) do |acc, arr|
        if arr.length > acc
            acc = arr.length
        end
        acc
    end
    new_arr = []
    (0..length-1).each do |i|
        inner_arr = []
        arrs.each do |arr|
            inner_arr << arr[i]
        end
        new_arr << inner_arr
    end
    return new_arr
end

def maximum (arr, &blk)
    arr.inject(arr[0]) do |acc, ele|
        if blk.call(ele) >= blk.call(acc)
            acc = ele
        end
        acc
    end
end

def my_group_by (arr, &blk)
    hash = Hash.new {|h,k| h[k] = []}

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
