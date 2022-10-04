require 'colorize'

# a module that keeps every line of text present in the game
module GameText
  # a separator for easier to look at UI
  def print_separator
    puts '==============================='
  end

  def say_greeting
    puts "#{'Hello!'.yellow} You're about to play a Hangman game implementation by #{'Valdemar_check'.yellow}"
    sleep(2)
    puts '(e.g. me - the author of this)'
  end

  def say_ask_for_rules
    sleep(1.5)
    puts "But before we begin, #{'should I explain you the rules of this game?'.yellow}"
  end

  def say_rules
    sleep(0.5)
    puts "Hangman is a #{'guessing game'.yellow} where one player thinks of a word and the"
    sleep(2)
    puts "other(s) tries to guess it by #{'suggesting letters'.yellow} within a certain #{'number of guesses'.yellow}"
    sleep(2)
    puts "However in my version of this game, you're about to play 'against' your PC #{'(guess a random word)'.yellow}"
    sleep(2)
    puts "You can input a wrong letter for #{'8 times'.yellow}, after you lose the last attempt,"
    sleep(2)
    puts 'you ultimately lose the game'.red
    sleep(2)
  end

  def say_announce_beginning
    sleep(0.5)
    puts "Let's begin!".green
  end

  def say_ask_for_input
    sleep(0.2)
    puts 'Input just one character from a to z'.blue
  end

  def say_ask_for_yes_or_no
    sleep(0.2)
    puts 'Input "y" to accept or "n" to decline'.blue
  end

  def say_tell_attempts(attempts)
    sleep(0.2)
    puts "You've got #{attempts.to_s.yellow} attempts left"
  end

  def say_letter_not_in_word
    sleep(0.1)
    puts "Oh.. it seems like the chosen letter #{'isn\'t in the given word'.red}"
  end

  def say_already_guessed(letter)
    sleep(0.1)
    puts "The letter #{letter} was already guessed".red
  end

  def say_letter_in_word(letter)
    sleep(0.1)
    puts "You've guessed the #{letter} Letter!".green
  end

  # prints letters which were used for guessing
  def print_used_letters(used_letters_array)
    puts "You've used those letters: #{used_letters_array}"
  end

  def say_win
    sleep(0.2)
    puts 'Great! You\'ve won against your PC!'.green
  end

  def say_lost
    sleep(0.2)
    puts 'It seems like you could\'t guess the word in 10 attempts...'.red
    sleep(0.5)
    puts 'Maybe next time ¯\_(ツ)_/¯'.red
  end

  def say_ask_for_restart
    sleep(0.2)
    puts "Would you like to play #{'once more?'.yellow}"
  end

  def say_goodbye
    sleep(0.2)
    puts 'See you next time!'.green
  end

  # invalid input messages

  def tell_invalid_letter
    puts 'Invalid input, you should input just one letter from a to z'.red
  end

  def tell_invalid_yes_or_no
    puts 'Invalid input, you should input "y" to accept or "n" to decline'.red
  end
end
