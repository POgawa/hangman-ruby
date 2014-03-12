require 'rspec'
require 'hangman'

describe Hangman  do
  it 'should output an empty array matching an input' do
    test_game = Hangman.new("word")
    test_game.output.should eq ["_", "_", "_", "_"]
  end

  it 'should update the output for a correct guess in multiple spaces' do
    test_game = Hangman.new("worw")
    test_game.guess("w")
    test_game.output.should eq ["w", "_", "_", "w"]
  end

  describe '.guessed_letters' do
    it 'should return the letters guessed in a string' do
      test_game = Hangman.new("worw")
      test_game.guess("w")
      test_game.guess("z")
      test_game.guessed_letters.should eq "w, z"
    end
  end
end
