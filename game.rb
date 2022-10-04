require_relative 'modules/game_text'
require_relative 'modules/get_input'
require_relative 'modules/hangman_drawer'
require_relative 'secret_word'

# !!!!!!!!!!!!don't greet player if he plays one more time

# the main class where the whole game is established and played
class Game
  include GameText
  include GetInput
  include HangmanDrawer
  attr_reader :secret_word, :secret_word_array, :attempts

  def initialize
    @secret_word = SecretWord.new
    @attempts = 8
    make_hangman_array
    start_game
  end

  # main game loop
  def game_loop
    loop do
      print_hangman
      say_tell_attempts(@attempts)
      @secret_word.print_word
      input_letter_and_show_outcome
      win_or_lose
    end
  end

  private

  # output startup text and begin start the main game
  def start_game
    say_greeting
    say_ask_for_rules
    say_rules if input_yes_or_no == 'y'
    say_announce_beginning
    game_loop
  end

  # ask player to input any letter, and tell him what is the result of his prompt
  def input_letter_and_show_outcome
    letter = input_char # letter input

    # if the letter is in the word player is guessing and also it wasn't guessed earlier
    if @secret_word.word.include?(letter) && !@secret_word.hidden_word_array.include?(letter)
      say_letter_in_word(letter)
      @secret_word.reveal_letters(letter)
    # if the letter was already guessed earlier
    elsif @secret_word.hidden_word_array.include?(letter)
      say_already_guessed(letter)
    # if player didn't guess any letter
    else
      @attempts -= 1
      add_layer
      say_letter_not_in_word
    end
  end

  # announce win or lose of player
  def win_or_lose
    # if player has zero attempts but he still hasn't guessed the word
    if @secret_word.hidden_word_array.include?('_') && @attempts.zero?
      lose_game
    # if player guessed the word
    elsif !@secret_word.hidden_word_array.include?('_')
      win_game
    end
  end

  # tell player that he won
  def win_game
    say_win
    restart_game
  end

  # tell player that he lost
  def lose_game
    say_lost
    restart_game
  end

  # ask player for restart
  def restart_game
    say_ask_for_restart
    answer = input_yes_or_no
    # if he refuses to restart
    if answer == 'n'
      say_goodbye
      exit(1)
    # if he wants to restart
    else
      Game.new
    end
  end
end

Game.new
