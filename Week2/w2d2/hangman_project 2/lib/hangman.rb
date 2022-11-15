
class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  # def self.random_word
  #     words = File.readlines("dictionary.txt").map(&:chomp)
  #     random_index = rand(0...words.length)
  #     words[random_index]
  #   end

  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length) {"_"}
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted? (char)
    @attempted_chars.include?(char)
  end
  
  def get_matching_indices (char)
    new_arr = []
    @secret_word.each_char.with_index do |ele, i|
      if ele == char
        new_arr << i
      end
    end
    return new_arr
  end

  def fill_indices (char, indices = get_matching_indices(char))
    indices.each {|i| guess_word[i] = char}
  end

  def try_guess (char)
    if already_attempted?(char)
      puts "that has already been attempted"
      return false
    end

    @attempted_chars << char
    arr = get_matching_indices(char)

    if arr.length == 0 
      @remaining_incorrect_guesses -= 1
    else
      fill_indices(char, arr)
    end
   return true
  end

  def ask_user_for_guess
    puts "Enter a char:"
    char = gets.chomp
    return try_guess(char)
  end

  def win?
    if @guess_word.join('') == @secret_word
      puts "WIN"
      return true
    end
      return false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      puts "LOSE"
      return true
    end
    return false
  end

  def game_over?
    if win? || lose?
      puts @secret_word
      return true
    end
    return false
  end
end
