require 'colorize'
require_relative './game_text'
module GetInput
  extend GameText
  def input_char
    char = ''
    loop do
      char = gets.chomp.downcase
      break if char.length == 1 && char.match(/[a-z]/)
      say_invalid_input
    end
    char
  end

  def input_yes_or_no
    char = ''
    loop do
      char = gets.chomp.downcase
      break if char == 'y' || char == 'n'
      say_invalid_input
    end
    char
  end
end
