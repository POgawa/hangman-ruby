require './lib/hangman'

  @game

def game_start
  puts "\n\n\n\nWelcome to Hangman! Please enter the word to be guessed.\nGuessing player, don't look and cheat!"
  new_word = gets.chomp
  @game = Hangman.new(new_word)
  game_menu
end

def game_menu
  if @game.misses_count < 6
    system('clear')
    gallows
    puts "#{@game.output}\nMisses: #{@game.misses_string}\nWhat letter do you want to guess?"
    guess_letter = gets.chomp
    if guess_letter == "exit"
      puts "Goodbye."
    elsif guess_letter.length > 1
      puts "Please only enter one letter at a time."
      game_menu
    else
      @game.guess(guess_letter)
      if(@game.is_won?)
        winner_menu
      else
        game_menu
      end
    end
  else
    gallows
    loser_menu
  end
end

def loser_menu
  puts "\nThat was pathetic. The word was obviously #{@game.word}. Please try harder next time, or, if that was your best, get a friend to help."
  game_start
end

def winner_menu
  system('clear')
  puts "Congratulations! You are excellent at children's games."
  game_start
end

def gallows
  case @game.misses_count
  when 0
    puts "_______\n|     |\n|     \n|     \n|     \n______\n"
  when 1
    puts "_______\n|     |\n|     O\n|     \n|     \n______\n"
  when 2
    puts "_______\n|     |\n|     O\n|     I\n|     \n______\n"
  when 3
    puts "_______\n|     |\n|     O\n|     I\n|      \\\n______\n"
  when 4
    puts "_______\n|     |\n|     O\n|     I\n|    / \\\n______\n"
  when 5
    puts "_______\n|     |\n|     O\n|    |I\n|    / \\\n______\n"
  when 6
    puts "_______\n|     |\n|     O\n|    |I|\n|    / \\\n______\n"
  end
end

game_start
