require "byebug"
def strange_sums(arr)
    count = 0
    arr.each_with_index do |ele1, i|
        arr[i+1..-1].each do |ele2|
            if ele1 + ele2 === 0 
                count += 1
            end
        end
    end
    return count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product (nums, prod)

    nums.each_with_index do |num1, i|
        nums[i+1..-1].each do |num2|
            if num1 * num2 == prod
                return true
            end
        end
    end
    return false
end

def pair_product(arr, num)
    divHash = Hash.new(0) # { 2:8}

    arr.each do |ele|
        divHash[num / ele] = ele
    end
    arr.each do |ele|
        if ele * divHash[ele] == num && divHash[ele] != ele
            return true
        end
    end
    return false
end

# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)

def rampant_repeats(string, hash)
    new_str = ""
    string.each_char do |char|
        hash.key?(char) ? new_str += char*hash[char] : new_str += char
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square(num)
    return true if num == 1

    (2..num).each do |i|
        if i * i == num
            return true
        end
    end
    return false
end

def perfect_square(num)
    (1..num).any? {|i| i * i === num}
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def divisor_counter (num)
    count = 0
    (1..num).each do |i|
        if num % i ==0 
            count += 1
        end
    end
    return count
end

def anti_prime?(num)
    (1...num).each do |i|
        if divisor_counter(num) < divisor_counter(i)
            return false
        end
    end
    return true
end

def divisor_counter (num)
    (1..num).count {|i| num % i == 0}
end

def anti_prime?(num)
    (1...num).all? {|i| divisor_counter(num) > divisor_counter(i)}
end
# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition(m1, m2)
    new_max = Array.new(m1.length) {Array.new(m1[0].length)}

    m1.each_with_index do |subArr, i|
        m1[i].each_with_index do |ele, j|
            new_max[i][j] = m1[i][j] + m2[i][j]
        end
    end
    return new_max
end

# def matrix_addition(max1, max2)
#     height = max1.length
#     width = max1[0].length
#     new_max = Array.new(height) {[0]*width}

#     (0...height).each do |row|
#         (0...width).each do |col|
#             new_max[row][col] = max1[row][col] + max2[row][col]
#         end
#     end
#     new_max
# end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

# def mutual_factors(*nums)
#     (1..nums.min).select {|i| nums.all? {|ele| (ele % i).zero? }}
# end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

# def tribonacci_number (n)
#     if n < 1
#         return 0
#     elsif n == 1
#         return 1
#     end

#     return tribonacci_number(n-3) + tribonacci_number(n-2) + tribonacci_number(n-1)
# end

# def tribonacci_number(n)
#     seq = [1,1,2]

#     while n >= seq.length
#         seq << seq[-1] + seq[-2] + seq[-3]
#     end
#     seq[n-1]
# end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274

# def matrix_addition_reloaded(*matrices)
#     length = matrices[0].length
#     if matrices.any? {|matrix| matrix.length != length}
#         return nil
#     end

#     ret_matrix = matrices[0]
#     matrices[1..-1].each do |matrix|
#         ret_matrix = matrix_addition(ret_matrix, matrix)
#     end
#     return ret_matrix
# end

# matrix_a = [[2,5], [4,7]]
# matrix_b = [[9,1], [3,0]]
# matrix_c = [[-1,0], [0,-1]]
# matrix_d = [[2, -5], [7, 10], [0, 1]]
# matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition_reloaded(matrix_a, matrix_b)              # [[11, 6], [7, 7]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)    # [[10, 6], [7, 6]]
# p matrix_addition_reloaded(matrix_e)                        # [[0, 0], [12, 4], [6, 3]]
# p matrix_addition_reloaded(matrix_d, matrix_e)              # [[2, -5], [19, 14], [6, 4]]
# p matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)    # nil
# p matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)    # nil

# def squarocol?(matrix)
#     matrix.each do |row|
#         if row.all? {|ele| ele == row[0]}
#             return true
#         end
#         else row.each do |col| 
#             if col.all? {|ele| == col[0]}
#             return true
#             end
#         end
#     end
#     return false
# end

# def squarocol?(sqmatrix)
#     sqmatrix.each do |row|
#         return true if row.all?{|ele| ele == row[0]}
#     end

#     count = 1
#     sqmatrix[0].each_with_index do |ele, i|
#         sqmatrix[1..-1].each do |row|
#             count += 1 if row[i] == ele
#         end
#         return true if count == sqmatrix.length
#         count = 1
#     end
#     return false
# end

def squarocol? (matrix)
    
    matrix.each do |row|
        return true if row.all?{|ele| ele == row[0]}
    end

    column = matrix.transpose()

    column.each do |row|
        return true if row.all? {|ele| ele == row[0]}
    end

    return false
end

p squarocol?([
    [:a, :x , :d],
    [:b, :x , :e],
    [:c, :x , :f],
]) # true

p squarocol?([
    [:x, :y, :x],
    [:x, :z, :x],
    [:o, :o, :o],
]) # true

p squarocol?([
    [:o, :x , :o],
    [:x, :o , :x],
    [:o, :x , :o],
]) # false

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 7],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # true

p squarocol?([
    [1, 2, 2, 7],
    [1, 6, 6, 0],
    [0, 5, 2, 7],
    [4, 2, 9, 7],
]) # false

# def squaragonal? (matrix)
#     matrix.each_with_index do |row, i|
#         row.each_with_index do |ele, j|
#             if row[j].all? {|ele| ele == matrix[0][0]}
#                 return true
#             end
#         end
#     end

#     # matrix.each_with_index do |row, i|
#     #     row.reverse.each_with_index do |col, j|
#     #         if i == j && matrix[0][0] != matrix[i][j]
#     #             return false
#     #         end
#     #     end
#     # end


#     return false
# end

def squaragonal? (matrix)
    left_D = []
    right_D = []

    matrix.each_with_index do |row, i|
        matrix[i].each_with_index do |col, j|
            left_D = (0..matrix[1].length-1).map {|i| matrix[i][i]}
            right_D = (0..matrix[1].length-1).map {|i| matrix[i][-i-1]}
        end
    end

    if left_D.all? {|ele| ele == left_D[0]} || right_D.all? {|ele| ele == right_D[0]}
        return true
    end
    return false
end

# p squaragonal?([
#     [1, 2, 2, 7],
#     [1, 1, 6, 7],
#     [0, 5, 1, 7],
#     [4, 2, 9, 1],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :x, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [:x, :y, :o],
#     [:x, :o, :x],
#     [:o, :o, :x],
# ]) # true

# p squaragonal?([
#     [1, 2, 2, 5],
#     [1, 6, 5, 0],
#     [0, 2, 2, 7],
#     [5, 2, 9, 7],
# ]) # false


def pascals_triangle(n)
    return [] if n <= 0
    return [[1]] if n == 1

    pascals = [[1], [1,1]]

    while pascals.length < n
        next_level = make_level(pascals[-1])
        pascals << next_level
    end
    return pascals
end

def make_level(arr)
    new_arr = [1]
    arr.each_with_index do |ele, i|
        if i != arr.length-1
            new_arr << arr[i] + arr[i+1]
        end
    end
    new_arr << 1

    new_arr
end

# def pascals_triangle(n)
#     return [[1]] if n == 1
#     return [[1, 1]] if n == 2

#     top = [[1], [1, 1]]

#     (2...n).each do |i|
#         top << pascal_leveler(top[-1])
#     end

#     top
# end

# def pascal_leveler(arr)
#     retArr = []
#     retArr << arr[0]

#     arr[0...-1].each_with_index do |ele, i|
#         retArr << arr[i] + arr[i + 1]
#     end

#     retArr << arr[-1]

#     retArr
# end


# p pascals_triangle(5)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1]
# ]

# p pascals_triangle(7)
# [
#     [1],
#     [1, 1],
#     [1, 2, 1],
#     [1, 3, 3, 1],
#     [1, 4, 6, 4, 1],
#     [1, 5, 10, 10, 5, 1],
#     [1, 6, 15, 20, 15, 6, 1]
# ]

def prime(num)
    return false if num < 2
    (2...num).each do |i|
        if num % i == 0
            return false
        end
    end
    return true
end


# def mersenne(num)
#     (1..num).each do |i|
#         if prime(i) && num == (2**i)-1
#             return true
#         end
#     end
#     return false
# end

# def mersenne_prime(num)
#     count = 0

#     (1..Float::INFINITY).each do |i|
#         if mersenne(i)
#             count += 1
#             if count == num
#                 return i
#             end
#         end
#     end
# end

def mersenne_prime(num)
    x = 0
    count = 0
    while count < num
        x += 1
        count += 1 if prime(2**x-1)
    end
    2**x-1
end

# p mersenne_prime(1) # 3
# p mersenne_prime(2) # 7
# p mersenne_prime(3) # 31
# p mersenne_prime(4) # 127
# p mersenne_prime(6) # 131071

def tri_numbers (num)

    i = 1
    while i < num
        if num == (i * (i + 1)) / 2
            return true
        end
        i += 1
    end
    return false
end

def triangular_word? (string)
    alpha = ("a".."z").map {|letter| letter}

    chars = string.split('')
    string_sum = chars.inject(0) {|acc, char| acc + (alpha.index(char) + 1)}

    tri_arr = tri_numbers(string_sum)
end

# p triangular_word?('abc')       # true
# p triangular_word?('ba')        # true
# p triangular_word?('lovely')    # true
# p triangular_word?('question')  # true
# p triangular_word?('aa')        # false
# p triangular_word?('cd')        # false
# p triangular_word?('cat')       # false
# p triangular_word?('sink')      # false

def consecutive_collapse(arr)
    return arr if arr.length == 1
    switch = true

    while switch
        switch = false

        (0...arr.length-1).each do |i|
            if (arr[i] - arr[i+1]).abs == 1
                arr = arr[0...i] + arr[i+2..-1]
                consecutive_collapse(arr)
                switch = true
            end
        end
    end
    return arr
end


# p consecutive_collapse([4, 3, 1])                     # [1]
# p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
# p consecutive_collapse([9, 8, 2])                     # [2]
# p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
# p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
# p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
# p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
# p consecutive_collapse([13, 11, 12, 12])

# (0...arr[-1]).each do |i|
#     if (arr[i] - (arr[i+1])).abs() == 1
#         arr.delete(arr[i])
#     end
# end

# p arr

def pretentious_primes (arr, count)
    count.positive? ? arr.map {|ele| next_larger_prime(ele, count)} : arr.map {|ele| next_smallest_prime(ele, count)}
end

def next_larger_prime(num, count)
    counter = 0
    (num+1..Float::INFINITY).each do |i|
        if prime(i) 
            counter += 1
            if counter == count
                return i
            end
        end
    end
end

def next_smallest_prime(num, count)
    counter = 0
    (num - 1).downto(0).each do |i|
        if prime(i)
            counter += 1
            if counter == count.abs
                return i
            end
        elsif i < 2
            return nil
        end
    end
end

# p pretentious_primes([4, 15, 7], 1)           # [5, 17, 11]
# p pretentious_primes([4, 15, 7], 2)           # [7, 19, 13]
# p pretentious_primes([12, 11, 14, 15, 7], 1)  # [13, 13, 17, 17, 11]
# p pretentious_primes([12, 11, 14, 15, 7], 3)  # [19, 19, 23, 23, 17]
# p pretentious_primes([4, 15, 7], -1)          # [3, 13, 5]
# p pretentious_primes([4, 15, 7], -2)          # [2, 11, 3]
# p pretentious_primes([2, 11, 21], -1)         # [nil, 7, 19]
# p pretentious_primes([32, 5, 11], -3)         # [23, nil, 3]
# p pretentious_primes([32, 5, 11], -4)         # [19, nil, 2]
# p pretentious_primes([32, 5, 11], -5)         # [17, nil, nil]

def strange_sums (nums)
    count = 0

    (0..nums.length-1).each do |i|
        (i+1..nums.length-1).each do |j|
            if nums[i] + nums[j] == 0
                count += 1
            end
        end
    end
    return count
end

# p strange_sums([2, -3, 3, 4, -2])     # 2
# p strange_sums([42, 3, -1, -42])      # 1
# p strange_sums([-5, 5])               # 1
# p strange_sums([19, 6, -3, -20])      # 0
# p strange_sums([9])                   # 0

def pair_product (nums, prod)
    (0..nums.length-1).each do |i|
        (i+1..nums.length-1).each do |j|
            if nums[i] * nums[j] == prod
                return true
            end
        end
    end
    return false
end
p "========="
# p pair_product([4, 2, 5, 8], 16)    # true
# p pair_product([8, 1, 9, 3], 8)     # true
# p pair_product([3, 4], 12)          # true
# p pair_product([3, 4, 6, 2, 5], 12) # true
# p pair_product([4, 2, 5, 7], 16)    # false
# p pair_product([8, 4, 9, 3], 8)     # false
# p pair_product([3], 12)             # false

def rampant_repeats (str, hash)
    new_str = ""

    str.each_char do |char| 
        if hash.has_key?(char)
            hash[char].times {new_str += char}
        else
            new_str += char
        end
    end
    new_str
end

# p rampant_repeats('taco', {'a'=>3, 'c'=>2})             # 'taaacco'
# p rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3}) # 'ffffeeveerisssh'
# p rampant_repeats('misispi', {'s'=>2, 'p'=>2})          # 'mississppi'
# p rampant_repeats('faarm', {'e'=>3, 'a'=>2})            # 'faaaarm'

def perfect_square? (num)
    (0...num).each do |i|
        if i * i == num
            return true
        end
    end
    return false
end

# p perfect_square(1)     # true
# p perfect_square(4)     # true
# p perfect_square(64)    # true
# p perfect_square(100)   # true
# p perfect_square(169)   # true
# p perfect_square(2)     # false
# p perfect_square(40)    # false
# p perfect_square(32)    # false
# p perfect_square(50)    # false

def anti_prime? (num)
    (1...num).none? {|i| factors(i) > factors(num)}
end

def factors (num)
    (1...num).count {|i| num % i == 0}
end

# p anti_prime?(24)   # true
# p anti_prime?(36)   # true
# p anti_prime?(48)   # true
# p anti_prime?(360)  # true
# p anti_prime?(1260) # true
# p anti_prime?(27)   # false
# p anti_prime?(5)    # false
# p anti_prime?(100)  # false
# p anti_prime?(136)  # false
# p anti_prime?(1024) # false

def matrix_addition (m1, m2)
    new_m = Array.new(m1.length) {Array.new()}

    (0..m1.length-1).each do |i|
        (0..m1[0].length-1).each do |j|
            new_m[i][j] = m1[i][j] + m2[i][j]
        end
    end
    return new_m
end

matrix_a = [[2,5], [4,7]]
matrix_b = [[9,1], [3,0]]
matrix_c = [[-1,0], [0,-1]]
matrix_d = [[2, -5], [7, 10], [0, 1]]
matrix_e = [[0 , 0], [12, 4], [6,  3]]

# p matrix_addition(matrix_a, matrix_b) # [[11, 6], [7, 7]]
# p matrix_addition(matrix_a, matrix_c) # [[1, 5], [4, 6]]
# p matrix_addition(matrix_b, matrix_c) # [[8, 1], [3, -1]]
# p matrix_addition(matrix_d, matrix_e) # [[2, -5], [19, 14], [6, 4]]

def mutual_factors (*nums)
    (1..nums.min).select {|i| nums.all? {|num| num % i == 0}} 
end

# p mutual_factors(50, 30)            # [1, 2, 5, 10]
# p mutual_factors(50, 30, 45, 105)   # [1, 5]
# p mutual_factors(8, 4)              # [1, 2, 4]
# p mutual_factors(8, 4, 10)          # [1, 2]
# p mutual_factors(12, 24)            # [1, 2, 3, 4, 6, 12]
# p mutual_factors(12, 24, 64)        # [1, 2, 4]
# p mutual_factors(22, 44)            # [1, 2, 11, 22]
# p mutual_factors(22, 44, 11)        # [1, 11]
# p mutual_factors(7)                 # [1, 7]
# p mutual_factors(7, 9)              # [1]

def tribonacci_number (num)
    seq = [1,1,2]

    while seq.length < num
        seq << seq[-3] + seq[-2] + seq[-1]
    end
    return seq[num-1]
end

# p tribonacci_number(1)  # 1
# p tribonacci_number(2)  # 1
# p tribonacci_number(3)  # 2
# p tribonacci_number(4)  # 4
# p tribonacci_number(5)  # 7
# p tribonacci_number(6)  # 13
# p tribonacci_number(7)  # 24
# p tribonacci_number(11) # 274


def matrix_addition (m1, m2)
    new_matrix = Array.new (m1.length) {Array.new()}

    (0..m1.length-1).each do |i|
        (0..m1[0].length-1).each do |j|
            new_matrix[i][j] = m1[i][j] + m2[i][j]
        end
    end
    return new_matrix
end