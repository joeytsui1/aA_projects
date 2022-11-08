def reverser(string, &proc)
    proc.call(string.reverse)
end

def word_changer(string, &proc)
    words = string.split(' ')
    new_sen = words.map {|word| proc.call(word) }
    new_sen.join(' ')
end

def greater_proc_value(num, proc1, proc2)
    if proc1.call(num) > proc2.call(num)
        return proc1.call(num)
    else
        return proc2.call(num)
    end
end

def and_selector (arr, proc1, proc2)
    arr.select {|ele| proc1.call(ele) && proc2.call(ele)}
end

def alternating_mapper(arr, proc1, proc2)
    arr.map.with_index do |ele, i|
        if i.even?
            proc1.call(ele)
        else
            proc2.call(ele)
        end
    end
end