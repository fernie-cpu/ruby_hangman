require_relative 'display.rb'

class Game
  def random_word
    words_list = IO.readlines('5desk.txt')
    random_number = rand * words_list.length.to_i
    words_list[random_number]
  end

  def word_selection
    loop do
      @word = random_word
      break if @word.length >= 7 && @word.length <= 14
    end
    puts @word
    word_array = @word.split(//)
    @solution = word_array[0..word_array.length - 3]
    print @solution
    puts ''
  end

  def display_blanks(letter = nil)
    @solution.each do |item|
      if letter.nil?
        print '_' 
      elsif item.include?(letter.downcase || letter.upcase)
        print item
      else
        print '_'
      end
    end
    puts ''
  end

  def player_turn
    @available_letters = ('a'..'z').to_a
    player_guess
    display_blanks(@player_guess)
    @available_letters.delete(@player_guess.downcase)

    print @available_letters
    puts ''
  end

  def player_guess
    puts 'Guess a letter'
    loop do
      @player_guess = gets.chomp
      break if @player_guess.length == 1 && @available_letters.include?(@player_guess.downcase)

      puts 'You guess should only be 1 letter that has not been guessed'
    end
  end

  def play
    introduction
    puts ""
    puts "Random word is:"
    word_selection
    display_blanks
    player_turn
  end
end