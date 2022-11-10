def my_reject(arr, &proc)
    arr.select {|ele| !proc.call(ele)}
end

def my_one?(arr, &proc)
    return (arr.count {|ele| proc.call(ele)}) == 1
    
end

def hash_select(hash, &proc)
    new_hash = Hash.new(0)
    hash.each do |key, value|
        if proc.call(key, value)
            new_hash[key] = value
        end
    end
    return new_hash
end

def xor_select(arr, proc1, proc2)
    arr.select {|ele| (proc1.call(ele) || proc2.call(ele)) && !(proc1.call(ele) && proc2.call(ele))}
end

def proc_count (val, proc_arr)
    proc_arr.count {|proc| proc.call(val)}
end

