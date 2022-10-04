require 'colorize'
require_relative './game_text'
module GetInput
  extend GameText
  def input_char
    say_ask_for_input
    char = gets.chomp.downcase
    until char.length == 1 && char.match(/[a-z]/)
      tell_invalid_letter
      char = gets.chomp.downcase
    end
    char
  end

  def input_yes_or_no
    say_ask_for_yes_or_no
    char = gets.chomp.downcase
    until char == 'y' || char == 'n'
      tell_invalid_yes_or_no
      char = gets.chomp.downcase
    end
    char
  end
end
