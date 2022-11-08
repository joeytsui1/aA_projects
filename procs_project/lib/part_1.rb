def my_map(arr, &proc)
    new_arr = []
    arr.each do |ele|
        new_arr << proc.call(ele)
    end
    new_arr
end

def my_select(arr, &proc)
    new_arr = []
    arr.each do |ele|
        if proc.call(ele)
            new_arr << ele
        end
    end
    new_arr
end

def my_count (arr, &proc)
    count = 0
    arr.each do |ele|
        if proc.call(ele)
            count += 1
        end
    end
    return count
end

def my_any?(arr, &proc)
    arr.each do |ele|
        if proc.call(ele)
            return true
        end
    end
    return false
end

def my_all?(arr, &proc)
    arr.each do |ele|
        if !(proc.call(ele))
            return false
        end
    end
    return true
end

def my_none?(arr, &proc)
    arr.each do |ele|
        if proc.call(ele)
            return false
        end
    end
    return true
end