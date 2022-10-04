require 'colorize'
module GameText
  def say_greeting
    puts "#{'Hello!'.yellow} You're about to play a Hangman game implementation by #{'Valdemar_check'.yellow}"
    puts '(e.g. me - the author of this)'
  end

  def say_ask_for_rules
    puts "But before we begin, #{'should I explain you the rules of this game?'.yellow}"
  end

  def say_rules
    # add rules
  end

  def say_announce_beginning
    puts "Let's begin!".green
  end

  def say_ask_for_input
    puts 'Input any (just one!) character from latin alphabet'.blue
  end

  def say_invalid_input
    puts 'Invalid input'.red
  end

  def say_tell_attempts(attempts)
    puts "You've got #{attempts.to_s.yellow} attempts left"
  end

  def say_failure
    puts 'Oh.. it seems like the chosen letter isn\'t in the given word'
  end

  def say_win
    puts 'Great! You\'ve won against your PC!'
  end

  def say_lost
    puts 'It seems like you could\'t guess the word in 10 attempts...'
    puts 'Maybe next time'.green
  end

  def say_ask_for_restart
    puts 'Would you like to play once more?'.blue
  end

  def say_goodbye
    puts 'See you next time!'.green
  end
end
