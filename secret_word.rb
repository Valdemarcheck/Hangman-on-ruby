require_relative 'modules/game_text'
class SecretWord
  include GameText
  attr_reader :word
  attr_accessor :hidden_word_array

  def initialize
    select_random_word
    @hidden_word_array = @word.split('').map { '_' }
  end

  def print_word
    puts @hidden_word_array.join(' ')
  end

  def reveal_letters(letter)
    @word.split('').each_with_index do |char, index|
      @hidden_word_array[index] = letter if char == letter
    end
  end

  private

  def select_random_word
    @word = ''
    word_list = File.open('google-10000-english-no-swears.txt', 'r')
    until @word.length.between?(5, 12)
      @word = word_list.readlines.sample.chomp
      word_list.rewind
    end
    word_list.close
  end
end
