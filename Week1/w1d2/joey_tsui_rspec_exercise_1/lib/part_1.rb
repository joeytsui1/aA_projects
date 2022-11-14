def average (num1, num2)
    return (num1 + num2) / 2.0
end

def average_array (arr)
    return arr.sum / arr.length.to_f
end

def repeat (str, n)
    return str*n
end

def yell (str)
    return str.upcase + "!"
end

def alternating_case (srt)
    words = srt.split(' ')

    words.each_with_index.map {|word, i| i.even? ? word.upcase : word.downcase}.join(" ")
end