def average(num1, num2)
    (num1 + num2)/ 2.0
end

def average_array(array)
    sum = array.sum
    average = sum / array.length.to_f
end

def repeat(str, num)
    str*num
end

def yell(str)
    str = str.upcase + "!"
end

def alternating_case(str)
    words = str.split(" ")
  
    # words.each_with_index do |word, i|
    #     if i.even?
    #         word = word.upcase!
    #     else
    #         word = word.downcase!
    #     end
    # end
    # return words.join(" ")
    # new_sen.each_with_index.map { |ele, i| (i % 2).zero? ? ele.upcase : ele.downcase }.join(' ')
    
    words.each_with_index.map {|ele, i| i.even? ? ele.upcase : ele.downcase}.join(' ')
end
