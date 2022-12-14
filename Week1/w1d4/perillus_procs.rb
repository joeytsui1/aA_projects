# def some?(arr, &proc)
#     arr.each do |ele|
#         return true if proc.call(ele)
#     end
#     return false
# end
# # p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
# # p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
# # p some?([8, 2]) { |n| n.even? }                                       # true
# # p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
# # p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
# # p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }  

# def exactly? (arr, n, &proc)
#     count = 0
#     arr.each do |ele|
#         if proc.call(ele)
#             count += 1
#         end
#     end
#     if count != n
#         return false
#     else return true
#     end
# end

# # p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
# # p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
# # p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
# # p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
# # p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
# # p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
# # p exactly?([4, 5], 3) { |n| n > 0 }                             # false
# # p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
# # p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true

# def filter_out(arr, &proc)
#     new_arr = []
#     arr.each do |ele|
#         if !proc.call(ele)
#             new_arr << ele
#         end
#     end
#     return new_arr
# end

# # p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# # p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# # p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# # p filter_out([1, 7, 3, 5 ]) { |x| x.even? } 

# def at_least? (arr, n, &proc)
#     count = 0
#     arr.each do |ele|
#         if proc.call(ele)
#             count += 1
#         end
#     end
#     count >= n
# end

# # p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # # false
# # p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # # false
# # p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# # # true
# # p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# # # true
# # p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # # true
# # p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # # false
# # p at_least?([false, false, false], 3) { |bool| bool }
# # # false
# # p at_least?([false, true, true], 3) { |bool| bool }
# # # false
# # p at_least?([true, true, true], 3) { |bool| bool }
# # # true
# # p at_least?([true, true, true, true], 3) { |bool| bool }
# # # true

# def every?(arr, &proc)
#     arr.each do |ele|
#         if !proc.call(ele)
#             return false
#         end
#     end
#     return true
# end

# # p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
# # p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
# # p every?([8, 2]) { |n| n.even? }                                        # true
# # p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
# # p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
# # p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true

# def at_most?(arr, n, &proc)
#     count = 0
#     arr.each {|ele| count += 1 if proc.call(ele)}
#     count <= n
# end

# # p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
# # p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
# # p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
# # p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
# # p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# # p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# # p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false


# def first_index(arr, &proc)
#     count = 0
#     arr.each_with_index do |ele, i|
#        return i if proc.call(ele)
#     end
#     return nil
# end

# # p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
# # p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
# # p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
# # p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
# # p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
# # p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil


# def xnor_select(arr, proc1, proc2)
#     arr.select do |ele|
#         if (proc1.call(ele) && proc2.call(ele)) || (!proc1.call(ele) && !proc2.call(ele))
#             ele
#         end
#     end
# end

# # is_even = Proc.new { |n| n % 2 == 0 }
# # is_odd = Proc.new { |n| n % 2 != 0 }
# # is_positive = Proc.new { |n| n > 0 }
# # p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# # p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# # p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]

# def filter_out!(arr, &proc) 
#   i = 0
  
#   while i < arr.length
#     if proc.call(arr[i])
#       arr.delete(arr[i])
#     else
#       i += 1
#     end
#   end
#   arr
# end

# # arr_1 = [10, 6, 3, 2, 5 ]
# # filter_out!(arr_1) { |x| x.odd? }
# # p arr_1     # [10, 6, 2]

# # arr_2 = [1, 7, 3, 5 ]
# # filter_out!(arr_2) { |x| x.odd? }
# # p arr_2     # []

# # arr_3 = [10, 6, 3, 2, 5 ]
# # filter_out!(arr_3) { |x| x.even? }
# # p arr_3     # [3, 5]

# # arr_4 = [1, 7, 3, 5 ]
# # filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# # p arr_4 # [1, 7, 3, 5]

# def multi_map(arr, n=1, &proc)
#   retArr = []

#   arr.each do |ele|
#     n.times { ele = proc.call(ele) }
#     retArr << ele
#   end
#   retArr
# end

# # p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# # p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# # p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# # p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# # p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# # p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]

# def proctition (arr, &proc)
#     arr.select {|ele| proc.call(ele)} + arr.select{|ele| !proc.call(ele)}
# end

# # p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # # [4, 7, 1, 3, -5, -10, -2]

# # p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # # [8, 6, 10, 7, 3]

# # p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # # ["boot", "bug", "boat", "cat", "dog"]

# def selected_map! (arr, proc1, proc2)
#     arr.each_with_index.map do |ele, i| # we will need index because we are changing the num in the original array
#         if proc1.call(ele)
#             arr[i] = proc2.call(ele)
#         else
#             ele
#         end
#     end
#     return nil
# end

# # is_even = Proc.new { |n| n.even? }
# # is_positive = Proc.new { |n| n > 0 }
# # square = Proc.new { |n| n * n }
# # flip_sign = Proc.new { |n| -n }

# # arr_1 = [8, 5, 10, 4]
# # p selected_map!(arr_1, is_even, square)     # nil
# # p arr_1                                     # [64, 5, 100, 16]

# # arr_2 = [-10, 4, 7, 6, -2, -9]
# # p selected_map!(arr_2, is_even, flip_sign)  # nil
# # p arr_2                                     # [10, -4, 7, -6, 2, -9]

# # arr_3 = [-10, 4, 7, 6, -2, -9]
# # p selected_map!(arr_3, is_positive, square) # nil
# # p arr_3 

# def chain_map(val, prcs)
#     prcs.inject(val) {|acc, prc| prc.call(acc)}
# end

# add_5 = Proc.new { |n| n + 5 }
# half = Proc.new { |n| n / 2.0 }
# square = Proc.new { |n| n * n }

# # p chain_map(25, [add_5, half])          # 15.0
# # p chain_map(25, [half, add_5])          # 17.5
# # p chain_map(25, [add_5, half, square])  # 225
# # p chain_map(4, [square, half])          # 8
# # p chain_map(4, [half, square])          # 4

# def proc_suffix(str, hash)
#     words = str.split(" ")
#     arr = []
    
#     words.each do |word|
#         new_word = word
#         hash.each do |key, v|
#             if key.call(word)
#                 new_word += v
#             end
#         end
#         arr << new_word
#     end
#     return arr.join(" ")
# end

# contains_a = Proc.new { |w| w.include?('a') }
# three_letters = Proc.new { |w| w.length == 3 }
# four_letters = Proc.new { |w| w.length == 4 }

# # p proc_suffix('dog cat',
# #     contains_a => 'ly',
# #     three_letters => 'o'
# # )   # "dogo catlyo"

# # p proc_suffix('dog cat',
# #     three_letters => 'o',
# #     contains_a => 'ly'
# # )   # "dogo catoly"

# # p proc_suffix('wrong glad cat',
# #     contains_a => 'ly',
# #     three_letters => 'o',
# #     four_letters => 'ing'
# # )   # "wrong gladlying catlyo"

# # p proc_suffix('food glad rant dog cat',
# #     four_letters => 'ing',
# #     contains_a => 'ly',
# #     three_letters => 'o'
# # )   # "fooding gladingly rantingly dogo catlyo"

# def proctition_platinum (arr, *prcs)
#     new_hash = {}

#     prcs.each_index {|i| new_hash[i+1] = []}

#     arr.each do |ele|
#         prcs.each_with_index do |prc, i|
#             if prc.call(ele)
#                 new_hash[i+1] << ele
#                 break
#             end
#         end
#     end
#     new_hash
# end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# begins_w = Proc.new { |s| s.downcase[0] == 'w' }

# # p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# # # {1=>["when!", "WHERE!"], 2=>["what"]}

# # p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# # # {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

# # p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# # # {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

# # p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# # # {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}

# def procipher(sen, hash)
#     words = sen.split(' ')
#     new_sen = []
#     words.each do |word|
#         new_word = word
#         hash.each do |key, v|
#             if key.call(word)
#                 new_word = v.call(new_word)
#             end
#         end
#         new_sen << new_word
#     end
#     new_sen.join(" ")
# end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }

# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# # p procipher('he said what!',
# #     is_yelled => make_question,
# #     contains_a => reverse
# # ) # "he dias ???!tahw"

# # p procipher('he said what!',
# #     contains_a => reverse,
# #     is_yelled => make_question
# # ) # "he dias !tahw???"

# # p procipher('he said what!',
# #     contains_a => reverse,
# #     is_yelled => add_smile
# # ) # "he dias !tahw:)"

# # p procipher('stop that taxi now',
# #     is_upcase => add_smile,
# #     is_yelled => reverse,
# #     contains_a => make_question
# # ) # "stop that??? taxi??? now"

# # p procipher('STOP that taxi now!',
# #     is_upcase => add_smile,
# #     is_yelled => reverse,
# #     contains_a => make_question
# # ) # "STOP:) that??? taxi??? !won"

# def picky_procipher(sen, hash)
#     words = sen.split(' ')

#     new_sen = words.map do |word|
#         true_arr = hash.keys.select {|prc| prc.call(word)} # This will select all the prc that got one or more true when passing each word
#         p true_arr
#         if true_arr.length >= 1 # we will check if word had any true when calling the prcs
#             hash[true_arr[0]].call(word) # if it had more thann 1 true, we will use the first prcs of that true_arr
#         else
#             word #else we are just returning the regular because the word didnt return any trues from all the prcs
#         end
#     end
#     return new_sen.join(" ") # return all the word that we mapped and joined the arr
# end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# p picky_procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias what!???"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => make_question
# ) # "he dias !tahw"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => add_smile
# ) # "he dias !tahw"

# p picky_procipher('stop that taxi now',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "stop that??? taxi??? now"

# p picky_procipher('STOP that taxi!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? !ixat"


def some? (arr, &blk)
    arr.each do |ele|
        if blk.call(ele)
            return true
        end
    end
    return false
end

# p some?([3, 1, 11, 5]) { |n| n.even? }                                # false
# p some?([3, 4, 11, 5]) { |n| n.even? }                                # true
# p some?([8, 2]) { |n| n.even? }                                       # true
# p some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' } # false
# p some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' } # true
# p some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }        # true


def exactly?(arr, n, &blk)
    count = 0
    arr.each do |ele|
        if blk.call(ele)
            count += 1
        end
    end
    count == n
end

# p exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }         # true
# p exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }         # false
# p exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }         # true
# p exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }  # true
# p exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }  # false
# p exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }  # true
# p exactly?([4, 5], 3) { |n| n > 0 }                             # false
# p exactly?([4, 5, 2], 3) { |n| n > 0 }                          # true
# p exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }                # true


def filter_out (arr, &blk)
    new_arr = []

    arr.each do |ele|
        if !blk.call(ele)
            new_arr << ele
        end
    end
    return new_arr
end

# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }      # [10, 6, 2]
# p filter_out([1, 7, 3, 5 ]) { |x| x.odd? }          # []
# p filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }     # [3, 5]
# p filter_out([1, 7, 3, 5 ]) { |x| x.even? }         # [1, 7, 3, 5]

def at_least? (arr, n, &blk)
    count = 0

    arr.each do |ele|
        if blk.call(ele)
            count += 1
        end
    end

    count >= n
end

# p at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }
# # false
# p at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # true
# p at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }
# # false
# p at_least?([false, false, false], 3) { |bool| bool }
# # false
# p at_least?([false, true, true], 3) { |bool| bool }
# # false
# p at_least?([true, true, true], 3) { |bool| bool }
# # true
# p at_least?([true, true, true, true], 3) { |bool| bool }
# # true

def every? (arr, &blk)
    arr.each do |ele|
        if !blk.call(ele)
            return false
        end
    end
    return true
end

# p every?([3, 1, 11, 5]) { |n| n.even? }                                 # false
# p every?([2, 4, 4, 8]) { |n| n.even? }                                  # true
# p every?([8, 2]) { |n| n.even? }                                        # true
# p every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }  # false
# p every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }   # false
# p every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }          # true

def at_most? (arr, n , &blk)
    count = 0

    arr.each do |ele|
        count += 1 if blk.call(ele)
    end

    count <= n
end

# p at_most?([-4, 100, -3], 1) { |el| el > 0 }                         # true
# p at_most?([-4, -100, -3], 1) { |el| el > 0 }                        # true
# p at_most?([4, 100, -3], 1) { |el| el > 0 }                          # false
# p at_most?([4, 100, 3], 1) { |el| el > 0 }                           # false
# p at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }    # true
# p at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }    # false


def first_index (arr, &blk)
    arr.each_with_index do |ele, i|
        if blk.call(ele)
            return i
        end
    end

    return nil
end

# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }           # 2
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } # 0
# p first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 } # nil
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }            # 0
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }        # 1
# p first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }            # nil

def xnor_select (arr, prc1, prc2)
    arr.select do |ele|
        if (prc1.call(ele) && prc2.call(ele)) || ( !prc1.call(ele) && !prc2.call(ele))
            ele
        end
    end
end

# is_even = Proc.new { |n| n % 2 == 0 }
# is_odd = Proc.new { |n| n % 2 != 0 }
# is_positive = Proc.new { |n| n > 0 }
# p xnor_select([8, 3, -4, -5], is_even, is_positive)         # [8, -5]
# p xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)  # [-7, -13, 12]
# p xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)   # [5, -10]

def filter_out! (arr, &blk)

    arr.each_with_index do |ele , i|
        if blk.call(ele)
            arr.delete(ele)
        end
    end
    return arr
end

# arr_1 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_1) { |x| x.odd? }
# p arr_1     # [10, 6, 2]

# arr_2 = [1, 7, 3, 5 ]
# filter_out!(arr_2) { |x| x.odd? }
# p arr_2     # []

# arr_3 = [10, 6, 3, 2, 5 ]
# filter_out!(arr_3) { |x| x.even? }
# p arr_3     # [3, 5]

# arr_4 = [1, 7, 3, 5 ]
# filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
# p arr_4 # [1, 7, 3, 5]

# def multi_map (arr, n=1, &blk)
#     arr.map do |ele|
#         n.times do 
#             ele = blk.call(ele)
#         end
#         ele
#     end
# end

def multi_map (arr, n=1, &blk)
    new_arr = []

    arr.each do |ele|
        n.times do 
            ele = blk.call(ele)
        end
        new_arr << ele
    end
    new_arr
end
# p multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}      # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}   # ["pretty!", "cool!", "huh?!"]
# p multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}   # ["pretty!!!", "cool!!!", "huh?!!!"]
# p multi_map([4, 3, 2, 7], 1) { |num| num * 10 }             # [40, 30, 20, 70]
# p multi_map([4, 3, 2, 7], 2) { |num| num * 10 }             # [400, 300, 200, 700]
# p multi_map([4, 3, 2, 7], 4) { |num| num * 10 }             # [40000, 30000, 20000, 70000]

def proctition (arr, &blk)
    arr.partition {|ele| blk.call(ele)}.flatten
end

# p proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }
# # [4, 7, 1, 3, -5, -10, -2]

# p proctition([7, 8, 3, 6, 10]) { |el| el.even? }
# # [8, 6, 10, 7, 3]

# p proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }
# # ["boot", "bug", "boat", "cat", "dog"]

def selected_map! (arr, prc1, prc2)
    arr.each_with_index.map do |ele,i|
        if prc1.call(ele)
            arr[i] = prc2.call(ele)
        else
            ele
        end
    end
    nil
end

# is_even = Proc.new { |n| n.even? }
# is_positive = Proc.new { |n| n > 0 }
# square = Proc.new { |n| n * n }
# flip_sign = Proc.new { |n| -n }

# arr_1 = [8, 5, 10, 4]
# p selected_map!(arr_1, is_even, square)     # nil
# p arr_1                                     # [64, 5, 100, 16]

# arr_2 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_2, is_even, flip_sign)  # nil
# p arr_2                                     # [10, -4, 7, -6, 2, -9]

# arr_3 = [-10, 4, 7, 6, -2, -9]
# p selected_map!(arr_3, is_positive, square) # nil
# p arr_3                                     # [-10, 16, 49, 36, -2, -9]

def chain_map (value, prcs)
    prcs.inject(value) {|acc, prc| acc = prc.call(acc)}
end

add_5 = Proc.new { |n| n + 5 }
half = Proc.new { |n| n / 2.0 }
square = Proc.new { |n| n * n }

# p chain_map(25, [add_5, half])          # 15.0
# p chain_map(25, [half, add_5])          # 17.5
# p chain_map(25, [add_5, half, square])  # 225
# p chain_map(4, [square, half])          # 8
# p chain_map(4, [half, square])          # 4

def proc_suffix (sen, hash)
    words = sen.split(' ')

    new_sen = []

    words.each_with_index do |word, i|
        new_word = word
        hash.each do |key,v|
            if key.call(word)
                new_word += v
            end
        end
        new_sen << new_word
    end
    new_sen.join(' ')
end

contains_a = Proc.new { |w| w.include?('a') }
three_letters = Proc.new { |w| w.length == 3 }
four_letters = Proc.new { |w| w.length == 4 }

p proc_suffix('dog cat',
    contains_a => 'ly',
    three_letters => 'o'
)   # "dogo catlyo"

p proc_suffix('dog cat',
    three_letters => 'o',
    contains_a => 'ly'
)   # "dogo catoly"

p proc_suffix('wrong glad cat',
    contains_a => 'ly',
    three_letters => 'o',
    four_letters => 'ing'
)   # "wrong gladlying catlyo"

p proc_suffix('food glad rant dog cat',
    four_letters => 'ing',
    contains_a => 'ly',
    three_letters => 'o'
)   # "fooding gladingly rantingly dogo catlyo"

# def proctition_platinum (arr, *procs)
#     hash = {}

#     procs.each_index {|i| hash[i+1] = []}
    
#     arr.each do |ele|
#         procs.each_with_index do |proc, i|
#             if proc.call(ele)
#                 hash[i+1] << ele
#                 break
#             end
#         end
#     end
#     return hash
# end

def proctition_platinum (arr, *prcs)
    new_hash = {}

    prcs.each_index {|i| new_hash[i+1] = []}

    arr.each do |ele|
        prcs.each_with_index do |prc, i|
            if prc.call(ele)
                new_hash[i+1] << ele
                break
            end
        end
    end
    new_hash
end

is_yelled = Proc.new { |s| s[-1] == '!' }
is_upcase = Proc.new { |s| s.upcase == s }
contains_a = Proc.new { |s| s.downcase.include?('a') }
begins_w = Proc.new { |s| s.downcase[0] == 'w' }

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, contains_a)
# {1=>["when!", "WHERE!"], 2=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_yelled, is_upcase, contains_a)
# {1=>["when!", "WHERE!"], 2=>["WHO", "WHY"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], is_upcase, is_yelled, contains_a)
# {1=>["WHO", "WHERE!", "WHY"], 2=>["when!"], 3=>["what"]}

p proctition_platinum(['WHO', 'what', 'when!', 'WHERE!', 'how', 'WHY'], begins_w, is_upcase, is_yelled, contains_a)
# {1=>["WHO", "what", "when!", "WHERE!", "WHY"], 2=>[], 3=>[], 4=>[]}

def procipher (sen, hash)
    new_sen = []

    words = sen.split(" ")

    words.each do |word|
        new_word = word
        hash.each do |key, v|
            if key.call(word)
                new_word = v.call(new_word)
            end
        end
        new_sen << new_word
    end
    return new_sen.join (" ")
end

# is_yelled = Proc.new { |s| s[-1] == '!' }
# is_upcase = Proc.new { |s| s.upcase == s }
# contains_a = Proc.new { |s| s.downcase.include?('a') }
# make_question = Proc.new { |s| s + '???' }
# reverse = Proc.new { |s| s.reverse }
# add_smile = Proc.new { |s| s + ':)' }

# p procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias ???!tahw"

def picky_procipher (sen, hash)
    words = sen.split(" ")

    new_sen = []

    words.each do |word|
        new_word = word
        hash.each do |key, v|
            if key.call(word)
                new_word = v.call(word)
                break
            end
        end
        new_sen << new_word
    end
    return new_sen.join(" ")
end

# p picky_procipher('he said what!',
#     is_yelled => make_question,
#     contains_a => reverse
# ) # "he dias what!???"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => make_question
# ) # "he dias !tahw"

# p picky_procipher('he said what!',
#     contains_a => reverse,
#     is_yelled => add_smile
# ) # "he dias !tahw"

# p picky_procipher('stop that taxi now',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "stop that??? taxi??? now"

# p picky_procipher('STOP that taxi!',
#     is_upcase => add_smile,
#     is_yelled => reverse,
#     contains_a => make_question
# ) # "STOP:) that??? !ixat"
