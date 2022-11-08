def my_map(arr, &proc)
    new_arr = []
    arr.each {|ele| new_arr << proc.call(ele)}
    new_arr
end

def my_select(arr, &proc)
    new_arr = []
    arr.each do |ele|
        new_arr << ele if proc.call(ele)
    end
    new_arr
end

def my_count (arr, &proc)
    count = 0
    arr.each do |ele|
        count += 1 if proc.call(ele)
    end
    return count
end

def my_any?(arr, &proc)
    arr.each do |ele|
       return true if proc.call(ele)
    end
    return false
end

def my_all?(arr, &proc)
    arr.each do |ele|
        return false if !(proc.call(ele))
    end
    return true
end

def my_none?(arr, &proc)
    arr.each do |ele|
        return false if proc.call(ele)
    end
    return true
end