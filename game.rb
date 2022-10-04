require_relative 'modules/game_text'
require_relative 'modules/get_input'
require_relative 'secret_word'

class Game
  include GameText
  include GetInput
  attr_reader :secret_word, :secret_word_array, :attempts

  def initialize
    @secret_word = SecretWord.new
    @attempts = 8
    start_game
  end

  def game_loop
    loop do
      @secret_word.print_word
      input_letter_and_show_outcome
      win_or_lose
    end
  end

  private

  def input_letter_and_show_outcome
    letter = input_char
    if @secret_word.word.include?(letter)
      @secret_word.reveal_letters(letter)
    elsif !@secret_word.hidden_word_array.include?(letter)
      @attempts -= 1
      say_letter_not_in_word
      say_tell_attempts(@attempts)
    end
  end

  def win_or_lose
    if @secret_word.hidden_word_array.include?('_') && @attempts.zero?
      lose_game
    elsif !@secret_word.hidden_word_array.include?('_')
      win_game
    end
  end

  def start_game
    say_greeting
    say_ask_for_rules
    say_rules if input_yes_or_no == 'y'
    say_announce_beginning
    game_loop
  end

  def win_game
    say_win
    restart_game
  end

  def lose_game
    say_lost
    restart_game
  end

  def restart_game
    say_ask_for_restart
    answer = input_yes_or_no
    if answer == 'n'
      say_goodbye
      exit(1)
    else
      Game.new
    end
  end
end

Game.new
