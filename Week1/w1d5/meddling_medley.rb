def duos (str)
    (0...str.length).count {|i| str[i] == str[i+1] }
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap (sen, hash)
    words = sen.split(' ')
    new_sen = words.map {|word| hash.has_key?(word) ? hash[word] : word}.join(' ')
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped (hash, proc, &blk)
    new_hash = Hash.new {|hash, key| hash[key] = []}

    hash.each do |key, value|
        new_hash[blk.call(key)] = proc.call(value)
    end
    return new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}


def counted_characters (string)
    hash = Hash.new(0)
    new_arr = []
    string.each_char {|char| hash[char] += 1}

    hash.map do |key, value|
        if value > 2
            new_arr << key
        end
    end
    return new_arr
end

# def counted_characters (string)
#     hash = Hash.new(0)
#     string.each_char {|char| hash[char] += 1}
#     hash.keys.select {|key| hash[key] > 2}
# end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true (str)
    (0...str.length).any? {|i| str[i] == str[i+1] && str[i] == str[i+2]}
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(str, hash)
    new_str = ''
    str.each_char do |char|
        if hash.has_key?(char)
            new_str += hash[char]
        elsif char == " "
            new_str += " "
        else
            new_str += "?"
        end
    end
    return new_str
end

p energetic_encoding('sent sea',
    'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
) # 'zimp ziu'

p energetic_encoding('cat',
    'a'=>'o', 'c'=>'k'
) # 'ko?'

p energetic_encoding('hello world',
    'o'=>'i', 'l'=>'r', 'e'=>'a'
) # '?arri ?i?r?'

p energetic_encoding('bike', {}) # '????']

def uncompress(str)
    new_str = ""
    str.each_char.with_index do |char, i|
        num = (str[i+1]).to_i
        num.times do 
            new_str += char
        end
    end
    new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select (arr, *procs)
    arr.select {|ele| procs.all? {|proc| proc.call(ele)} }
end

# is_positive = Proc.new { |n| n > 0 }
# is_odd = Proc.new { |n| n.odd? }
# less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(str)
  vowels = 'aeiou'
  words = str.split(' ')

  words.map do |word|
    if word.length >= 3
      if vowels.include?(word[0].downcase)
        word + 'yay'
      else
        vowel_index = vowel_finder(word)
        if word[0] == word[0].upcase
          (word[vowel_index..-1] + word[0..vowel_index] + 'ay').capitalize 
        else
          word[vowel_index..-1] + word[0..vowel_index] + 'ay' 
        end
      end
    else
      word
    end
  end.join(' ')
end

def vowel_finder(word) # => return index of the first vowel
  vowels = 'aeiou'
  word.each_char.with_index do |char, i|
    return i if vowels.include?(char)
  end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate (sen)
    words = sen.split(" ")

    new_sen = words.map do |word|
        if word.length < 3
            word
        else
            change_word!(word)
        end
    end
    new_sen.join(" ")
end



def change_word! (word)
    vowels = "aieou"
    last_vowel_idx = 0

    if vowels.include?(word[-1])
        return word = word + word.downcase
    end

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            last_vowel_idx = i
        end
    end
    return word = word + word[last_vowel_idx..-1]
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"


def disjunct_select (arr, *procs)
    arr.select {|ele| procs.any? {|proc| proc.call(ele)}}
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

# def alternating_vowel(sen)
#     words = sen.split(' ')

#     new_sen = words.map.with_index do |word, i|
#         first_index = find_index(word)
#         last_index = word.length-1 - find_index(word.reverse)
#         if find_index(word) != nil
#             if i % 2 == 0 
#                 word[0...first_index] + word[first_index+1 .. -1]
#             else
#                 word[0...last_index] + word[last_index+1..-1]
#             end
#         else
#             word
#         end
#     end
#     new_sen.join(' ')
# end

# def find_index(word)
#     vowels = "aeiou"
#     word.each_char.with_index do |char, i|
#         if vowels.include?(char)
#             return i
#         end
#     end
# end

def alternating_vowel(sent)
  sentArr = sent.split(' ')

  sentArr.each_with_index do |word, i|
    if i % 2 == 0 
      sentArr[i] = first_vowel_remove(word)
    else
      sentArr[i] = last_vowel_remove(word)
    end
  end
  sentArr.join(" ")
end

def first_vowel_remove(word)
  vowels = 'aeiou'

  word.each_char.with_index do |char, i|
    return word[0...i] + word[i + 1..-1] if vowels.include?(char.downcase)
  end

  word
end

def last_vowel_remove(word)
  vowels = 'aeiou'

  word.reverse!.each_char.with_index do |char, i|
    if vowels.include?(char.downcase)
      return (word[0...i] + word[i + 1..-1]).reverse
    end
  end 
  word
end



# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk (str)
    vowels = "aeiou"
    words = str.split(' ')

    new_sen = words.map do |word|
        if vowels.include?(word[-1])
            word + word[-1]
        else
            helper(word)
        end
    end
    new_sen.join(' ')
end

def helper(word)
    vowels = "aeiou"
    new_str = ""
    word.each_char.with_index do |char, i|
        if vowels.include?(char.downcase)
            new_str += char + "b"+ char.downcase
        else
            new_str += char
        end
    end
    return new_str
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress (str)
    hash = {}
    new_str = ""
    count = 0

    str.each_char.with_index do |char,i|
        if str[i] == str[i+1]
            count += 1
        else
            hash[char] = count
            count = 0
        end
    end

    hash.each do |key, v|
        if v == 1
            new_str += key
        else
             new_str += key
            new_str += v.to_s
        end

    end
    return new_str
end

# p compress('aabbbbc')   # "a2b4c"
# p compress('boot')      # "bo2t"
# p compress('xxxyxxzzzz')# "x3yx2z4"

def duos (str)
    (0...str.length-1).count {|i| str[i] == str[i+1]}
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap (sen, hash)
    words = sen.split(" ")

    new_sen = words.map do |word|
        if hash.has_key?(word)
            hash[word]
        else
            word
        end
    end
    return new_sen.join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'

def hash_mapped (hash, proc, &blk)
    new_hash = {}

    hash.each do |key, v|
        new_hash[blk.call(key)] = proc.call(v)
    end
    return new_hash
end

# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}

def counted_characters (str)
    hash = Hash.new(0)
    arr = []

    str.each_char do |char|
        hash[char] += 1
    end

    hash.each do |key, v|
       arr << key if v > 2
    end
    arr
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true (str)
    (0...str.length-1).any? {|i| str[i] == str[i+1] && str[i] == str[i +2]}
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding (str, hash)
    new_str = ""

    str.each_char do |char|
        if hash.has_key?(char)
            new_str += hash[char]
        elsif char == " "
            new_str += char
        else
            new_str += "?"
        end
    end
    return new_str
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress (str)
    new_str = ""

    str.each_char.with_index do |char, i|
        num = str[i+1].to_i

        num.times {new_str += char}
    end
    return new_str
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

def conjunct_select (arr, *procs)
    arr.select {|ele| procs.all? {|proc| proc.call(ele)}}
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin (sen)
    words = sen.split(' ')

    new_sen = words.map do |word|
        if word.length >= 3
            change_word(word)
        else
            word
        end
    end
    new_sen.join(" ")
end

def change_word (word)
    vowels = "aeiou"

    return word + "yay" if vowels.include?(word[0].downcase)

    word.each_char.with_index do |char, i|
        if word[0] == word[0].upcase && vowels.include?(char)
            return (word[i..-1] + word[0...i] + "ay").capitalize
        elsif vowels.include?(char)
            return (word[i..-1] + word[0...i] + "ay").downcase
        end
    end
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate (sen)
    words = sen.split(' ')

    new_sen = words.map do |word|
        if word.length >= 3
            change_word(word)
        else
            word
        end
    end
    new_sen.join(' ')
end

def change_word(word)
    vowels = "aeiou"
    last_index = last_vowel_idx(word)

    return word + word.downcase if vowels.include?(word[-1])

    if word[0] == word[0].upcase
        return (word + word[last_index..-1]).capitalize
    else
        return word + word[last_index..-1]
    end
end

def last_vowel_idx (word)
    vowels = "aeiou"

    word.reverse.each_char.with_index do |char, i|
        if vowels.include?(char)
            return word.length-1 - i
        end
    end
end

# p reverberate('We like to go running fast')  # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select (arr, *procs)
    arr.select {|ele| procs.any? {|proc| proc.call(ele)}}
end

longer_four = Proc.new { |s| s.length > 4 }
contains_o = Proc.new { |s| s.include?('o') }
starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

def alternating_vowel (sen)
    words = sen.split(" ")

    new_sen = words.map.each_with_index do |word, i|
        if i % 2 == 0
            remove_first_vowel(word)
        else
            remove_last_vowel(word)
        end
    end
    new_sen.join(' ')
end

def remove_first_vowel (word)
    vowels = "aeiou"
    arr = []

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            arr << i
        end
    end

    if arr.length > 1
        return word[0...arr[0]] + word[arr[0] + 1..-1]
    else
        return word
    end
end

def remove_last_vowel (word)
    vowels = "aeiou"
    arr = []

    word.each_char.with_index do |char, i|
        if vowels.include?(char)
            arr << i
        end
    end

    if arr.length > 1
        return word[0...arr[-1]] + word[arr[-1] + 1..-1]
    else
        return word
    end
end

# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"

def silly_talk (sen)
    words = sen.split(" ")
    vowels = "aeiou"

    new_sen = words.map do |word|
        change_word(word)
    end
    new_sen.join(" ")
end

def change_word(word)
    vowels = "aieou"
    
    return word + word[-1] if vowels.include?(word[-1])

    new_word = ""

    word.each_char.with_index do |char, i|
        if vowels.include?(char.downcase)
            new_word += char + "b" + char.downcase
        else
            new_word += char
        end
    end
    return new_word
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress (str)
    new_str = ""
    i = 0

    while i < str.length
        char = str[i]
        count = 1
        i += 1

        while char == str[i]
            count += 1
            i += 1
        end
        if count > 1
            new_str += char + count.to_s
        else
            new_str += char
        end
    end
    return new_str
end


# def compress(string)
#     compressed = ''
#     letters = ('a'..'z').to_a
#     i = 0
#     while i < string.length
#         char = string[i]
#         count = 1
#         i += 1
#         while char == string[i]
#             count += 1
#             i += 1
#         end

#         if count > 1
#             compressed += char + count.to_s
#         else
#             compressed += char
#         end
#     end

#     compressed
# end
p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"