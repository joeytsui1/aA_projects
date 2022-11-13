def proper_factors (num)
    (1...num).select {|i| num % i == 0}
end

def aliquot_sum(num)
    proper_factors(num).sum
end

def perfect_number? (num)
    num == aliquot_sum(num)
end

def ideal_numbers(num)
    arr = []
    i = 1
    while arr.length < num
        if perfect_number?(i)
            arr << i
        end
        i += 1
    end
    return arr
end
