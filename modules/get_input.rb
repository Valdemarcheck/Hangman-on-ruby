require 'colorize'
require_relative './game_text'

# a module that lets PC get input from a player
module GetInput
  extend GameText
  # get any character from a to z
  def input_char
    say_ask_for_input
    char = gets.chomp.downcase
    # ask for input until it will be a single character that is
    # in range of a-z
    until char.length == 1 && char.match(/[a-z]/)
      tell_invalid_letter
      char = gets.chomp.downcase
    end
    char
  end

  # get either 'y' for yes or 'n' for no
  def input_yes_or_no
    say_ask_for_yes_or_no
    char = gets.chomp.downcase
    # ask for input until it will be 'y' or 'n'
    until char == 'y' || char == 'n'
      tell_invalid_yes_or_no
      char = gets.chomp.downcase
    end
    char
  end
end
