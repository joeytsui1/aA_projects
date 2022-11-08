# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
def prime?(num)
    return false if num < 2

    (2...num).each do |i|
        return false if num % i == 0 
    end
    return true
end

def largest_prime_factor(num)
     num.downto(2) do |i|
         if num % i == 0 && prime?(i)
            return i
         end
    end
end

def unique_chars?(string)
    chars = Hash.new(0)

    string.each_char do |char|
         chars[char] += 1
    end

    chars.each do |key, value|
        if value > 1
            return false
        end
    end
    return true
end

def dupe_indices (arr)
    index_hash = Hash.new {|h, k| h[k] = []}

    arr.each_with_index do |ele, i|
        index_hash[ele] << i
    end
    index_hash.select {|ele, arr| arr.length > 1}
end

def ana_array (arr1, arr2)
    ana_hash = Hash.new(0)

    arr1.each do |ele|
        ana_hash[ele] += 1
    end

    arr2.each do |ele|
        ana_hash[ele] -= 1
    end

    ana_hash.each do |key, value|
        if value > 0 || value < 0
            return false
        end
    end
    return true
end