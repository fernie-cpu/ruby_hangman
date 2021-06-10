require_relative 'display.rb'

class Game
  def random_word
    words_list = IO.readlines('5desk.txt')
    random_number = rand * words_list.length.to_i
    words_list[random_number]
  end

  def select_word
    word = random_word
    puts word if word.length >= 5 && word.length <= 12
  end

  def play
    introduction
    select_word
  end
end