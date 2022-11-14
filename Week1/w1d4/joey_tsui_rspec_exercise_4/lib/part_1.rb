def my_reject (arr, &blk)
    new_arr = []

    arr.each do |ele|
        if !blk.call(ele)
            new_arr << ele
        end
    end
    return new_arr
end

def my_one? (arr, &blk)
    count = 0
    arr.each do |ele|
        if blk.call(ele)
            count += 1
        end
    end
    count == 1
end

def hash_select (hash, &blk)
    new_hash = Hash.new(0)

    hash.each do |k,v|
        if blk.call(k, v)
            new_hash[k] = v
        end
    end
    return new_hash
end

def xor_select (arr, proc1,proc2)
    arr.select {|ele| (proc1.call(ele) ||proc2.call(ele)) && !(proc1.call(ele) && proc2.call(ele))}
end

def proc_count (ele, procs)
    procs.count {|proc| proc.call(ele)}
end

