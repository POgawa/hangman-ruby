class Hangman
  def initialize(word)
    @word = word
    @word_array = @word.split("")
    @output = []
    @guessed_letters = []
    @misses = []
    for i in 1..@word_array.length
      @output << "_"
    end
  end

  def output
    @output.join(" ")
  end
  def guess(letter)
    if @guessed_letters.include?(letter) == false
      @guessed_letters << letter
      if @word_array.include?(letter) == true
        @word_array.each_with_index do |word_letter, index|
          if word_letter == letter
            @output[index] = letter
          end
        end
      else
        @misses << letter
      end
      return true
    else
      return false
    end
  end

  def is_won?
    if @output.include?("_")
      false
    else
      true
    end
  end

  def word
    @word
  end

  def misses_string
    @misses.join(", ")
  end

  def misses_count
    @misses.length
  end

  def guessed_letters
    @guessed_letters.join(", ")
  end
end
