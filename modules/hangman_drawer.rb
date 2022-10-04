module HangmanDrawer
  # a fully drawn picture of a hangman
  HANGMAN_PICTURE = [
    '============= ',
    '||          | ',
    '||          | ',
    '||          | ',
    '||          o ',
    '||         /0|',
    '||         / |',
    '/\            ']

  # make an empty array where the hangman will be drawn
  # layer by layer
  def make_hangman_array
    @layer = -1
    @hangman_array = []
  end

  # print a hangman (only parts from @hangman_array variable)
  def print_hangman
    @hangman_array.each { |part| puts part }
  end

  # push a new layer of original hangman picture into
  # hangman_array variable
  def add_layer
    @hangman_array.unshift(HANGMAN_PICTURE[@layer])
    @layer -= 1
  end
end
