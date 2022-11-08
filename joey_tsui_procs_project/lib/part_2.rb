def reverser(string, &proc)
    proc.call(string.reverse)
end

def word_changer(string, &proc)
    
    new_sen = string.split(" ").map {|word| proc.call(word) }.join (' ')

end

def greater_proc_value(num, proc1, proc2)
    return proc1.call(num) > proc2.call(num) ? proc1.call(num) : proc2.call(num)
end

def and_selector (arr, proc1, proc2)
    arr.select {|ele| proc1.call(ele) && proc2.call(ele)}
end

def alternating_mapper(arr, proc1, proc2)
    arr.map.with_index  {|ele, i| i.even? ? proc1.call(ele) : proc2.call(ele)}
    
end