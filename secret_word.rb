require_relative 'modules/game_text'

# this class keeps the secret word inside, and also the splitted version of it
# to make the main guessing mechanic possible
class SecretWord
  include GameText
  attr_reader :word
  attr_accessor :hidden_word_array, :used_letters

  def initialize
    select_random_word
    # split the word and replace each character with _ sign
    @hidden_word_array = @word.split('').map { '_' }
    @used_letters = []
  end

  # prints a partly hidden version of the word
  def print_word
    sleep(0.2)
    puts '' # extra empty line for better spacing
    puts @hidden_word_array.join(' ')
  end

  # adds a letter to the list of already used ones
  def add_letter_to_used(letter)
    @used_letters.push(letter).sort
  end

  # replace '_' signs of the splitted word with a guessed letter
  def reveal_letters(letter)
    # go through each non-splitted word's character
    @word.split('').each_with_index do |char, index|
      # replace '_' with #{letter} if current character of not splitted word is this letter
      @hidden_word_array[index] = letter if char == letter
    end
  end

  private

  # select a random word from google-10000-english-no-swears.txt file and
  # make it the word that player needs to guess
  def select_random_word
    @word = ''
    word_list = File.open('google-10000-english-no-swears.txt', 'r')
    # search for a random word until it's length is between 5 and 12 letters
    until @word.length.between?(5, 12)
      @word = word_list.readlines.sample.chomp
      word_list.rewind # go back to the beginning of the list
    end
    word_list.close
  end
end
